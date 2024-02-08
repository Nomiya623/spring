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
		<div v-for = "item in student">
		<div>이름 : {{list.stuName}}</div>
		<div>학번 : {{list.stuNo}}</div>
		<div>학과 : {{list.stuDept}} </div>
		</div>
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
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"stuInfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
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