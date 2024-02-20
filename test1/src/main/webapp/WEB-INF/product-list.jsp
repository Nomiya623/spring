<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>상품 목록</title>
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
				<th>상품명</th>
				<th>가격</th>
				<th>배송 종류</th>
			</tr>
			<tr v-for="item in list">
				<td>
				<a href="javascript:;" @click="fnDetailView(item.itemNo)">{{item.itemName}}</a>
				</td>
				<td>{{item.price}}</td>
				<td>{{item.transInfo}}</td>
			</tr>
		</table>
		<button @click="fnAddProduct">제품 추가</button>
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
    	fnList: function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"productList.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	 self.list = data.list;
                }
            });
        },
        fnDetailView: function(itemNo) {
			var self = this;
			$.pageChange("/productView.do", {itemNo: itemNo});
		},
		fnAddProduct: function() {
			$.pageChange("/productAdd.do", {});
		}
    }
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>