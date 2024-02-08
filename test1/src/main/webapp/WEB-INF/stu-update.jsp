<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>student page</title>
</head>
<style>
</style>
<body>
	<div id="app">
	student name is updated
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"stuUpdate.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();

	}
});
</script>