<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form id="form1" action="uploadForm" method="post"
		  encType="multipart/form-data" target="zeroFrame">
		  <input type="file" name="file" />
		  <input type="submit" />
	</form>
	
	<iframe name="zeroFrame" style="display:none;"></iframe>
	
	<script>
		function addFilePath(msg){
			alert(msg);
			document.getElementById("form1").reset();
		}
	</script>
</body>
</html>







