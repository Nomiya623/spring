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
		<div>상품번호: <input type="text" v-model="product.itemNo"></div>
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
		<button @click="fnAdd">등록하기</button>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	product: {
    		itemNo: "",
    		itemName: "",
    		price: "",
    		contents: "",
    		transInfo: ""
    	}
    }   
    , methods: {
    	fnAdd: function(){
            var self = this;
            var nparmap = self.product;
            $.ajax({
                url:"productAdd.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("작성되었습니다!")
                		$.pageChange("/productList.do", {});
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