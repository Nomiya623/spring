<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/menu.jsp"></jsp:include>
<title>학생 페이지</title>
</head>
<style>
	table{
		margin: 10px;
	}

	table, tr, th, td{
		border: 1px solid black;
		border-collapse:collapse ;
		padding: 5px 10px;
		text-align: center;
	}
	.button{
	
		}
</style>
<body>
	<div id="app">
	<div>검색 : <input type ="text" v-model = "keyword">
				<button @click="fnGetList">검색</button>
	</div> <!-- 학번검색 -->
	
	<div>학년 : <input type ="text" v-model = "grade"></div>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>성별</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr v-for="(item,index) in list">
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.stuDept}}</td>
				<td>{{item.stuGrade}}</td>
				<td>
				<!-- <span>{{item.stuGender}}</span> -->
				<span style="color: red;" v-if = "item.stuGender == 'M'">남자</span>
				<span style="color: blue;" v-else>여자</span>
				
				</td>
				<td><button @click = "fnEdit(item.stuNo)">수정</button></td>
				<td><button @click = "fnRemove(item.stuNo)">삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			grade : "",
			keyword : ""
		},
		methods : {
			fnGetList : function() {
				var self = this;
				var nparmap = { keyword : self.keyword };
				$.ajax({
					url : "/stu/list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
			},
			fnEdit : function(stuNo) {
				var self = this;
				var nparmap = {stuNo : stuNo, stuGrade : self.grade};
				$.ajax({
					url : "stu/edit.dox", 
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						alert("수정되었습니다");
						self.fnGetList();
					}
				});
			},
		
			fnRemove : function(stuNo) {
				var self = this;
				var nparmap = {stuNo : stuNo, stuGrade : self.grade};
				$.ajax({
					url : "stu/remove.dox", 
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						alert("삭제되었습니다");
						self.fnGetList();
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnGetList();

		}
	});
</script>