<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	<style>
		table, div{
			margin : 10px;
		}
		table, tr, th, td {
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px 10px;
			text-align: center;
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>학번검색 : 
			<input type="text" v-model="keyword" @keyup.enter="fnGetList">
			<button @click="fnGetList">검색</button>
		</div>
		<div>학년 : <input type="text" v-model="grade"> </div>
		
	<div>
        <label v-for="item in deptList">
        	<input type="checkbox" :value="item.code" v-model="dept">{{item.name}}
        </label>
        <button @click="fnGetList">검색</button>
    </div>
    
    	<div>
			특별시/도 : <select v-model="si" @change="fnGuList">
		    	<option value="">:: 전체 ::</option>
		    	<option v-for="item in siList" :value="item.si">{{ item.si }}</option>
			</select>
			시/군/구 : <select v-model="gu" @change="fnDongList" >
			    <option value="">:: 전체 ::</option>
			    <option v-for="item in guList" :value="item.gu">{{ item.gu }}</option>
			</select>
			동/읍/면 : <select v-model="dong" @change="fnSiList">
			    <option value="">:: 전체 ::</option>
			    <option v-for="item in dongList" :value="item.dong">{{ item.dong }}</option>
			</select>
			

		</div>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과</th>
				<th>학년</th>
				<th>성별</th>
				<th>특별시/도</th>
				<th>시/군/구</th>
				<th>동/읍/먄</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr v-for="(item, index) in list">
				<td>{{item.stuNo}}</td>
				<td>{{item.stuName}}</td>
				<td>{{item.stuDept}}</td>
				<td>{{item.stuGrade}}</td>
				<td>
					<span style="color:blue;" v-if="item.stuGender == 'M'">남자</span>
					<span style="color:red;" v-else>여자</span>
				</td>
				<td>{{item.si}}</td>
				<td>{{item.gu}}</td>
				<td>{{item.dong}}</td>
				
				<td><button @click="fnEdit(item.stuNo)">수정</button></td>
				
				<td><button>삭제</button></td>
			</tr>
			<tr v-if="list.length == 0">
				<td colspan="10"> 검색된 데이터 없음 </td>
			</tr>
		</table>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		grade : "",
		keyword : "",
		deptList : ${deptList}, 
		siList : ${siList}, 
		guList : [], 
		dongList : [], 
		dept : [], 
		si: "", 
		gu: "", 
		dong: ""
		
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            console.log(self.dept, self.si, self.gu, self.dong);
            var nparmap = {
            		keyword : self.keyword,
            		dept : JSON.stringify(self.dept),
            		si : self.si, 
            		gu : self.gu, 
            		dong : self.dong
            		
            };
            $.ajax({
                url:"stu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data);
	                self.list = data.list;
	                
                }
            }); 
        },
	    fnSiList : function(){
	        var self = this;
	        console.log(self.si);
	        var nparmap = {
	        		        		
	        };
	        $.ajax({
	            url:"siList.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) { 
	            	self.siList = data.siList;
	            	self.fnGetList();
	            }
	        });
	    },
        fnGuList : function(){
            var self = this;
            console.log(self.si);
            var nparmap = {
            		si : self.si
    
            		
            };
            $.ajax({
                url:"guList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.guList = data.guList;
                	self.fnDongList();
                	self.fnGetList();
                }
            });
        },
        fnDongList : function(){
            var self = this;
            console.log(self.gu);
            var nparmap = {
            		gu : self.gu,
            		si : self.si
    
            		
            };
            $.ajax({
                url:"dongList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.dongList = data.dongList;
	                
                }
            });
        },
        fnEdit : function(stuNo){
            var self = this;
            var nparmap = {stuNo : stuNo, 
            			si : self.si,
            			gu : self.gu,
            			dong : self.dong
            			
            };
            $.ajax({
                url:"stu/edit.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("수정되었습니다!");
                	self.fnGetList();
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();
    	
    	self.fnGuList();
    	self.fnDongList();
	}
});
</script>