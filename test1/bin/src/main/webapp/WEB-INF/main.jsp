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
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    }   
    , methods: {
    	fnUpdate : function(){
            location.href="/user/edit.do";
        },
        fnBoard : function(){
            location.href="/boardList.do";
        }
    }   
    , created: function () {
    	var self = this;
	}
});
</script>