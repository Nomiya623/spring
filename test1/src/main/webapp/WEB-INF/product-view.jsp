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
				<th width="20%">상품명</th>
				<td width="80%">{{info.itemName}}</td>
			</tr>
			<tr>
				<th width="20%">상품코드</th>
				<td width="80%">{{info.itemNo}}</td>
			</tr>
			<tr>
				<th width="20%">내용</th>
				<td width="80%">{{info.contents}}</td>
			</tr>
			<tr>
				<th width="20%">가격</th>
				<td width="80%">{{info.price}}</td>
			</tr>
		</table>
		<button @click="fnEdit">상품 수정</button>
		<button @click="fnRemove">상품 삭제</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	itemNo: "${map.itemNo}",
    	info: {}
    }   
    , methods: {
    	fnView: function(){
            var self = this;
            var nparmap = {itemNo: self.itemNo};
            $.ajax({
                url:"productView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	 self.info = data.info;
                }
            });
        },
        fnEdit: function() {
			var self = this;
			$.pageChange("/productEdit.do", {itemNo: self.itemNo});
		},
		fnRemove: function() {
			var self = this;
			if(confirm("정말 삭제할까요?")) {
				var nparmap = {itemNo: self.itemNo};
	            $.ajax({
	                url:"productRemove.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success : function(data) {
	                	if(data.result == "success") {
	                		alert("삭제되었습니다!");
		                	$.pageChange("/productList.do", {});
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