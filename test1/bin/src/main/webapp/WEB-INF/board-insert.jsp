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
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

#app {
    background: white;
    max-width: 800px;
    margin: auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
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

div {
    margin-bottom: 10px;
}

</style>
<body>
	<div id="app">
	
		<tr>
			<th>게시판선택</th>
			<select v-model="kind">
				<option value="1">공지사항</option>
				<option value="2">자유게시판</option>
				<option value="3">문의게시판</option>
			</select>
		</tr>	
		<div>
			제목 : <input type="text" v-model="title">
		</div>
		<div>
			내용 : <textarea rows="5" cols="40" v-model="contents"></textarea>
		</div>
		<div>
			<button @click="fnInsert">저장</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "${userId}",
    	kind : "${map.kind}",
    	title : "",
    	contents : ""
    	
    	
    }   
    , methods: {
    	fnInsert : function(){
            var self = this;
            
            var nparmap = {userId : self.userId, title : self.title, contents : self.contents, kind : self.kind};
            
            $.ajax({
                url:"boardInsert.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	if(data.result == "success"){
                		alert("작성되었음");
                		location.href = "/boardList.do";
                	} else {
                		alert("오류 발생");
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