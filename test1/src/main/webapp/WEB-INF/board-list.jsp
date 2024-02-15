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
table, div {
	margin: 10px;
}

table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center; body { font-family : Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

#app {
	background: white;
	max-width: 800px;
	margin: auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	background-color: #fff;
}

th {
	background-color: #f2f2f2;
}

th, td {
	text-align: left;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

button {
	background-color: #4CAF50; /* Green */
	color: white;
	padding: 10px 20px;
	margin: 10px 0;
	border: none;
	cursor: pointer;
	border-radius: 4px;
}

button:hover {
	background-color: #45a049;
}

div {
	padding: 10px;
}
}
</style>
</head>
<style>
</style>
<body>
	<div id="app">
	<div>
		<select v-model ="keywordType">
			<option value="title">제목</option>
			<option value="user">작성자</option>
		</select>
		검색 : <input type = "text" placeholder= "검색어 입력" v-model = "keyword" @keyup.enter="fnList">
		<button @click= "fnList">검색</button>
	</div>
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
				<td><a href="javascript:;" @click="fnView(item.boardNo)">{{item.title}}
				<span v-if="item.commCnt != 0" style="color:blue;">
					({{item.commCnt}})				
				</span>
				</a></td>
				<td>{{item.hit}}</td>
				<td><a href="javascript:;" @click="fnUserDetail(item.userId)">{{item.userName}}</a></td>
				<td>{{item.cDate}}</td>
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
		el : '#app',
		data : {
			userId : "${userId}",
			list : [],
			keyword: "",
			keywordType: "title"
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {keyword : self.keyword, keywordType : self.keywordType};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
			},
			fnView : function(boardNo) {
				$.pageChange("/boardView.do", {
					boardNo : boardNo
				});
			},
			fnInsert : function() {
				location.href = "/boardInsert.do";
			},
			fnUserDetail : function(userId) {
				$.pageChange("/userDetail.do", {userId : userId});
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>