<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>게시글 상세 보기</title>
</head>
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

    /* 추가된 부분: 대댓글(pComm) 스타일 */
    .pComm {
        background-color: #eee; /* 대댓글 배경 색상 변경 */
    }
}
</style>

<body>
	<div id="app">
		<table>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">{{info.title}}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>{{info.userName}}</td>
			</tr>
			<tr>
				<th width="20%">내용</th>
				<td>
				<div v-html="info.contents"></div>
				<div v-for="item in fileList">
					<img :src="item.path">
				</div>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<th><a @click="fnPCommentAdd(commentList)" style="cursor: pointer;">{{pCommentName}}</a></th>
				<td><textarea rows="5" cols="40" v-model="comment"></textarea></td>
				<td><button @click="fnComment">작성하기</button></td>
			</tr>
		</table>
		<table>
			<tr>
				<th>■</th>
				<th>댓쓴이</th>
				<th width="40%">댓글 내용</th>
				<th>작성(수정)일</th>
				<th colspan="2">기능</th>
			</tr>
			<template v-for="(item, index) in commentList">
				<tr v-if="item.pCommentNo == 0">
					<th>□</th>
					<th><a @click="fnPCommentAdd(item)" style="cursor: pointer;">{{item.userName}}</a></th>
					<td>
						<template v-if="item.updateFlg">{{item.cmt}}</template>
						<template v-else><textarea rows="3" cols="20" v-model="editComment"></textarea></template>
					</td>
					<td>{{item.uDateTime}}</td>
					<td>
						<button v-if="sessionId == item.userId && item.updateFlg" @click="fnEditBtn(item, index)">수정</button>
						<button v-if="!item.updateFlg" @click="fnEditComm(item)">저장</button>
						<button v-if="!item.updateFlg" @click="fnEditBtn(item, index)">취소</button>
					</td>
					<td v-if="sessionId == item.userId"><button @click="fnRemoveComm(item)">삭제</button></td>
				</tr>
				<template v-for="(item2, index) in pCommentList">
					<tr v-if="item.commentNo == item2.pCommentNo" class="pComm">
					<th>↳</th>
					<th>{{item2.userName}}</th>
					<td>
						<template v-if="item2.updateFlg">{{item2.cmt}}</template>
						<template v-else><textarea rows="3" cols="20" v-model="editComment"></textarea></template>
					</td>
					<td>{{item2.uDateTime}}</td>
					<td>
						<button v-if="sessionId == item2.userId && item2.updateFlg" @click="fnEditBtn(item2, index)">수정</button>
						<button v-if="!item2.updateFlg" @click="fnEditComm(item2)">저장</button>
						<button v-if="!item2.updateFlg" @click="fnEditBtn(item2, index)">취소</button>
					</td>
					<td v-if="sessionId == item2.userId"><button @click="fnRemoveComm(item2)">삭제</button></td>
					</tr>
				</template>
			</template>
		</table>
		<div>
			<template v-if="sessionId == info.userId || sessionStatus == 'A'">
				<button @click="fnEdit">글 수정</button>
				<button @click="fnRemove">글 삭제</button>
			</template>
			<button @click="fnList">목록으로</button>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	boardNo: "${map.boardNo}",
    	sessionId: "${userId}",
    	sessionStatus: "${userStatus}",
    	comment: "",
    	info: {},
    	commentList: [],
    	editComment: "",
    	commentIndex: 0,
    	pCommentList: [],
    	pCommentName: "댓글",
    	pCommentNo: "",
    	fileList: []
    }
    , methods: {
    	fnView: function(str){
            var self = this;
            var nparmap = {boardNo: self.boardNo, str: str};
            $.ajax({
                url:"boardDetail.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	self.info = data.info;
                	self.fileList = data.fileList;
                	self.commentList = data.commentList;
                	self.pCommentList = data.pCommentList;
                	
                	console.log(data.fileList);
                }
            });
        },
        fnRemove: function(){
            var self = this;
            if(!confirm("삭제할까요?")) {
            	return;
            } else {
	            var nparmap = {boardNo: self.boardNo};
	            $.ajax({
	                url:"boardDelete.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success : function(data) {
	                	if(data.result == "success") {
	                		alert("삭제되었습니다!");
		                	$.pageChange("/boardList.do", {});
		                	//location.href="/boardList.do";
	                	} else {
	                		alert("다시 시도해 주세요.");
	                	}
	                }
	            });
            }
        },
        fnEdit: function(){
        	var self = this;
            if(confirm("수정할까요?")) {
            	$.pageChange("/boardUpdate.do", {boardNo: self.boardNo});
            } else {
            	return;
            }
        },
        fnList: function() {
			location.href="/boardList.do";
		},
		fnComment: function() {
			var self = this;
            var nparmap = {boardNo: self.boardNo, comment: self.comment, userId: self.sessionId, pCommentNo: self.pCommentNo};
            $.ajax({
                url:"boardComment.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("댓글 등록됨!");
                		self.fnView("list"); // 댓글 등록할 때는 조회수 상승 막는 기능
                		self.comment = ""; // 댓글 작성 후 댓글 작성칸에 비어있게끔
                	} else {
                		alert("댓글 작성 실패.");
                	}
                }
            });
		},
		fnEditBtn: function(item, index) {
			var self = this;
			/* for(var i=0; i<self.commentList.length; i++) {
				self.commentList[i].updateFlg = true;
			} */
			if(self.commentIndex != index) {
				self.commentList[self.commentIndex].updateFlg = true;
			}
			self.commentIndex = index;
			self.editComment = item.cmt; // 취소 버튼 누르면 원래 내용으로 돌아가게끔
			item.updateFlg = !item.updateFlg;
		},
		fnEditComm: function(item) {
			var self = this;
			var nparmap = {commentNo: item.commentNo, comment: self.editComment};
			$.ajax({
                url:"editComment.dox",
                dataType:"json",
                type: "POST",
                data: nparmap,
                success : function(data) {
                	if(data.result == "success") {
                		alert("댓글 수정됨!");
                		self.fnView("list"); // 댓글 수정할 때는 조회수 상승 막는 기능
                		self.comment = "";
                	} else {
                		alert("댓글 수정 실패.");
                	}
                }
            });
		},
		fnRemoveComm: function(item) {
			var self = this;
			if(!confirm("댓글을 지울까요?")) {
				return;
			} else {
				var nparmap = {commentNo: item.commentNo};
				$.ajax({
	                url:"removeComment.dox",
	                dataType:"json",
	                type: "POST",
	                data: nparmap,
	                success : function(data) {
	                	if(data.result == "success") {
	                		alert("댓글 삭제됨!");
	                		self.fnView("list"); // 댓글 삭제할 때는 조회수 상승 막는 기능
	                		self.comment = "";
	                	} else {
	                		alert("댓글 삭제 실패.");
	                	}
	                }
	            });
			}
		},
		fnPCommentAdd: function(item) {
			var self = this;
			if(self.pCommentNo == "" && item.commentNo != undefined) {
				self.pCommentName = "대댓글";
				self.pCommentNo = item.commentNo;
			} else {
				self.pCommentName = "댓글";
				self.pCommentNo = "";
			}
		}
		
		, fnAdd : function(){
			var self = this;
			var form = new FormData();
   	        form.append( "file1",  $("#file1")[0].files[0] );
   	     	form.append( "idx",  1234); // 임시 pk
       		self.upload(form);  
        }

	    	
    }
    , created: function () {
    	var self = this;
		self.fnView("new"); // 댓글 등록할 때는 조회수 상승 막는 기능
	}
});
</script>