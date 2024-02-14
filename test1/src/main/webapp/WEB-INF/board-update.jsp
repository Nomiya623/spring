<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			제목 : <input type="text" v-model="title">
		</div>
		<div>
			내용 : <textarea rows="5" cols="40" v-model="contents"></textarea>
		</div>
		<div>
			<button @click="fnInsert">저장</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${userId}",
    	title : "",
    	contents : "",
    	boardNo : "${map.boardNo}"
    }   
    , methods: {
    	fnBoardInfo: function(){
            var self = this;
            var nparmap = {boardNo : self.boardNo};
            $.ajax({
                url:"boardDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.result == "success"){
                		self.title = data.info.title;
                		self.contents = data.info.contents;
                	} else {
                		alert("오류 발생");
                	}
                }
            }); 
        },
    	fnInsert : function(){
            var self = this;
            var nparmap = {title : self.title, contents : self.contents, boardNo : self.boardNo};
            $.ajax({
                url:"boardUpdate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.result == "success"){
                		alert("저장되었습니다");
                		location.href = "/boardList.do";
                	} else {
                		alert("에러 발생");
                	}
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnBoardInfo();
	}
});
</script>