<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@include file="../include/header.jsp"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='bno' value="${boardVO.bno}"> <input
		type='hidden' name='page' value="${cri.page}"> <input
		type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							readonly="readonly">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer}"
							readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->
				
				<!-- attach list -->
				<ul class="mailbox-attachments clearfix uploadedList"></ul>
				
				<div class="box-footer">
					
					<c:choose>
						<c:when test="${boardVO.writer eq loginUser.userid }">
							<button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
							<button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
						</c:when>
						<c:otherwise>
							<sec:authorize access="hasAnyRole('ROLE_MANAGER','ROLE_ADMIN')">
								<button type="submit" id="modifyBtn" class="btn btn-warning">Modify</button>
							</sec:authorize>					
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<button type="submit" id="removeBtn" class="btn btn-danger">REMOVE</button>
							</sec:authorize>						
						</c:otherwise>
					</c:choose>					
					<button type="submit" id="listBtn" class="btn btn-primary">GO LIST</button>
				</div>


<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#removeBtn").on("click", function() {
			
			var arr=[];
			$('.uploadedList li').each(function(event){
				arr.push($(this).attr("data-src"));
				
			});
			
			if(arr.length>0){
				$.post('<%=request.getContextPath()%>/deleteAllFiles',{files:arr},function(){});				
			}
			
			formObj.attr("action", "removePage");
			formObj.submit();
		});

		$("#listBtn").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "listPage");
			formObj.submit();
		});

	});
</script>
<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="exampleInputEmail1" >Writer</label>
					<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"
					value="${boardVO.writer}"
					readonly="readonly"> 
					<label for="exampleInputEmail1">Reply Text</label>
					<input class="form-control" type="text"	placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">ADD
						REPLY</button>
				</div>
			</div>


			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">
						Replies List </span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


          
<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>      
	
	
</section>
<!-- /.content -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-primary btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
{{/each}}
</script>
<script id="templateAttach" type="text/x-handlebars-template">
<li style="width:10%;font-size:0.8em;" data-src="{{fullName}}">
	<span class="mailbox-attachment-icon has-img">
      <img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
	  <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>      
    </div>
</li>

</script>
<script>
	Handlebars.registerHelper("prettifyDate",function(timeValue){
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth();
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	});
	
	var printData=function(replyArr,target,templateObject){
		var template=Handlebars.compile(templateObject.html());
		var html=template(replyArr);
		$('.replyLi').remove();
		target.after(html);
	};
	var printPaging=function(pageMaker,target){
		var str="";
		if(pageMaker.prev){
			str+="<li><a href='"+(pageMaker.startPage-1)
					+"'> << </a></li>";
		}
		for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++){
			var strClass = pageMaker.cri.page==i?'class=active':'';
			str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str+="<li><a href='"+(pageMaker.endPage+1)
				+"'> >> </a></li>";
		}
		target.html(str);
	}
	
	var bno=${boardVO.bno};
	var replyPage=1;
	
	getPage("<%=request.getContextPath()%>/replies/"+bno+"/1");	
	
	
	
	function getPage(pageInfo){
		$.getJSON(pageInfo,function(data){
			printData(data.list,$('#repliesDiv'),$('#template'));
			printPaging(data.pageMaker,$('.pagination'))
		});
	}
	
	$('#replyAddBtn').on('click',function(event){
		var replyer=$('#newReplyWriter').val();
		var replytext=$('#newReplyText').val();
		
		if(replyer==""){
			alert('댓글 작성자는 필수입니다.');
			$('#newReplyWriter').focus();
			return;
		}
		if(replytext==""){
			alert('댓글 내용은 필수입니다.');
			$('#newReplyText').focus();
			return;
		}
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/replies",
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"post"
			},
			dataType:'text',
			data:JSON.stringify({
				"bno":bno,
				"replyer":replyer,
				"replytext":replytext
			}),
			success:function(data){
				if(data="SUCCESS"){
					alert('등록되었습니다.');
				}	
				replyPage=1;
				getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+replyPage);
				$('#newReplyWriter').val("");
				$('#newReplyText').val("");
			}
			
		});
	});
	
	$('.pagination').on('click','li a',function(event){		
		event.preventDefault();		
		var replyPage=$(this).attr("href");
		getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+replyPage);
	});
	
	$('.timeline').on('click','.replyLi',function(event){
		var reply=$(this);
		$('#replytext').val(reply.find('.timeline-body').text());
		$('.modal-title').html(reply.attr('data-rno'));
	});
	
	$('#replyModBtn').on('click',function(event){
		var rno=$('.modal-title').html();
		var replytext=$('#replytext').val();
		$.ajax({
			type:'put',
			url:"<%=request.getContextPath()%>/replies/"+rno,
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"PUT"
			},
			data:JSON.stringify({replytext:replytext}),
			dataType:'text',
			success:function(result){
				if(result=="SUCCESS"){
					alert("수정되었습니다.");
					$('#modifyModal').modal('hide');
					getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+replyPage);
				}
			}
			
		});
	});
	
	$('#replyDelBtn').on('click',function(event){
		var rno=$('.modal-title').html();
		
		$.ajax({
			type:'delete',
			url:"<%=request.getContextPath()%>/replies/"+rno,
			headers:{
				"Content-Type":"application/json",
				"X-HTTP-Override":"delete"
			},
			dataType:'text',
			success:function(result){
				if(result="SUCCESS"){
					alert("삭제되었습니다.");
					$('#modifyModal').modal('hide');
					getPage("<%=request.getContextPath()%>/replies/"+bno+"/"+replyPage);
				}
			}
		});
	});
</script>

<!-- attach list -->
<script 
   src="<%=request.getContextPath() %>/resources/js/upload.js" >
</script>

<script>
	
	var bno=${boardVO.bno};
	var template=Handlebars.compile($('#templateAttach').html());

	$.getJSON("getAttach/"+bno,function(list){
		$(list).each(function(){
			var fileInfo=getFileInfo(this,"<%=request.getContextPath()%>");
			var html=template(fileInfo);
			$('.uploadedList').append(html);
			
		});
	});
</script>

<%@include file="../include/footer.jsp"%>











