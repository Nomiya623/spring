<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="js/jquery.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <title>회원가입</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    #app {
        max-width: 400px; /* Adjusted for consistency */
        margin: auto;
        background-color: #fff;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    #app input[type="text"],
    #app input[type="password"],
    #app input[type="radio"],
    #app button,
    #app input[type="text"].phone {
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    #app input[type="radio"] {
        width: auto;
        margin-right: 5px;
    }

    #app input[type="text"].phone {
        width: calc(33% - 20px); /* Adjusted for 3 inputs in one line */
        margin-right: 10px;
    }

    #app button {
        width: auto; /* Adjusted for better layout */
        padding: 10px 15px; /* More padding for a better look */
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        display: block; /* Make buttons block level for full width */
        margin-top: 20px; /* More space above the button */
    }

    #app button:hover {
        background-color: #0056b3;
    }
    
    #app span {
        display: inline-block;
        width: 110px; /* Consistent label width */
    }

    #app div {
        margin-bottom: 15px; /* Spacing between form groups */
    }
</style>

</head>
<body>
    <div id="app">
        <div>
        	<span>아이디: </span>
	   <!-- <input v-if="checkFlg" type="text" v-model="user.id" disabled>
        	<input v-else type="text" v-model="user.id">
        	<button @click="fnCheck">중복체크</button> -->
        	<input type="text" v-model="user.id" @keyup="fnCheck">
        	<div v-if="user.id != ''">
		       	<div v-if="checkFlg" style="color: blue;">사용 가능한 아이디입니다.</div>
		       	<div v-else style="color: red;">중복된 아이디입니다.</div>
        	</div>
        </div>
        <div><span>비밀번호: </span> <input type="password" v-model="user.pwd"></div>
        <div><span>비밀번호 확인: </span> <input type="password" v-model="user.pwd2"></div>
        <div><span>이름: </span> <input type="text" v-model="user.name"></div>
        <div><span>핸드폰 번호: </span>
            <input type="text" class="phone" v-model="user.phone1" :disabled="authFlg">-
            <input type="text" class="phone" v-model="user.phone2" :disabled="authFlg">-
            <input type="text" class="phone" v-model="user.phone3" :disabled="authFlg">
            <button v-if="!smsFlg" @click="fnSms">인증하기</button>
            <template v-if="smsFlg">
            	<input type="text" v-model="inputNum" :placeholder="timeString">
            	<button @click="fnAuth">확인</button>
            </template>
        </div>
        <div><span>성별: </span> 
            <input type="radio" name="gender" value="남성" v-model="user.gender">남
            <input type="radio" name="gender" value="여성" v-model="user.gender">여
        </div>
        <div>
            <button @click="fnJoin">회원가입</button>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
        user: {
            id: "",
            pwd: "",
            pwd2: "",
            name: "",
            phone1: "",
            phone2: "",
            phone3: "",
            gender: "남성"
        },
        checkFlg: false,
        smsFlg: false,
        authFlg: false,
        getNum: "",
        inputNum: "",
        time: 30000,
        timeString: '0:30',
    }, 
    methods: {
        fnJoin: function(){
            var self = this;
            if(!self.checkFlg) {
            	alert("중복체크 후 누르세요!");
            	return;
            }
            var engNum =  /^[a-zA-Z0-9]*$/;
            if(self.user.id == "") {
            	alert("아이디를 입력하세요!");
                return;
            }
            if(self.user.id != engNum) {
            	alert("영어와 숫자만 입력하세요!");
                return;            	
            }
            if(self.user.pwd == "") {
            	alert("비밀번호를 입력하세요!");
                return;
            }
            if(self.user.pwd != engNum) {
            	alert("영어와 숫자만 입력하세요!");
                return;            	
            }
            if(self.user.pwd != self.user.pwd2){
                alert("비밀번호를 같게 쓰세요!");
                return;
            }
            if(!(self.authFlg)) {
            	alert("핸드폰 번호를 인증하세요!");
            	return;
            }
            var phone = self.user.phone1 + self.user.phone2 + self.user.phone3;
            var nparmap = self.user;
            nparmap.phone = phone; // key를 새로 생성해서 거기에 value를 담아준 거임
            $.ajax({
                url:"join.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                    alert("가입됐습니다!");
                    location.href = "/login.do";
                }
            }); 
        },
    	fnCheck: function(){
	        var self = this;
	        var nparmap = {id : self.user.id};
	        $.ajax({
	            url:"check.dox",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
	            	if(data.result == "success") {
	            		self.checkFlg = true;
	            	} else {
	            		self.checkFlg = false;
	            	}
					/* if(data.result == "success") {
						if(confirm(data.message)) {
							self.checkFlg = true;
						}
					} else {
						alert(data.message);
					} */
	            }
	        });
    	},
    	fnSms: function() {
			var self = this;
			if(self.user.phone1 == "" || self.user.phone2 == "" || self.user.phone3 == "") {
				alert("인증하기 전에 핸드폰 번호를 작성하세요!");
				return;
			}
	        var nparmap = {
	        		phone1: self.user.phone1, phone2: self.user.phone2, phone3: self.user.phone3
	        };
	        $.ajax({
	            url:"send-one",
	            dataType:"json",
	            type: "POST", 
	            data: nparmap,
	            success: function(data) {
                	if(data.response.statusCode == "2000") {
	                	alert("문자 전송 완료");
	                	self.getNum = data.number;
	                	self.smsFlg = true;
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
				self.authFlg = true;
				self.time = 3000;
				
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
    }, 
    created: function () {
        var self = this;
    }
});
</script>