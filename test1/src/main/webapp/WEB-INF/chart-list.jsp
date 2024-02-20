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
	<title>차트 연습</title>
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
            categories: [],
          }
        },
    }   
    , methods: {
    	fnList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"chartList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	var shoesList = [];
                	var tShirtList = [];
                	var monthList = [];
                	for(var i=0; i<data.list.length; i++){
                		if(data.list[i].name == "신발"){
                			shoesList.push(data.list[i].value);
                		} else {
                			tShirtList.push(data.list[i].value);
                			monthList.push(data.list[i].month);
                		}
                	}
                	console.log(monthList);
                	self.series.push({
                        name: "신발",
                        data: shoesList
                    });
                	self.series.push({
                        name: "티셔츠",
                        data: tShirtList
                    });
                	self.chartOptions.xaxis.categories.push(monthList);
                }
            }); 
        } 
    }   
    , created: function() {
    	var self = this;
		self.fnList();
	}
});
</script>