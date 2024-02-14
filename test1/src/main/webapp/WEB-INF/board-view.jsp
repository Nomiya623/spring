<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>첫번째 페이지</title>
	<style>
		table, div{
			margin : 10px;
		}
		table, tr, th, td {
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px 10px;
			text-align: center;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">{{info.title}}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{info.userName}}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>{{info.contents}}</td>
			</tr>
		</table>
		<div v-if="info.userId == sessionId || sessionStatus == 'A'">
			<button @click="fnRemove">삭제</button>
			<button @click="fnUpdate">수정</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	boardNo : "${map.boardNo}",
    	sessionId : "${userId}",
    	sessionStatus : "${userStatus}",
    	info : {}
    }   
    , methods: {
    	fnView : function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"boardDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnRemove : function(){
        	var self = this;
        	if(!confirm("삭제할거냐?")){
        		return;
        	}
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"boardRemove.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.result == "success"){
                		alert("삭제되었습니다.");
                		$.pageChange("/boardList.do", {});
                		// location.href ="/boardList.do";
                	} else {
                		alert("다시 시도해주세요.");
                	}
                }
            });
        },
        fnUpdate : function(){
        	var self = this;
        	$.pageChange("/boardUpdate.do", {boardNo : self.boardNo});
        }
    }   
    , created: function () {
    	var self = this;
		self.fnView();
	}
});
</script>