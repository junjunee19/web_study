<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<%@include file="../include/header.jsp"%>

<style>
button#searchBtn{	
	width:27px;
	height:27px;
	background-image:url('/board/resources/dist/img/search.png');	
	background-position:center;
	background-size:contain;	
	background-color:white;	
	box-sizing:border-box;
	padding:6px;
	 
}
.box-body ul{
	list-style:none;
	overflow:hidden;
}
.box-body ul li{
	height:40px;
	line-height:20px;
}
.box-body ul li:nth-child(1){
	float:left;
}
.box-body ul li:nth-child(2){
	float:right;
}
.box-body ul li:nth-child(2)>input{
	width:300px;
}

</style>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class='box'>
				<div class="box-header with-border">
					<h3 class="box-title">Board List</h3>
				</div>
				<div class='box-body'>
					<ul>
						<li>
							<button type="button" id="pdfBtn" class="btn btn-warning" >PDF</button>
							<button type="button" id="excelBtn" class="btn btn-warning" >Excel</button>
							<sec:authorize access="isAuthenticated()">
								<button id='newBtn' class="btn btn-primary" onclick="javascript:location.href='register';">New Board</button>
							</sec:authorize>
						</li>
						<li>
							<select name="searchType">
								<option value="" ${cri.searchType==null?'selected':'' }>
								------</option>
								<option value="t" ${cri.searchType eq 't'?'selected':'' }>
								Title</option>
								<option value="c" ${cri.searchType eq 'c'?'selected':'' }>
								Content</option>
								<option value="w" ${cri.searchType eq 'w'?'selected':'' }>
								Writer</option>
								<option value="tc" ${cri.searchType eq 'tc'?'selected':'' }>
								Tiltle + Content</option>
								<option value="cw" ${cri.searchType eq 'cw'?'selected':'' }>
								Content + Writer</option>
								<option value="tcw" ${cri.searchType eq 'tcw'?'selected':'' }>
								Title + Content + Writer</option>
							</select>
							<input id="keywordInput"
								   name="keyword"
								   type="text" />
							<button id="searchBtn" ></button>
						</li>
					</ul>
				</div>
			</div>
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">LIST PAGING</h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th style="width: 10px">BNO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>REGDATE</th>
							<th style="width: 40px">VIEWCNT</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.bno}</td>
								<td><a
									href='readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title}</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regDate}" /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">
					<div class="text-center">
						<ul class="pagination link">
 
							<c:if test="${pageMaker.prev}">
								<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${idx}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.endPage +1}">&raquo;</a></li>
							</c:if>

						</ul>
						
						
					</div>


				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<form id="jobForm">
  <input type='hidden' name="page" value=${pageMaker.cri.page}>
  <input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	<c:remove var="msg" />
	
	$(".link li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","listPage").attr("method", "get");
		jobForm.submit();
	});
	
	$('#searchBtn').on('click',function(){
		self.location="listPage"
					   +"${pageMaker.makeQuery(1)}"
					   +"&searchType="
					   +$("select option:selected").val()
					   +"&keyword="
					   +$('#keywordInput').val();
	});
	
	
	$('#pdfBtn').on('click',function(event){
		location.href="listPage/pdf?page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}";
	});
	$('#excelBtn').on('click',function(event){
		location.href="listPage/excel?page=${pageMaker.cri.page}&perPageNum=${pageMaker.cri.perPageNum}";		
	});
</script>

<%@include file="../include/footer.jsp"%>










