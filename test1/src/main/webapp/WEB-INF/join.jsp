<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f7f6;
	margin: 0;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

div {
	margin-bottom: 15px;
}

#app {
	background: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

.radio-group {
	margin: 10px 0;
}

.radio-group input[type=radio] {
	margin-right: 5px;
}

.radio-group label {
	margin-right: 15px;
}
</style>

<body>
	<div id="app">
		<div>
			아이디:
			<!-- <input v-if= "checkFlg" type="text" name="userid" v-model="user.id" disabled>
		<input v-else type="text" name="userid" v-model="user.id" >
		<button @click = "fnCheck">중복체크</button> -->

			<div>
				<input type="text" v-model="user.id" @keyup="fnCheck">
				<div v-if="user.id !== ''">
					<span v-if="checkFlg" style="color: blue;">사용가능한 아이디입니다.</span> <span
						v-else style="color: red;">중복된 아이디입니다.</span>
				</div>
			</div>


		</div>
		<div>
			비밀번호: <input type="password" name="pwd" v-model="user.pwd" required>
		</div>
		<div>
			비밀번호 확인: <input type="password" name="pwd2" v-model="user.pwd2"
				required>
		</div>
		<div>
			이름: <input type="text" name="username" v-model="user.username"
				required>
		</div>
		<div>
			핸드폰번호: <input type="text" v-model="user.phone1"> - <input
				type="text" v-model="user.phone2"> - <input type="text"
				v-model="user.phone3">
		</div>
		<div>
			성별: <input type="radio" name="gender" value="남성"
				v-model="user.gender">남성 <input type="radio" name="gender"
				value="여성" v-model="user.gender">여성
		</div>
		<button @click="fnJoin">회원가입</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			user : {
				id : '',
				pwd : '',
				pwd2 : '',
				name : '',
				phone1 : '',
				phone2 : '',
				phone3 : '',
				gender : '남성',

			},
			checkFlg : false

		},

		methods : {
			fnJoin : function() {
				var self = this;
				if (!self.checkFlg) {
					alert("중복체크 후 사용가능합니다.");
					return;
				}

				if (self.user.pwd !== self.user.pwd2) {
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				var phone = self.user.phone1 + self.user.phone2
						+ self.user.phone3;
				var nparmap = self.user;
				nparmap.phone = phone;

				$.ajax({
					url : "/join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("저장되었습니다");

					},
				});
			},

			fnCheck : function() {
				var self = this;
				var nparmap = {
					id : self.user.id
				};

				$.ajax({
					url : "/check.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) /* {
														if(data.result === "success"){
															if(confirm(data.message)){
																self.checkFlg = true;
															};
														} else {
															slert(data.message);
														}
														

													} */
					{
						if (data.result === "success") {
							self.checkFlg = true;
						} else {
							self.checkFlg = false;
						}

					},
				});

			}
		},

		created : function() {
			var self = this;
		}
	});
</script>
