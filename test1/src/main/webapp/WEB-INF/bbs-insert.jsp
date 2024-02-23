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
		 <h2>글쓰기</h2>
    <form action="bbs-insert.do" method="post">
        제목: <input type="text" name="title"><br>
        내용:<br>
        <textarea name="contents" rows="5" cols="50"></textarea><br>
        <button type="submit">작성</button>
    </form>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    		title: "",
    		contents: ""
    	}
    }   
    , methods: {
    	fnAdd: function(){
            var self = this;
            var nparmap = self.bbs;
            $.ajax({
                url:"bbs/insert.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("작성되었습니다!")
                		$.pageChange("/bbsList.do", {});
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