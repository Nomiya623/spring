<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title></title>
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
				<td width="80%">{{item.title}</td>
			</tr>
			<tr>
				<th width="20%">내용</th>
				<td width="80%">{{item.contents}}</td>
			</tr>
			
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	itemNo: "${map.bbsNum}",
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
        }
    }
    , created: function () {
    	var self = this;
		self.fnView();
	}
});
</script>