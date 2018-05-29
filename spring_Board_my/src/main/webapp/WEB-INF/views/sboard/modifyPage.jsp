<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<head>
	<style>
		.fileDrop{
			width:80%;
			height:100px;
			border:1px dotted gray;
			background-color:lightslategray;
			margin:auto;
		}
		.popup{
			position:absolute;
			left:0;
			top:0;
		}
		.back{
			background-color:gray;
			opacity:0.5;
			width:100%;
			height:100%;
			overflow:hidden;
			z-index:1101;
		}
		.front{		
			margin-top:-200px;
			margin-left:-200px;	
			left:50%;
			top:50%;			
			z-index:999999;		
			opacity:1;
			border:1px;		
			
		}
		.show{			
			width:400px;
			height:400px;
											
			background-position:center;
			background-size:cover;
			background-repeat:no-repeat;
		}
	</style>
</head>

<body>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">MODIFY BOARD</h3>
				</div>
				<!-- /.box-header -->

<form role="form" action="modifyPage" method="post">

	<input type='hidden' name='page' value="${cri.page}"> 
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	<input type='hidden' name='searchType' value="${cri.searchType}">
	<input type='hidden' name='keyword' value="${cri.keyword}">

					<div class="box-body">

						<div class="form-group">
							<label for="exampleInputEmail1">BNO</label> 
							<input type="text" name='bno' class="form-control" value="${boardVO.bno}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Title</label> <input type="text"
								name='title' class="form-control" value="${boardVO.title}">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Content</label>
							<textarea class="form-control" name="content" rows="3">${boardVO.content}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Writer</label> 
							<input readonly type="text" name="writer" class="form-control"
								value="${boardVO.writer}">
						</div>
						<div class="form-group">
							<label>File DROP Here</label>
							<div class="fileDrop"></div>
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<div>
						<hr/>
					</div>
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<button type="submit" class="btn btn-warning">SAVE</button>
					<button type="submit" class="btn btn-primary">CANCEL</button>
				</div>

<script>
$(document).ready(
	function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-primary")
				.on("click",function() {
					self.location = "listPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				});

		$(".btn-warning").on("click",function() {
					formObj.submit();
				});
	});
</script>




			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<!-- div popup -->
<div class="popup back" style="display:none;"></div>
<div id="popup_front" class="popup front" style="disply:none;">
	<div id="popup_img" ></div>
</div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/upload.js" ></script>
<script id="template" type="text/x-handlebars-template">
<li style="width:10%;font-size:0.8em;cursor:pointer;">
	<span class="mailbox-attachment-icon has-img">
      <img src="{{imgsrc}}" alt="Attachment"></span>
    <div class="mailbox-attachment-info">
	  <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
      <a href="{{fullName}}"
         class="btn btn-default btn-xs pull-right delbtn">
			<i class="fa fa-fw fa-remove"></i></a>
    </div>
</li>
</script>
<script>
	var template=Handlebars.compile($('#template').html());
	$(document).on("dragenter dragover drop",function(event){
		event.preventDefault();
	});
	$('.fileDrop').on('drop',function(event){

		var files=event.originalEvent.dataTransfer.files;
		var file=files[0];
		
		var formData=new FormData();
		formData.append("file",file);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/uploadAjax",
			type:"post",
			data:formData,
			processData:false,
			contentType:false,
			success:function(data){
				var fileInfo=getFileInfo(data,"<%=request.getContextPath()%>");
				var html=template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	})
	
	$('.uploadedList').on('click','.delbtn',function(event){
		event.preventDefault();
		event.stopPropagation();
		
		$(this).parent('div').parent('li').remove();		
	});
	
	var bno=${boardVO.bno};
	
	$.getJSON("getAttach/"+bno,function(list){
		$(list).each(function(){
			var fileInfo=getFileInfo(this,"<%=request.getContextPath()%>");
			var html=template(fileInfo);
			$('.uploadedList').append(html);
			
		});
	});
	
	$('.uploadedList').on('click','li',function(event){
		
		var fileLink=$(this).find('.mailbox-attachment-name').attr('href');
		if(checkImageType(fileLink)){
			event.preventDefault();
			
			var imgTag=$('#popup_img');
			imgTag.css('background-image','url("'+fileLink+'")');
			
			
			
			imgTag.addClass("show");			
			$('.popup').show('slow');
		}
	});
	
	$('.popup').on('click',function(event){
		$('.popup').hide();
	});
	
	var formObj=$("form[role='form']");
	
	formObj.submit(function(event){
		event.preventDefault();
		
		var str="";
		$('.uploadedList .delbtn').each(function(){
			 str+="<input type='hidden' name='files' value='"
			 +$(this).attr("href")+"' />;"
		});
		
		
		
		formObj.append(str);
		formObj.get(0).submit();
	});

	
</script>



</body>

<%@include file="../include/footer.jsp"%>











