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
				<th width="7%">번호</th>
				<th width="40%">제목</th>
				<th width="8%">조회수</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{item.boardNo}}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo)">{{item.title}}</a></td>
				<td>{{item.hit}}</td>
				<td>{{item.userName}}</td>
				<td>{{item.cdatetime}}</td>
			</tr>
		</table>
		<div v-if="userId != '' && userId != undefined">
			<button @click="fnInsert">글쓰기</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${userId}",
    	list : []
    }   
    , methods: {
    	fnList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"boardList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data.list);
                	self.list = data.list;
                }
            }); 
        },
        fnView : function(boardNo){
        	$.pageChange("/boardView.do", {boardNo : boardNo});
        },
        fnInsert : function(){
        	location.href="/boardInsert.do";
        }
    }   
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>