function checkImageType(fileName){
	var pattern=/jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

function getFileInfo(fullName,contextPath){
	
	var fileName,imgsrc,getLink;
	var fileLink;
	if(checkImageType(fullName)){
		imgsrc=contextPath+"/displayFile?fileName="+fullName;
		fileLink=fullName.substr(14);
		
		var front=fullName.substr(0,12); // /2017/12/15/
		var end=fullName.substr(14); // s_ 이후
		
		getLink=contextPath+"/displayFile?fileName="+front+end;		
	}else{
		imgsrc=contextPath+"/resources/dist/img/file.png";
		fileLink=fullName.substr(12);
		getLink=contextPath+"/displayFile?fileName="+fullName;
	}
	
	
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName};
	
}








