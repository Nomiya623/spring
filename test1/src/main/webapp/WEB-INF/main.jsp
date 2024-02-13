<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<button @click="fnUpdate">회원정보 수정</button>
		<button>취소</button>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			id : "",
			pwd : ""
			
		},
		methods : {
			fnSelectUser : function() {
				var self = this;
				var nparmap = {
						id : self.user.id
					};

				$.ajax({
					url : "../join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("로그인");

					},
				});
			}
						
					}
				});
			}
		},
		
		created : function() {
			var self = this;
			
		}
	});
</script>
