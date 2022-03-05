<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<script src="https://kit.fontawesome.com/58e52d7ffb.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/board.list.css" />
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.uvo.email" var="authEmail"/>
</sec:authorize>

<div class="container-fluid">
	<div class="wrapper">
		<div class="title">영화 게시판</div>
		<div class="searchBar">
			<form action="/mBoard/hateList" method="get">
				<div class="input-group">
					<c:set value="${pgn.pgvo.type }" var="typed" />
					<div class="form-outline">
						<select name="type" class="form-select form-select-sm searchSelc">
							<option ${typed == null ? 'selected':'' }>선택</option>
							<option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
							<option value="m" ${typed eq 'm' ? 'selected':'' }>영화제목</option>
						</select>
					</div>
					<div class="form-outline">
						<input type="text" name="keyword" class="form-control searchInpt" placeholder="검색어를 입력하세요." value="${pgn.pgvo.keyword }">
						<input type="hidden" name="pageNo" value="1">
						<input type="hidden" name="qty" value="${pgn.pgvo.qty }">
					</div>
					<button type="submit" class="btn btn-info"><i class="fas fa-search"></i></button>
				</div>
			</form>
		</div>
	
		<div class="likeHateText">
			<a href="/mBoard/likeList">재밌어요</a>
			/
			<a href="/mBoard/hateList" style="color: rgb(91, 189, 250); text-decoration: underline; font-weight: bold;">재미없어요</a>
		</div>
		
		<div class="card-group">
			<c:forEach items="${list }" var="mbvo">
		    <div class="card-primary text-center card-one">
		      <img class="card-img-top" src="${mbvo.poster }" alt="${mbvo.movieTitle }">
		      <div class="card-body">
		        <div class="movieTitle fs-6">${mbvo.movieTitle }</div>
		        <div class="card-title">${mbvo.title }</div>
		        <div class="dropdown uDetail">
				  <a href="" data-bs-toggle="dropdown" aria-expanded="false">
				    ${mbvo.nickName }
				  </a>&nbsp&nbsp<span class="heartColor"><i class="far fa-heart"></i></span>${mbvo.heart }
				  <ul class="dropdown-menu" aria-labelledby="uDetail">
				    <li><a href="/user/${mbvo.writer }" class="dropdown-item">정보 보기</a></li>
				  </ul>
				</div>
		        <p class="list-text">조회수 ${mbvo.readCount }</p>
		        <p class="list-text">${mbvo.modAt.substring(0, 10) }</p>
		      </div>
		      <div class="card-footer">
		        <a href="/mBoard/detail?mbId=${mbvo.mbId }&authEmail=${authEmail }&pageNo=${pgn.pgvo.pageNo}&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}" 
		        	class="btn btn-outline-info btn-icon-right">
		          <span>보러 가기
		            <img src="https://static3.avast.com/1/web/i/v2/components/arrow-m-right-orange.png" height="24">
		          </span>
		        </a>
		      </div>
		    </div>
		    </c:forEach>
		</div>

		<ul class="pagination justify-content-center">
			<c:if test="${pgn.prev }">
				<li class="page-item">
					<a  class="page-link" href="/mBoard/hateList?pageNo=${pgn.startPage - 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pgn.startPage }" end="${pgn.endPage }" var="i">
				<li class="page-item ${pgn.pgvo.pageNo == i ? 'active':''}" aria-current="page">
					<a class="page-link" href="/mBoard/hateList?pageNo=${i }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">${i }</a>
				</li>
			</c:forEach>
			<c:if test="${pgn.next }">
				<li class="page-item">
					<a class="page-link" href="/mBoard/hateList?pageNo=${pgn.endPage + 1 }&qty=${pgn.pgvo.qty}&type=${pgn.pgvo.type}&keyword=${pgn.pgvo.keyword}">다음</a>
				</li>
			</c:if>
		</ul>

		<c:if test="${authEmail != null }">
			<a href="/mBoard/registerMovie" class="btn btn-outline-info regBtn">등록</a>
		</c:if>

	</div>
</div>
<script>
	let isUp = '<c:out value="${isUp}"/>';
	let isDel = '<c:out value="${isDel}"/>';
	if (parseInt(isUp)) {
		alert('게시글 등록 성공~');
	}
	if (parseInt(isDel)) {
		alert('게시글 삭제 성공~');
	}
</script>
<jsp:include page="../common/footer.jsp" />