<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>게시판 상세보기</title>
</head>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .detail-view {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        .detail-view h2 {
            color: #333;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .detail-view p {
            line-height: 1.6;
            color: #666;
        }
        .detail-view strong {
            color: #333;
        }
        .detail-content {
            white-space: pre-line; /* Respect line breaks and white spaces */
            margin-top: 20px;
            background-color: #f9f9f9;
            padding: 15px;
            border-left: 3px solid #007bff;
            color: #333;
        }
    </style>
<body>
	 <div id="app">
	<div class="detail-view">
            <h2>제목: {{info.title}}</h2>
            <p><strong>번호:</strong> {{info.boardNo}}</p>
            <p><strong>조회수:</strong> {{info.hit}}</p>
            <p><strong>작성자:</strong> {{info.userName}}</p>
            <p><strong>작성일:</strong> {{info.cdatetime}}</p>
            <p><strong>내용:</strong></p>
            <div>{{info.contents}}</div>
        </div>
        <!--start  -->
		<div v-if="info.userId === sessionId || sessionStatus == 'A'">
		<button  @click="fnDelete" >삭제</button>
		</div>
		<!-- end -->
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	boardNo : "${map.boardNo}",
    	sessionId: "${userId}", 
        sessionStatus: "${userStatus}", 
    	info: {}	
    }, 
    methods: {
    	fnView : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"/boardDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.info = data.info;
                },
                error: function(xhr, status, error){
                	console.error("에러발생 : " + error);
                }
            }); 
        },
        /* start */
        fnDelete: function() {
    	var self = this;
   		if (confirm("삭제하시겠습니까?")) {
        $.ajax({
            url: "/boardDelete.dox", 
            dataType: "json",
            type: "POST",
            data: { boardNo: self.boardNo },
            success: function(response) {
                if (response.success) {
                    alert("게시글이 삭제되었습니다.");
                    window.location.href = "/boardList.do"; 
                } else {
                    alert("삭제 실패: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error("삭제 에러 발생: " + error);
            }
        });
    }
}

        /* end */
        /* add method if needed */
    },
    created: function () {
    	var self = this;
		self.fnView();
	}
});
</script>