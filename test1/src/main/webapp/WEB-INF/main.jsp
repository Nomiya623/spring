<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>메인 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<button @click="fnUpdate">회원정보 수정</button>
		<button @click="fnEnterBoard">게시판 입장</button>
		<div>
			<button v-if="smsFlg" @click="fnSMS">문자 테스트</button>
			<template v-if="!smsFlg">
				<input type="text" v-model="inputNum" :placeholder="timeString"><button @click="fnAuth">인증</button>
			</template>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	inputNum: "",
    	getNum: "",
    	smsFlg: true,
        time: 30000, 
        timeString: '0:30'
    }   
    , methods: {
    	fnUpdate: function(){
            location.href = "/user/edit.do";
        },
        fnEnterBoard: function() {
        	$.pageChange("/boardList.do", {});
		},
		fnSMS: function() {
			var self = this;
            var nparmap = {};
            $.ajax({
                url:"send-one",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data);
                	if(data.response.statusCode == "2000") {
	                	alert("문자 전송 완료");
	                	self.getNum = data.number;
	                	self.smsFlg = false;
	                	self.fnTimer();
                	} else {
                		alert("문자 전송 실패");
                	}
                }
            });
		},
		fnAuth: function() {
			var self = this;
			if(self.inputNum == self.getNum) {
				alert("인증 완료");
			} else {
				alert("인증 실패");
			}
		},
		fnTimer: function() {
			var self = this;
			var playTime = setInterval(function() {
				self.time -= 1000; // 1초씩 감소
                var min = Math.floor(self.time / (60 * 1000)); // 분 계산
                var sec = Math.floor((self.time % (60 * 1000)) / 1000); // 초 계산

                // 초와 분을 문자열로 조합하여 출력
                self.timeString = min + ':' + (sec < 10 ? '0' + sec : sec);

                // 시간이 다 되었을 때 clearInterval 호출
                if (self.time === 0) {
                    clearInterval(playTime);
                    alert("시간 초과");
                    self.smsFlg = true;
                }
			}, 1000);
		}
    }
    , created: function () {
    	var self = this;
	}
});
</script>