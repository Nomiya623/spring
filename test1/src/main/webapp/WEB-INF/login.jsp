<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>로그인</title>
</head>
<style>
	fieldset {
		width: 300px;
	}
	span {
		margin-left: 15px;
	}
	div {
		margin: 10px;
	}
</style>
<body>
	<div id="app">
		<fieldset>
			<legend>로그인</legend>
			<div>
				아이디: <span><input type="text" v-model="id"></span>
			</div>
			<div>
				비밀번호: <input type="password" v-model="pwd" @keyup.enter="fnLogin">
			</div>
			<div>
				<button @click="fnLogin">로그인</button>
				<button @click="fnJoin">회원가입</button>
				<button @click="fnFindPassword">비밀번호 찾기</button>
				<div>
					<a href="javascript:;" @click="fnKakao" style="cursor: pointer; margin: -10px;"><img alt="" src="../img/kakao_login_medium.png"></a>
				</div>
			</div>
		</fieldset>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id: "",
    	pwd: ""
    }   
    , methods: {
    	fnLogin : function(){
            var self = this;
            var nparmap = {id : self.id, pwd : self.pwd};
            $.ajax({
                url:"login.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	alert(data.message);
                	if(data.result == "success") {
                		// 페이지 이동
                		location.href= "/main.do";
                	}
                }
            }); 
        },
        fnJoin : function(){
			location.href="/join.do";
        },
        fnFindPassword: function() {
			var self = this;
			location.href="/find-password.do";
		},
		fnKakao: function() {
			location.href="https://kauth.kakao.com/oauth/authorize?client_id=" + "24c91e49c9fadfcadd37f2738226cf25" + "&redirect_uri=" + "http://localhost:8080/kakaoLogin.do" + "&response_type=code";
		}
    }   
    , created: function () {
    	var self = this;
	}
});
</script>