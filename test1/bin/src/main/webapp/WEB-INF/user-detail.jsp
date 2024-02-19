<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>사용자 정보</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>이름 : {{user.userName}}</div>
		<div>아이디 :{{user.userId}} </div>
		<div>성별 :{{user.gender}}</div>
		<div>핸드폰번호 : {{user.phone}}</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		user : {}
		
    }   
    , methods: {
    	fnUserDetail : function(){
            var self = this;
          /*   if (!userId) {
                console.error("No userId provided in URL.");
                return; 
            } */
            var nparmap = {userId: "${map.userId}"};
            
            $.ajax({
                url:"userDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log("test ==> ", data);
                	self.user = data.user;
                	/* if (data && data.USERID) {
                        self.userDetails = data;
                    } else {
                        console.error("Invalid or no data returned for userId:", userId);
                    } */
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnUserDetail();

	}
});
</script>