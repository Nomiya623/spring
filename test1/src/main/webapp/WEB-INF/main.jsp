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
		<button @click="fnBoard">게시판이동</button>
		<button @click="fnUpdate">회원정보수정</button>
		<div>
			<button v-if="!authFlg" @click="fnSmsTest">문자테스트</button>
			<input v-if="authFlg" v-model="number" :placeholder="timer">
			<button v-if="authFlg" @click="fnSmsAuth">인증</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	authFlg : false,
    	number : "",
    	authNum : "",
    	timer : "",
		isRunning : false,
		count : 240,
    }   
    , methods: {
    	fnUpdate : function(){
            location.href="/user/edit.do";
        },
        fnBoard : function(){
            location.href="/boardList.do";
        },
        fnSmsTest : function(){
        	var self = this;
            var nparmap = {};
            $.ajax({
                url:"send-one",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.response.statusCode == "2000"){
                		alert("전송되었습니다.");
                		self.authFlg = true;
                		self.authNum = data.number;
                		setInterval(self.fnTimer, 1000);
                	} else {
                		alert("실패!");
                	}
                }
            });   
        },
        fnSmsAuth : function(){
        	var self = this;
        	if(self.number == self.authNum){
        		alert("인증되었음!");
        	} else {
        		alert("실패!");
        	}
        },
        fnTimer : function(){
        	var self = this;
        	var minutes, seconds;
      	    minutes = parseInt(self.count / 60, 10);
      	    seconds = parseInt(self.count % 60, 10);

      	    minutes = minutes < 10 ? "0" + minutes : minutes;
      	    seconds = seconds < 10 ? "0" + seconds : seconds;
      	    
      	    self.timer = minutes + ":" + seconds;
			
      	    if (--self.count < 0) {
      	      alert("시간초과");
      	      self.authFlg = false;
      	      self.count = 180;
      	      location.reload(true);
     	  	}
        }
    }   
    , created: function () {
    	var self = this;
	}
});
</script>