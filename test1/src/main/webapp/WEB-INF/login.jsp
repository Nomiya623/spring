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
			<a id="kakao-login-btn" href="javascript:;" @click= "fnKakaoLogin">
  			<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="111" 
    		alt="카카오 로그인 버튼" />
			</a>
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
            var nparmap = {
            		id : self.id, 
            		pwd : self.pwd};
            $.ajax({
                url:"login.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert(response.message)
                	if(response.result == "success"){
                		// 페이지 이동
                		alert(response.message);
                		location.href="/main.do";
                	} else {
                		alert(response.message);
                	}
                }
            }); 
        },
        fnKakaoLogin: function(){
        	location.href="https://kauth.kakao.com/oauth/authorize?client_id=" + "24c91e49c9fadfcadd37f2738226cf25" + "&redirect_uri=" + "http://localhost:8080/kakaoLogin.do" + "&response_type=code";

        }
    }   
    , created: function () {
    	var self = this;
    	//
	}
});

</script>