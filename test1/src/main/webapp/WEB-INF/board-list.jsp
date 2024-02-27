<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>첫번째 페이지</title>
<style>
	body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        #app {
            background: white;
            max-width: 800px;
            margin: auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid black;
            padding: 5px 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #45a049;
        }

        ul {
            padding: 3px;
            list-style: none;
            display: inline-block;
            
        }

        li {
            display: inline;
            margin-right: 20px;
           
        }

        .tab {
            padding: 10px;
            cursor: pointer;
        }

        .tab:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        .select-tab {
            background-color: #ccc;
            cursor: pointer;
        }
        .select-tab:hover {
            background-color: #ddd;
            cursor: pointer;
        }
         .pagination {
        display: inline-block;
        padding-left: 0;
        margin: 20px 0;
        border-radius: 4px;
   		 }

	    .pagination a {
	        color: #007bff;
	        float: left;
	        padding: 8px 16px;
	        text-decoration: none;
	        transition: background-color .3s;
	        border: 1px solid #ddd;
	        margin: 0 4px;
	    }
	
	    .pagination a.active {
	        background-color: #4CAF50;
	        color: white;
	        border: 1px solid #4CAF50;
	    }
	
	    .pagination a:hover:not(.active) {background-color: #ddd;}
}
</style>
</head>
<body>
	<div id="app">
		
		<li>
			<ul v-for="item in boardList" :class = "[kind==item.code ? 'select-tab' : 'tab']" @click="fnList(item.code)">{{item.name}}</ul>
			<!-- <ul :class = "[kind==1 ? 'select-tab' : 'tab']" @click="fnList(1)">공지사항</ul>
			<ul :class = "[kind==2 ? 'select-tab' : 'tab']" @click="fnList(2)">자유게시판</ul>
			<ul :class = "[kind==3 ? 'select-tab' : 'tab']" @click="fnList(3)">문의게시판</ul> -->
		</li>
		<div>
			<select v-model="keywordType">
				<option value="title">제목</option>
				<option value="user">작성자</option>
			</select> 
				 <input type="text" v-model="keyword" @keyup.enter="fnList(kind)" placeholder="검색어 입력">
			<button @click="fnList(kind)">검색</button>
			<!-- order by 5,10,20 paging list -->
			<select v-model="searchCnt" @click="fnPageList(1)" style="float: right">
				<option value="5">5개</option>
				<option value="10">10개</option>
				<option value="20">20개</option>
			</select>
		</div>
		<table>
			<tr>
				<th><input type="checkbox" @click="fnAllCheck"></th>
				<th width="7%">번호</th>
				<th width="40%">제목</th>
				<th width="8%">
					<a v-if="order == 'DESC' && type =='HIT'" href="javascript:;" @click="fnOrder('HIT', 'ASC')">조회수▲</a><!--must be hidden  -->
					<a v-else href="javascript:;" @click="fnOrder('HIT', 'DESC')">조회수▼</a>
				</th>
				<th width="15%">작성자</th>
				
				<th width="20%">
					<a v-if="order == 'DESC' && type =='CDATE'" href="javascript:;" @click="fnOrder('CDATE', 'ASC')">작성일▲</a> <!--오름차순 -->
					<a v-else href="javascript:;" @click="fnOrder('CDATE', 'DESC')">작성일▼</a><!--내림차순 -->
				</th>
				
			</tr>
			<tr v-if="list.length == 0">
				<td colspan="6"> 검색된 데이터 없음 </td>
			</tr>
			<tr v-for="(item, index) in list">
				<td><input type="checkbox" name="board" v-model="selectList" :value="item.boardNo"></td>
				<td>{{item.boardNo}}</td>
				<td><a href="javascript:;" @click="fnView(item.boardNo)">{{item.title}}
						<span v-if="item.commCnt != 0" style="color: blue;">
							({{item.commCnt}}) </span>
				</a></td>
				<td>{{item.hit}}</td>
				<td><a href="javascript:;" @click="fnUserDetail(item.userId)">{{item.userName}}</a></td>
				<td>{{item.cDate}}</td>
			</tr>
		</table>
		<div class="pagination">
		<a href="javascript:;" v-if="pageCount > 1 && nowPage > 1" @click="fnPageList(nowPage - 1)">&lt;</a>
			<template v-for="n in pageCount">
				<a href="javascript:;" :class="{ 'active': nowPage === n }" @click="fnPageList(n)">{{ n }}</a>
			</template>
		<a href="javascript:;" v-if="pageCount > 1 && nowPage < pageCount" @click="fnPageList(nowPage + 1)">&gt;</a>	
		</div>
		<div v-if="userId != '' && userId != undefined">
			<button @click="fnInsert">글쓰기</button>
			<button @click="fnDelete">삭제</button>
		</div>
		<!-- sorOrder method -->
		<!-- <div>
		    <label>Sort By:</label>
		    <select v-model="sortColumn">
		        <option value="TITLE">Title</option>
		        <option value="HIT">Hits</option>
		        <option value="CDATE">Creation Date</option>
		        Add other options as needed
		    </select>
		    <select v-model="sortOrder">
		        <option value="ASC">Ascending</option>
		        <option value="DESC">Descending</option>
		    </select>
		    <button @click="fnList(kind)">Sort</button>
		</div> -->
		
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			userId : "${userId}",
			list : [],
			keyword : "",
			keywordType : "title",
			selectList : [],
			boardList : ${boardList},
			kind : 1,
			nowPage : 1,
			pageCount : 1,
			searchCnt : 10,
			type : "CDATE",
			order : "DESC"
			/* sortColumn: 'TITLE', // Default sort column
	        sortOrder: 'ASC' // Default sort order */
			/* allCheck : false */
			
		},
		methods : {
			fnList : function(kind) {
				var self = this;
				self.kind = kind;
				self.selectList = [];
			
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					kind: kind,
					startNum : 1,
					lastNum : 10,
					type : self.type,
					order : self.order
					/* sortColumn: self.sortColumn, // Include sorting parameters
	                sortOrder: self.sortOrder */
				};
				
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
                        console.log(data.cnt);
                        self.list = data.list;
                        self.pageCount = Math.ceil(data.cnt/10);
					}
				});
			},
			fnPageList : function(num) {
				var self = this;
				self.selectList = [];
				self.nowPage = num; /* currentPage update */
				var startNum = ((num-1)*self.searchCnt)+1;
				var lastNum = num*self.searchCnt;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					kind: self.kind,
					startNum : startNum,
					lastNum : lastNum,
					type : self.type,
					order : self.order
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
                        console.log(data.cnt);
                        self.list = data.list;
                        self.pageCount = Math.ceil(data.cnt/self.searchCnt);
					}
				});
			},
			fnView : function(boardNo) {
				var self = this;
				if(self.userId != ""){
					$.pageChange("/boardView.do", {
						boardNo : boardNo
					})
				} else {
					alert("로그인 후 접속해라");
					$.pageChange("/login.do", {});
				}
				;
			},
			fnInsert : function() {
				var self = this;
				$.pageChange("/boardInsert.do", {
					kind : self.kind
				});
			},
			/* order */
			fnOrder : function(type, order){
				var self = this;
				self.selectList = [];
				self.type = type;
				self.order = order;
				var startNum = ((self.nowPage-1)*self.searchCnt)+1;
				var lastNum = self.nowPage*self.searchCnt;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					kind: self.kind,
					startNum : startNum,
					lastNum : lastNum,
					type : type,
					order : order
				};
				$.ajax({
					url : "boardList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
                        console.log(data.cnt);
                        self.list = data.list;
                        self.pageCount = Math.ceil(data.cnt/self.searchCnt);
					}
				});
				
			},
			
			fnDelete : function() {
				var self = this;
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				};
				
					var nparmap = {
							boardNoList : JSON.stringify(self.selectList),
							message : "테스트 메세지"
						};
						$.ajax({
							url : "boardRemove.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								alert("삭제되었습니다");
		                       
		                        self.fnList(self.kind);
		                        
							}
						});
				
				
			},
			fnUserDetail : function(userId) {
				$.pageChange("/userDetail.do", {
					userId : userId
				});
			},
			
			fnAllCheck: function(event) {
			    var self = this;
			    /* self.allCheck = !allCheck;
			    if(self.allCheck){
			    	self.selectList = [];
			    	for(var i=0; i<self.list.lenght; i++){
			    		self.selectList.push(self.list[i].boardNo);
			    	}
			    }
			    */
			    if(event.target.checked) {
			        
			        self.selectList = self.list.map(item => item.boardNo);
			    } else {
			        
			        self.selectList = [];
			    }
		
			}
		},
		created : function() {
			var self = this;
			self.fnList(1);
		}
	});
</script>