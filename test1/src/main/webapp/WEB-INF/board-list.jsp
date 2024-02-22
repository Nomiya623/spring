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
		</div>
		<table>
			<tr>
				<th><input type="checkbox" @click="fnAllCheck"></th>
				<th width="7%">번호</th>
				<th width="40%">제목</th>
				<th width="8%">조회수</th>
				<th width="15%">작성자</th>
				<th width="20%">작성일</th>
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
			<template v-for="n in pageCount">
				<a href="javascript:;" @click="fnPageList(n)">{{n}}</a>
			</template>
		</div>
		<div v-if="userId != '' && userId != undefined">
			<button @click="fnInsert">글쓰기</button>
			<button @click="fnDelete">삭제</button>
		</div>
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
			pageCount : 1
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
					lastNum : 10
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
				var startNum = ((num-1)*10)+1;
				var lastNum = num*10;
				var nparmap = {
					keyword : self.keyword,
					keywordType : self.keywordType,
					kind: self.kind,
					startNum : startNum,
					lastNum : lastNum
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
			fnView : function(boardNo) {
				$.pageChange("/boardView.do", {
					boardNo : boardNo
				});
			},
			fnInsert : function() {
				var self = this;
				$.pageChange("/boardInsert.do", {
					kind : self.kind
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