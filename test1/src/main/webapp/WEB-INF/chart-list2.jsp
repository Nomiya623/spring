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
	<title>차트 연습2</title>
</head>
<style>
</style>
<body>
	<div id="app">
      <div id="chart">
        <apexchart type="pie" width="380" :options="chartOptions" :series="series"></apexchart>
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
            width: 380,
            type: 'pie',
          },
          labels: ['네이버','구글', '다음'],
          responsive: [{
            breakpoint: 480,
            options: {
              chart: {
                width: 200
              },
              legend: {
                position: 'bottom'
              }
            }
          }]
        },
    }   
    , methods: {
    	fnList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
            	url:"chartList2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	var nameList = [];
                	var valueList = [];
                	
                	for(var i=0; i<data.list.length; i++){
                		if(data.list[i].name == "포털"){
                			valueList.push(data.list[i].value);
                			nameList.push(data.list[i].month);
                		} 
                	}
                	
                	self.series = valueList;
                	self.chartOptions.labels = nameList;
                	
                	
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