<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>회원 상세정보</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<ul>
			<li>이름: {{user.userName}}</li>
			<li>아이디: {{user.userId}}</li>
			<li>성별: {{user.gender}}</li>
			<li>핸드폰 번호: {{user.phone}}</li>
		</ul>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	id: "${map.userId}",
    	user: {}
    }   
    , methods: {
    	fnList: function(){
            var self = this;
            var nparmap = {id: self.id};
            $.ajax({
                url:"userInfo.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	self.user = data.user;
                }
            });
        }
    }
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>