<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="../includes/header.jsp" %>
 <div class="wrap">
 	<div class="row">
 		<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">게시판 tables</h4>
					<p class="m-b-lg docs">
						Create responsive tables by wrapping any <code>.table</code> in <code>.table-responsive</code> to make them scroll horizontally on small devices (under 768px). When viewing on anything larger than 768px wide, you will not see any difference in these tables.
					</p>
					<div style="text-align:right;" class="form-group"><a href="register" class="btn btn-default btn-sm" role="btn">New register</a></div>
					<div class="table-responsive">
						<table class="table">
						<colgroup>
						<col style="width:80px"/>
						<col style=""/>
						<col style="width:100px"/>
						<col style="width:150px"/>
						<col style="width:150px"/>
						<col style="width:80px"/>
						</colgroup>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
								<th>조회수</th>
							</tr>
							<c:set value="0" var="rowCnt"/>
							<c:forEach items="${list }" var="board">
							<tr>
								<td>${board.bno }</td>
								<td><a href="get${pageMaker.cri.listLink }&bno=${board.bno}">${board.title }</a>
								<c:if test="${board.replyCnt gt 0 }">
								<span class="badge badge-danger"><c:out value="${board.replyCnt }"></c:out></span>
								</c:if>
								</td>
								<td>${board.writer }</td>
								<td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								<td><fmt:formatDate value="${board.updatedate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${board.hit }</td>
							</tr>
							<c:set value="${rowCnt+1 }" var="rowCnt"/>
							</c:forEach>						
							
							<c:if test="${rowCnt eq 0}">
							<tr>
								<td colspan="6">등록된 글이 없습니다.</td>
							</tr>
							</c:if>
						
						</table>
					</div>
					<div class="row">
						<div class="col-md-6 pagination">
							<form action="" class="form-inline">
								<select name="type" class="form-control" style="min-width:10px;">
									<option value="">선택</option>
									<option value="T">제목</option>
									<option value="C">내용</option>
									<option value="W">작성자</option>
									<option value="TC">제목+내용</option>
									<option value="TCW">전체</option>
								</select>
								<input type="text" name="keyword" class="form-control">
								<button class="btn btn-default">검색</button>
							</form>
						
						</div>
						<div class="col-md-6">
					<!-- page -->
						<nav style="text-align:right;">
						  <ul class="pagination">
						  <c:if test="${pageMaker.prev }">
						    <li>
						      <a href="${pageMaker.startPage-1 }" aria-label="Previous" class="btn_pagination">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
						    <c:if test="${pageMaker.cri.pageNum eq num }">
						    <li class="active">
						    	<a>${num}</a>
						    </li>
						    </c:if>
						    
						    <c:if test="${pageMaker.cri.pageNum ne num }">
						    <li><a href="${num }" class="btn_pagination">
						    	${num}
						    </a></li>
						    </c:if>
						   </c:forEach>
						    <c:if test="${pageMaker.next }">
						    <li>
						      <a href="${pageMaker.endPage+1 }" aria-label="Next" class="btn_pagination">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						     </c:if>
						  </ul>
						</nav>
					<!-- page -->
					</div>
				</div>
				</div><!-- .widget -->
			</div>
		</div><!-- END column -->
</div>
<form id ="frm">
	<input type="text" name="pageNum" value=""> 
	<input type="text" name="amount" value="${pageMaker.cri.amount}"> 
	<input type="text" name="type" value="${pageMaker.cri.type}"> 
	<input type="text" name="keyword" value="${pageMaker.cri.keyword}"> 
	<button></button>
	</form>
	
<script>
$(document).ready(function(){
	$(".btn_pagination").on("click",function(e){
		e.preventDefault();
		console.log("BTN"+$(this).attr("href"));
		let href = $(this).attr("href");
		$("input[name=pageNum]").val(href);
		$("#frm").submit();
	});
});
</script>
 <%@ include file="../includes/footer.jsp" %>