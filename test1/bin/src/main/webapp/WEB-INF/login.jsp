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
			아이디 : <input type="text" v-model="id">
		</div>
		<div>
			비밀번호 : <input type="password" v-model="pwd">
		</div>
		<div>
			<button @click="login">로그인</button>
			<button>회원가입</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : "",
    	pwd : ""
    }   
    , methods: {
    	login : function(){
            var self = this;
            var nparmap = {id : self.id, pwd : self.pwd};
            $.ajax({
                url:"login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert(data.message);
                	if(data.result == "success"){
                		// 페이지 이동
                		location.href="/main.do";
                	}
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	//
	}
});
</script>