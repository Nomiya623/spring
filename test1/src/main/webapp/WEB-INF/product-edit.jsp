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
		<div>상품번호: <input type="text" v-model="product.itemNo" disabled></div>
		<div>상품명: <input type="text" v-model="product.itemName"></div>
		<div>가격: <input type="text" v-model="product.price"></div>
		<div>
			<div>설명: </div>
			<textarea rows="15" cols="60" v-model="product.contents"></textarea>
		</div>
		<div>배송 종류: 
			<select v-model="product.transInfo">
				<option value="무료 배송">무료 배송</option>
				<option value="착불 배송">착불 배송</option>
			</select>
		</div>
		<button @click="fnEdit">수정하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	product: {
    		itemNo: "${map.itemNo}",
    		itemName: "",
    		price: "",
    		contents: "",
    		transInfo: ""
    	}
    }   
    , methods: {
    	fnViewProduct: function(){
            var self = this;
            var nparmap = {itemNo: self.product.itemNo};
            $.ajax({
                url:"productView.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result == "success") {
                		self.product.itemNo = data.info.itemNo;
                		self.product.itemName = data.info.itemName;
                		self.product.price = data.info.price;
                		self.product.contents = data.info.contents;
                		self.product.transInfo = data.info.transInfo;
                	} else {
                		alert("불러오기 오류 발생!");ㅣ
                	}
                }
            });
        },
        fnEdit: function() {
            var self = this;
            var nparmap = self.product;
            $.ajax({
                url:"productEdit.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success: function(data) {
                	if(data.result == "success") {
                		alert("수정되었습니다!")
                		$.pageChange("/productList.do", {});
                	} else {
                		alert("수정 실패 오류 발생!")
                	}
                }
            });
		}
    }
    , created: function () {
    	var self = this;
		self.fnViewProduct();
	}
});
</script>