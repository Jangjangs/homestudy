<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="../includes/header.jsp" %>
 <div class="wrap">
		<div class="row">
		<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board Register</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								Use Bootstrap's predefined grid classes to align labels and groups of form controls in a horizontal layout by adding <code>.form-horizontal</code> to the form (which doesn't have to be a <code>&lt;form&gt;</code>). Doing so changes <code>.form-groups</code> to behave as grid rows, so no need for <code>.row</code>.
							</small>
						</div>
						<form id="frm" method="post" class="form-horizontal" action="">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" name="title" id="title" placeholder="Title" required="required">
								</div>
							</div>
						
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">Content:</label>
								<div class="col-sm-9">
									<textarea class="form-control input-sm" name="content" id="content" placeholder="Your content..." required="required"></textarea>
								</div>
							</div>
							
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control input-sm" name="writer" id="writer" placeholder="Writer" required="required">
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" class="btn btn-success btn-sm">Submit Button</button>
									<button type="reset" class="btn btn-success btn-sm">Reset Button</button>
								</div>
							</div>
							<!-- ???????????? -->
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-1">
									<label for="uploadFile" class="col-sm-3 control-label">Attach File:</label>
									<div class="col-sm-9">
										<input type="file" class="form-control input-sm" name="uploadFile" id="uploadFile" placeholder="uploadFile" required="required" multiple="multiple">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<div class="col-sm-9 col-sm-offset-1">
									<label for="uploadFile" class="col-sm-3 control-label"></label>
									<div class="col-sm-9 uploadResult">
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
							
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
		</div>
	</div>
<script>
var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp|zip|hwp)$"); //???????????????
var maxSize = 1024*1024*5; //5mb

function checkExtension(fileName, fileSize){
	//????????????
	if(fileSize >= maxSize){
		alert("?????? ????????? ??????");
		return false;
	}
	//?????????????????????
	if(!regex.test(fileName)){
		alert("?????? ????????? ????????? ???????????? ??? ????????????.");
		return false;
	}
	return true;
}

function showUploadFile(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length == 0){
		return;
	}
	
	//console.log(uploadResultArr);
	let str = "";
	$(uploadResultArr).each(function( i, obj){
		//str += "<li>" + obj.fileName + "</li>";
		console.log(obj);
		if(obj.image){ // ???????????? ????????? ??????
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		
		str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName=" + fileRealPath + "'>";
		str += "<img src='../display?fileName=" + fileCallPath + "'></a>";
		str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='image'>X</span></li>";
		} else{
			var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
			str += "<a href='../download?fileName=" + fileRealPath + "'>";
			str += "???????????????</a>";
			str += "<span data-realfile='"+fileRealPath+"' data-file='"+fileCallPath+"' data-type='file'>X</span></li>";
		}
		
	
		
	});
	
	$(".uploadResult ul").append(str); //html
}

$(document).ready(function(){
	
	$("button[type=submit]").on("click",function(e){
		e.preventDefault();
		
		let title = $("#title").val();
		let content = $("#content").val();
		let writer = $("#writer").val();
		if(title == ''){
			alert("????????? ???????????????.");
			return;
		}
		if(content == ''){
			alert("????????? ???????????????.");
			return;
		}
		if(writer == ''){
			alert("???????????? ???????????????.");
			return;
		}
		
		let str = "";
		$(".uploadResult ul li").each(function(i, obj){
			console.log(obj);
			str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+$(obj).data('filename')+'">';
			str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+$(obj).data('uuid')+'">';
			str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+$(obj).data('path')+'">';
			str += '<input type="hidden" name="attachList['+i+'].fileType" value="'+$(obj).data('type')+'">';
		});
		
		$("#frm").append(str).submit();
	});
	
	var cloneObj = $(".uploadDiv").clone();
	
	$("input[type=file]").on("change",function(){
		var formData = new FormData();
		var inputfile = $("input[name=uploadFile]");
		var files = inputfile[0].files;
		
	
		for(var i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:"/admin/uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			success:function(result){
				//console.log(result);
				//alert("Success");
				
				//??????????????? ?????????
				//$(".uploadDiv").html(cloneObj.html());
				
				
				//?????? ?????? ??????
				showUploadFile(result);
				
			}
		});
		
		$(".uploadResult").on("click","span", function(){
			//console.log("span click");
			let targetRealfile = $(this).data("realfile"); //????????????
			let targetfile = $(this).data("file"); //???????????????
			let type = $(this).data("type");
			let span = $(this);
			
			//console.log(targetfile);
			//console.log(type);
			
			$.ajax({
				url: "../deleteFile",
				data:{
					fileRealName:targetRealfile,
					fileName:targetfile,
					type:type
				},
				dataType:"text",
				type:"POST",
				success:function(result){
					//console.log(result);
					if("delete" == result){
						span.parent().remove();
						
						$(".uploadDiv").html(cloneObj.html());
					}
				}
			});
		});
	});
});
</script>
 <%@ include file="../includes/footer.jsp" %>