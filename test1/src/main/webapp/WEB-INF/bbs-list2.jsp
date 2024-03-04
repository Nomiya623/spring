<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>시험 게시판</title>
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
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>아이디</th>
				<th>등록일자</th>
				<th>수정일자</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.bbsNum}}</td>
				<td>
					<a href="javascript:;" @click="fnDetailView(item.bbsNum)">{{item.title}}</a>
				</td>
				<td>{{item.contents}}</td>
				<td>{{item.hit}}</td>
				<td>{{item.userId}}</td>
				<td>{{item.cDateTime}}</td>
				<td>{{item.uDateTime}}</td>
			</tr>
		</table>
		<button @click="fnInsertBBS">글쓰기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	list: []
    }   
    , methods: {
    	fnList: function() {
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"bbs-list.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	self.list = data.list;
                }
            });
        },
        fnInsertBBS: function() {
        	$.pageChange("/bbs-insert.do", {});
		},
        fnDetailView: function(bbsNum) {
			var self = this;
			$.pageChange("/bbs-view.do", {bbsNum: bbsNum});
		},
    }
    , created: function() {
    	var self = this;
		self.fnList();
	}
});
</script>