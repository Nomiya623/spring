<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>제품 목록</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<input type="text" v-model="price">
		<button @click="fnList(1)">검색</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	// 변수 영역
    	price : "",
    	
    	
    }   
    , methods: { // 메소드 시작
    	fnList : function(kind){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"productList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                }
            }); 
        } 
    }  // 메소드 끝
    , created: function () {
    	var self = this;
		self.fnList();
		
	}
});
</script>