<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>게시판 목록</title>
</head>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            
        }
        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
           
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            color: #666;
            text-align: center;
        }
        th {
            background-color: #f0f0f0;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
<body>
	<div id="app">

	<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{item.boardNo}}</td>
				<td><a href="javascript:;" @click= "fnView(item.boardNo)">{{item.title}}</a></td>
				<td>{{item.hit}}</td>
				<td>{{item.userName}}</td>
				<td>{{item.cdatetime}}</td>
				
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list : []
    	
    }   
    , methods: {
    	fnList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/boardList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                },
                error: function(xhr, status, error){
                	console.error("에러발생 : " + error);
                }
            }); 
        },
        
       fnView : function(boardNo){
			$.pageChange("/boardView.do", {boardNo : boardNo});    	   
       } 
    }   
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>