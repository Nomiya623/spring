<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>상품 추가</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>제목: <input type="text" v-model="bbs.title"></div>
		<div>
			<div>내용: </div>
			<textarea rows="15" cols="60" v-model="bbs.contents"></textarea>
		</div>		
		<button @click="fnInsert">작성</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	bbs: {
    		title: "",
    		contents: ""
    	}
    }   
    , methods: {
    	fnInsert: function(){
            var self = this;
            var nparmap = self.bbs;
            $.ajax({
                url:"bbs-insert.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("작성되었습니다!")
                		$.pageChange("/bbs-list.do", {});
                	} else {
                		alert("문제가 발생하였습니다!")
                	}
                }
            });
        }
    }
    , created: function () {
    	var self = this;
	}
});
</script>