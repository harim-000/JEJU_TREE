<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행자 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board/board_search_list.css">
</head>
<body>
	<div id="container">
	<%@ include file="../include/navbar.jsp"%>
		<div id="board_content">
			<div id="board_title">SHARE SCHEDULE</div>
				<div class="title-account">JEJU TREE일정에 초대하세요</div>
			<div id="board_table">
				<div id="table_row">
					<div id="table_head">no</div>
					<div id="table_head">title</div>
					<div id="table_head">writer</div>
					<div id="table_head">reg</div>
					<div id="table_head">view</div>
					<div id="table_head">like</div>
				</div>
				<c:set var="paging" value="${Paging }" />
				<c:set var="list" value="${searchPageList }"/>
				<c:forEach items="${list }" var="board_dto">
				<div id="table_row">
					<div class="table_col">${board_dto.board_no}</div>
					<div class="table_col">
							<a href="board_content.go?board_no=${board_dto.board_no}&page=${paging.page}&field=${paging.field}&keyword=${paging.keyword}">
								${board_dto.board_Title} </a>
					</div>
					<div class="table_col">${board_dto.writer}</div>
				<c:if test="${board_dto.board_Update_Date eq board_dto.board_RegDate}">
					<div class="table_col">${board_dto.board_RegDate.substring(0, 10)}</div>
				</c:if>
				<c:if test="${board_dto.board_Update_Date ne board_dto.board_RegDate}">
					<div class="table_col">${board_dto.board_Update_Date.substring(0, 10)}</div>
				</c:if>		
					<div class="table_col">${board_dto.board_hit}</div>
					<div class="table_col">${board_dto.like_count}</div>
				</div>
				</c:forEach>
			</div>
			<%-- 페이징 처리 출력 부분 --%>
			<div id="paging_area">
				<c:if test="${paging.page > paging.block }">
					<a href="PlanBoardList.go?page=1&field=${paging.field}&keyword=${paging.keyword}">처음으로</a>
					<a href="PlanBoardList.go?page=${paging.startBlock - 1 }&field=${paging.field}&keyword=${paging.keyword}">back</a>
				</c:if>
				<c:forEach begin="${paging.startBlock }" end="${paging.endBlock }"
					var="i">
					<c:if test="${i == paging.page }">
						 <b><a href="PlanBoardList.go?page=${i }&field=${paging.field}&keyword=${paging.keyword}">${i }</a></b>
					</c:if>
					<c:if test="${i != paging.page }">
						<a href="PlanBoardList.go?page=${i }&field=${paging.field}&keyword=${paging.keyword}">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endBlock < paging.allPage }">
					<a href="PlanBoardList.go?page=${paging.endBlock + 1 }&field=${paging.field}&keyword=${paging.keyword}">next</a>
					<a href="PlanBoardList.go?page=${paging.allPage }&field=${paging.field}&keyword=${paging.keyword}">[마지막으로]</a>
				</c:if>
			</div>
			<div id="board_searchform">
				<form method="post" id="search_form"
					action="<%=request.getContextPath()%>/plan_board_search.go">
					<select name="field">
						<option value="board_Title">제목</option>
						<option value="board_Content">내용</option>
						<option value="Writer">작성자</option>
					</select> <input name="keyword">&nbsp;&nbsp; <input type="submit">
				</form>
			</div>
			<div id="board_button_area">
				<input id="board_mainlist" type="button" value="전체목록" onclick="location.href='PlanBoardList.go?page=1'">
		    </div>
		</div>
	</div>
</body>
</html>