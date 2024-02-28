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
        핸드폰 번호: <input type="text" v-model="phoneNumber">
        <button @click="sendAuthCode">인증 코드 전송</button>
    </div>
    <div v-if="authCodeSent">
        인증 코드: <input type="text" v-model="authCode">
        <button @click="verifyAuthCode">인증 확인</button>
    </div>
    <div v-if="authVerified">
        새 비밀번호: <input type="password" v-model="newPassword">
        <button @click="resetPassword">비밀번호 재설정</button>
    </div>
	</div>


</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
        phoneNumber: '',
        authCode: '',
        newPassword: '',
        authCodeSent: false,
        authVerified: false
    },
    methods: {
        sendAuthCode: function() {
            // 서버에 인증 코드 전송 요청
            $.ajax({
                url: '/send-one',
                method: 'POST',
                data: { phoneNumber: this.phoneNumber },
                success: function(response) {
                    alert('인증 코드가 전송되었습니다.');
                    this.authCodeSent = true;
                }.bind(this)
            });
        },
        verifyAuthCode: function() {
        	var self = this;
            if(self.user.phoneNumber == self.authCode){
        		alert("성공!");
        	} else {
        		alert("실패!");
        	}
        },
        resetPassword: function() {
            // 서버에 비밀번호 재설정 요청
            $.ajax({
                url: '/password-reset.dox',
                method: 'POST',
                data: {
                    phoneNumber: this.phoneNumber,
                    newPassword: this.newPassword
                },
                success: function(response) {
                    alert('비밀번호가 재설정되었습니다.');
                }
            });
        }
    }
});

</script>