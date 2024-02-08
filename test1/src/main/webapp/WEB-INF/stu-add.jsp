<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/layout/menu.jsp"></jsp:include>
<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
			<div>학번: <input type =  "text" v-model="stuInfo.stuNo"></div>
			<div>이름: <input type =  "text" v-model="stuInfo.stuName"></div>
			<div>학과: <input type =  "text" v-model="stuInfo.stuDept"></div>
			<div>학년: <input type =  "text" v-model="stuInfo.stuGrade"></div>
			<div>성별: <input type =  "text" v-model="stuInfo.stuGender"></div>
			<div><button @click = "fnAdd(item.stuNo)">저장</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		stuInfo {
			stuNo : "",
			stuName : "",
			stuDept : "",
			stuGrade : "",
			stuGender : ""
		}
		
    }   
    , methods: {
    	fnAdd : function(){
            var self = this;
            var nparmap = self.stuInfo;
            $.ajax({
                url:"stu/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
                	alert("추가되었습니다");
                	/* self.fnAdd(); */
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	

	}
});
</script>