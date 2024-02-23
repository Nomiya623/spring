<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
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
		<h2>BBS 테이블</h2>
	<table border="1">
	    <tr>
	    	<th>번호</th>
	        <th>제목</th>
	        <th>내용</th>
	        <th>조회수</th>
	        <th>사용자 아이디</th>
	        <th>작성일</th>
	        <th>수정일</th>
	        <th>수정</th>
	        <th>삭제</th>
	    </tr>
  
        <tr v-for="item in list">
            <td>{{item.bbsNum}}</td>
            <td>{{item.title}}</td>
            <td>{{item.contents}}</td>
            <td>{{item.hit}}</td>
            <td>{{item.userId}}</td>
            <td>{{item.cDate}}</td>
            <td>{{item.uDate}}</td>
            <td><button @click="fnEdit(item.bbsNum)">수정</button></td>
			<td><button @click="fnEdit(item.bbsNum)">삭제</button></td>
        </tr>
  
	</table>
	<button onclick="window.location.href='bbsInsert.do'">글쓰기</button>
	</div>
</body>
</html>

<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
            list: [] 
        },
        methods: {
            fnList: function() {
                var self = this;
                var nparmap = {};
                $.ajax({
                    url: "bbsList.dox",
                    dataType: "json",    
                    type: "POST", 
                    data: nparmap,
                    success: function(data) {
                        self.list = data.list; 
                    },
                    error: function(error) {
                        console.log("에러 빌셍", error);
                    }
                }); 
            },
            fnEdit: function(bbsNum) {
            	var self = this;
            	$.pageChange("/bbsEdit.do", {bbsNum: bbsNum});
               
            },
            fnDelete: function(bbsNum) {
            	var self = this;
            	$.pageChange("/bbsDeletet.do", {bbsNum: bbsNum});
                
            }
        },
        created: function() {
            this.fnList(); 
        }
    });
</script>