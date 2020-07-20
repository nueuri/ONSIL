﻿<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("utf-8");

String crfName   = request.getParameter("crfName");
String conName   = request.getParameter("conName");
String crfParams   = request.getParameter("crfParams");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sampleall</title>
<script type="text/javascript" src="./rexscript/rexpert.min.js"></script>
<script type="text/javascript" src="./rexscript/rexpert.properties.js"></script>
<script type="text/javascript">
//--------------------------
// 기본적인 사용 예
//--------------------------
window.onload = function(){
	
	var crfName = "<%=crfName%>";
	var conName = "<%=conName%>";
	var crfParams = "<%=crfParams%>";
	
	// 필수 - 레포트 생성 객체
	var oReport = GetfnParamSet();

	oReport.rptname = crfName;
	oReport.connectname= conName;
	
	oReport.param("MG_ENP_CD").value = "E1950150026";
	oReport.param("PF_YY").value = "2018";
	oReport.param("POB_SEQ").value = "all";
	oReport.param("DOC_SEQ").value = "TEMP_DATA";

	oReport.save(true, "pdf", "report4.pdf", 1, -1, "");	// 다이얼로그표시유무, 파일타입, 파일명, 시작페이지, 끝페이지, 카피수, 옵션
}
</script>
</head>
<body>
	<script type="text/javascript">
		rex_writeRexCtl("RexCtl", "0", "0");
	</script>
</body>
</html>