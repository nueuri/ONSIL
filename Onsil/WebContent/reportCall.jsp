<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="stext/html; charset=utf-8">

<script type="text/javascript" src="/RexServer30/rexscript/rexpert.min.js"></script>
<script type="text/javascript" src="/RexServer30//rexscript/rexpert.properties.js"></script>

<title>Insert title here</title>
<%
//response.setHeader("Access-Control-Allow-Origin", "*");
%>
<script type="text/javascript">

	function exportPDF40() {
		form = document.rexForm;
		form.action = "./ClipReport4/exportForPDF.jsp";
		form.target = "export_iframe";
		form.submit();
	}
	
	function exportPDF30() {
		form = document.rexForm;
		form.action = "./RexServer30/sampleall.jsp";
		form.target = "export_iframe";
		form.submit();
	}


</script>
</head>

<body>
	<!-- form : action="url" name="식별자" method="http메소드" -->
	<form id="rexForm" name="rexForm" method="post" target="popwin">
		<!-- 전송버튼  -->
		<input type="button" value="4.0 pdf export" onclick="exportPDF40()">
		<input type="button" value="3.0 pdf export" onclick="exportPDF30()"><br><br>	
		
		<!-- CRF 파일 이름  -->
		1. crf name: <input type="text" name="crfName" value="/hk/OGOEDTA000R" size=25><br>
		<!-- JDBC Connection, dbname 설정 값 -->
		2. con name: <input type="text" name="conName" value="hk" size=25><br>
		<!-- parameter -->
		3. Parameter: <input type="text" name="crfParams" value="OGOEDTA000R:Y|OGOEDTA001R:Y|"><br>

	<!-- 리포트 출력 영역 -->
	<div>
	<iframe  width="0%" height="0%"name="export_iframe" id="export_iframe"></iframe>
	</div>
</form>
</body>
</html> 