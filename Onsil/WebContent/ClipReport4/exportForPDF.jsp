<%@page import="com.clipsoft.org.json.simple.JSONObject"%>
<%@page import="com.clipsoft.clipreport.export.option.PDFOption"%>
<%@page import="com.clipsoft.clipreport.oof.OOFFile"%>
<%@page import="com.clipsoft.clipreport.oof.OOFDocument"%>
<%@page import="com.clipsoft.clipreport.server.service.ClipReportExport"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.clipsoft.clipreport.oof.connection.*"%>
<%@include file="Property.jsp"%>
<%
out.clear(); // where out is a JspWriter
out = pageContext.pushBody();

request.setCharacterEncoding("utf-8");

String crfName   = request.getParameter("crfName");
String conName   = request.getParameter("conName");
String crfParams   = request.getParameter("crfParams");

OOFDocument oof = OOFDocument.newOOF();
OOFFile file = oof.addFile("crf.root", "%root%/crf/"+ crfName +".crf");

oof.addConnectionData("*",conName);

String[] crfParamsArr = crfParams.split("\\|");

for(String param : crfParamsArr){
	String[] temp = param.split(":");
	String name  = ""; 
	String value = "";
	
	if( temp.length == 0 ){
		name  = "";
		value = "";
	} else if( temp.length == 1 ){
		name  = temp[0];
		value = "";
	} else if( temp.length == 2 ){
		name  = temp[0];
		value = temp[1];
	}
	oof.addField(name, value);
}
//서버에 파일로 저장 할 때
/* File localFileSave = new File("E:\\test.pdf");
OutputStream fileStream = new FileOutputStream(localFileSave); */

//클라이언트로 파일을 내릴 때
String fileName = "report.pdf";
response.setContentType("application/octet-stream; charset=UTF-8");
response.setHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
OutputStream fileStream = response.getOutputStream();

//클라이언트 브라우져에서 바로 보는 방법(헤더 변경)
//response.setContentType("application/pdf");
//OutputStream fileStream = response.getOutputStream();

PDFOption option = null;
/*
option = new PDFOption();
option.setUserPassword("사용자(읽기) 암호");
option.setOwnerPassword("저자(쓰기) 암호");
option.setTextToImage(true); // 글자를 이미지로 처리 - unicode 처리시 사용
option.setNumCopies(1); // 프린팅 매수 미리 설정
option.setImportOriginImage(true); // 원본 이미지 삽입
option.setNotAllowCopy(true); //text복사 방지 (1.0.0.84 version 부터 적용)
option.setEditable(false); // 편집 허용 여부 (1.0.0.173 version 부터 적용)
*/
//pdf 생성 데이터를 한번에 저장
//boolean isDataSaveOnce = true;
//int statusType = ClipReportExport.createExportForPDF(request, fileStream, propertyPath, oof, option, isDataSaveOnce);

int statusType = ClipReportExport.createExportForPDF(request, fileStream, propertyPath, oof, option);
//System.out.println(statusType);

//System.out.println(statusType2);
//statusType == 0 정상적인 출력
//statusType == 1 인스톨 오류
//statusType == 2 oof 문서 오류
//statusType == 3 리포트 엔진 오류
//statusType == 4 PDF 출력 오류
//statusType == 5 리포트의 페이지 0 일 경우 오류

/*
 	response.setContentType("application/json");
	JSONObject obj = new JSONObject();
	String json = "{\"errorCode\" :" + "0" + "}";
	out.print(json);
	System.out.print("json"+json);
	response.getWriter().write(json.toString());
*/

%>
