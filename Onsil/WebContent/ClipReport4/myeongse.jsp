<%@page import="com.clipsoft.clipreport.oof.connection.param.OOFHTTPParam"%>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="java.io.File"%>
<%@page import="com.clipsoft.clipreport.server.service.ReportUtil"%>
<%@page import="com.clipsoft.clipreport.oof.connection.*"%>
<%@page import="com.clipsoft.clipreport.oof.connection.OOFConnectionHTTP"%>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%

OOFDocument oof = OOFDocument.newOOF();

//명세서2-이행결과서
OOFFile file = oof.addFile("crf.root", "%root%/crf/hk2/OGOEPRAALLR.crf");

oof.addConnectionData("*","hk");

oof.addField("MG_ENP_CD","M2100110038");//이마트
oof.addField("PF_YY","2017");
oof.addField("DOC_SEQ","TEMP_DATA");
oof.addField("POB_SEQ","all");

oof.addField("OGOEPRA100R", "Y");
oof.addField("OGOEDTA001R", "Y");
oof.addField("OGOEDTA002R", "Y");
oof.addField("OGOEDTA003R", "Y");
oof.addField("OGOEPRA101R", "Y");
oof.addField("OGOEPRA108R", "Y");
oof.addField("OGOEDTA004R", "Y");
oof.addField("OGOEDTA005R", "Y");
oof.addField("OGOEPRA102R", "Y");
oof.addField("OGOEPRA109R", "Y");
oof.addField("OGOEPRA110R", "Y");
oof.addField("OGOEPRA103R", "Y");
oof.addField("OGOEPRA104R", "Y");
oof.addField("OGOEPRA105R", "Y");
oof.addField("OGOEPRA106R", "Y");
oof.addField("OGOEPRA107R", "Y");

System.out.println(oof.toString());

%><%@include file="Property.jsp"%>
<%

String resultKey =  ReportUtil.createReport(request, oof, "false", "false", request.getRemoteAddr(), propertyPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Report</title>
<meta name="viewport" content="width=700, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<link rel="stylesheet" type="text/css" href="../css/clipreport.css">
<link rel="stylesheet" type="text/css" href="../css/UserConfig.css">
<link rel="stylesheet" type="text/css" href="../css/font.css">
<script type='text/javascript' src='../js/jquery-1.11.1.js'></script>
<script type='text/javascript' src='../js/clipreport.js'></script>
<script type='text/javascript' src='../js/UserConfig.js'></script>
<script type='text/javascript'>
var urlPath = document.location.protocol + "//" + document.location.host;
	
function html2xml(divPath){	
    var reportkey = "<%=resultKey%>";
	var report = createImportJSPReport(urlPath + "/ClipReport4/Clip.jsp", reportkey, document.getElementById(divPath));

	report.view();
}

</script>
</head>
<body onload="html2xml('targetDiv1')">
<div id='targetDiv1' style='position:absolute;top:5px;left:5px;right:5px;bottom:5px;'></div>
</body>
</html>
