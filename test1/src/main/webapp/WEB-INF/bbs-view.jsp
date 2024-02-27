<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>상품 상세정보</title>
</head>
<style>
	table, tr, th, td {
		border: 1px solid;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	th {
		background-color: #ccc;
	}
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">{{info.title}}</td>
			</tr>
			<tr>
				<th width="20%">내용</th>
				<td width="80%">{{info.contents}}</td>
			</tr>
			<tr>
				<th width="20%">조회수</th>
				<td width="80%">{{info.hit}}</td>
			</tr>
			<tr>
				<th width="20%">작성자</th>
				<td width="80%">{{info.userId}}</td>
			</tr>
		</table>
		<button @click="fnRemove">삭제</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	bbsNum: "${map.bbsNum}",
    	info: {}
    }   
    , methods: {
    	fnView: function(){
            var self = this;
            var nparmap = {bbsNum: self.bbsNum};
            $.ajax({
                url:"bbs-view.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	 self.info = data.info;
                }
            });
        },
		fnRemove: function() {
			var self = this;
			if(confirm("정말 삭제할까요?")) {
				var nparmap = {bbsNum: self.bbsNum};
	            $.ajax({
	                url:"bbs-remove.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success : function(data) {
	                	if(data.result == "success") {
	                		alert("삭제되었습니다!");
		                	$.pageChange("/bbs-list.do", {});
	                	} else {
	                		alert("삭제 실패 오류 발생!");
	                	}
	                }
	            });
			} else {
				return;
			}
		}
    }
    , created: function () {
    	var self = this;
		self.fnView();
	}
});
</script>