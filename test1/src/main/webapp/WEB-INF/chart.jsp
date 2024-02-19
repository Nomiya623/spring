<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div id="chart">
	        <apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
        </div>
	</div>
</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    components: {
        apexchart : VueApexCharts,
    },
    data: {
    	series: [],
        chartOptions: {
          chart: {
            height: 350,
            type: 'line',
            zoom: {
              enabled: false
            }
          },
          dataLabels: {
            enabled: false
          },
          stroke: {
            curve: 'straight'
          },
          title: {
            text: '월별 매출 추이',
            align: 'left'
          },
          grid: {
            row: {
              colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
              opacity: 0.5
            },
          },
          xaxis: {
            categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
          }
        },
        list : []
    }   
    , methods: {
    	fnList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"shoesList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                	var shoesList = [];
                	var tShirtList = [];
                	for(var i=0; i<data.list.length; i++){
                		if(data.list[i].name == "신발"){
                			shoesList.push(data.list[i].value);
                		} else {
                			tShirtList.push(data.list[i].value);
                		}
                	}
                	self.series.push({
                        name: "신발",
                        data: shoesList
                    });
                	self.series.push({
                        name: "티셔츠",
                        data: tShirtList
                    });
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
		self.fnList();
	}
});
</script>