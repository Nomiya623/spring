<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
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
		<div>학번검색 : 
			<input type="text" v-model="keyword" @keyup.enter="fnGetList">
			<button @click="fnGetList">검색</button>
		</div>
		<div>학년 : <input type="text" v-model="grade"> </div>
		
	<div>
        <label><input type="checkbox" v-model="dept" value="컴퓨터정보"> 컴퓨터정보</label>
        <label><input type="checkbox" v-model="dept" value="기계"> 기계</label>
        <label><input type="checkbox" v-model="dept" value="전기전자"> 전기전자</label>
        <button @click="fnGetList">검색</button>
    </div>
		
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
			<tr v-for="(item, index) in list">
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.stuDept}}</td>
				<td>{{item.stuGrade}}</td>
				<td>
					<span style="color:blue;" v-if="item.stuGender == 'M'">남자</span>
					<span style="color:red;" v-else>여자</span>
				</td>
				<td><button @click="fnEdit(item.stuNo)">수정</button></td>
				<td><button>삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		grade : "",
		keyword : "",
		dept : ["컴퓨터정보", "기계", "전기전자"]
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            console.log(self.dept);
            var nparmap = {
            		keyword : self.keyword,
            		dept : JSON.stringify(self.dept)	
            };
            $.ajax({
                url:"stu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
                }
            }); 
        },
        fnEdit : function(stuNo){
            var self = this;
            var nparmap = {stuNo : stuNo, stuGrade : self.grade};
            $.ajax({
                url:"stu/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다!");
                	self.fnGetList();
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();

	}
});
</script>