<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="../js/jquery.js"></script>
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
			<input type="text" v-model="user.id" disabled>
			
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
		<div><button @click="">수정</button></div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	user : {
    		id : "${userId}",
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
    	fnSelectUser : function(){
            var self = this;
            var nparmap = {id : self.user.id};
            $.ajax({
                url:"../selectUser.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.user.name = data.user.userName;
                }
            });
        }
    }   
    , created: function () {
    	var self = this;
    	self.fnSelectUser();
	}
});
</script>