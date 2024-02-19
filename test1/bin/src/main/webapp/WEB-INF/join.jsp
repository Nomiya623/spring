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
		<div>아이디 : 
		<!-- <input v-if="checkFlg" type="text" v-model="user.id" disabled>
			<input v-else type="text" v-model="user.id">
			<button @click="fnCheck">중복체크</button> -->
			
			<input type="text" v-model="user.id" @keyup="fnCheck">
			<div v-if="user.id != ''">
				<div v-if="checkFlg" style="color:blue;">사용 가능한 아이디 입니다.</div>
				<div v-else style="color:red;">중복된 아이디가 있습니다.</div>
			</div>
		</div>
		<div>비밀번호 : <input type="password" v-model="user.pwd"></div>
		<div>비밀번호확인 : <input type="password" v-model="user.pwd2"></div>
		<div>이름: <input type="text" v-model="user.name"></div>
		<div>핸드폰번호 : 
			<input type="text" v-model="user.phone1"> -
			<input type="text" v-model="user.phone2"> -
			<input type="text" v-model="user.phone3">
		</div>
		<div>
			<label><input type="radio" name="gender" value="남성" v-model="user.gender">남자</label>
			<label><input type="radio" name="gender" value="여성" v-model="user.gender">여자</label>
		</div>
		<div><button @click="fnJoin">회원가입</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	user : {
    		id : "",
    		pwd : "",
    		pwd2 : "",
    		name : "",
    		phone1 : "",
    		phone2 : "",
    		phone3 : "",
    		gender : "남성"
    	},
    	checkFlg : false
    }   
    , methods: {
    	fnJoin : function(){
            var self = this;
            if(!self.checkFlg){
            	alert("중복체크 후 사용해라");
            	return;
            }
            
            if(self.user.id == ""){
            	alter("아이디를 입력하세요.");
            	return;
            } // 검색 : js 정규식 영어+숫자
            if(self.user.pwd == ""){
            	alter("비밀번호를 입력하세요.");
            	return;
            }
            if(self.user.pwd != self.user.pwd2){
            	alert("비밀번호 서로 다름");
            	return;
            }
            
            var phone = self.user.phone1 + self.user.phone2 + self.user.phone3;
            var nparmap = self.user;
            nparmap.phone = phone;
            $.ajax({
                url:"join.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("저장되었습니다!");
                }
            });
        },
        fnCheck : function(){
        	var self = this;
        	var nparmap = {id : self.user.id};
        	$.ajax({
                url:"check.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.result == "success"){
                		self.checkFlg = true;
                	} else {
                		self.checkFlg = false;
                	}
                	
                	/* if(data.result == "success"){
                		if(confirm(data.message)){
                			self.checkFlg = true;
                		};
                	} else {
                		alert(data.message);
                	} */
                }
            });
        }
    }   
    , created: function () {
    	var self = this;
	}
});
</script>