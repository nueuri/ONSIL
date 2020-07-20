<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>dweng_BPM</title>
<script language="javascript" src="./rexscript/rexpert.min.js"></script>
<script language="javascript" src="./rexscript/rexpert.properties.js"></script>

</head>
<script language="JavaScript">
//--------------------------
// 해당 리모드 모두 인쇄
//--------------------------
function fnPrintAll() {

	var oReportAll = GetfnParamSet("printall");
	var oReport1 = GetfnParamSet("0");
	oReport1.rptname = "oracle1";
	
	var oReport2 = GetfnParamSet("1");
	oReport2.rptname = "Rexpert2";
	
	oReportAll.pushclear();
	
	oReportAll.push(oReport1);
	oReportAll.push(oReport2);

		
	oReportAll.event.finishdocument = fnReportEvent;
	oReportAll.event.finishprintalleach = fnReportEvent;
	oReportAll.event.finishprintall = fnReportEvent;
	
	oReportAll.printall(true, 1, -1, 1, "");   // 다이얼로그표시유무, 시작페이지, 끝페이지, 카피수, 옵션
}
// event handler 
function fnReportEvent(oRexCtl, sEvent, oArgs) {
	//alert(sEvent);

	if (sEvent == "init") {
	} else if (sEvent == "finishdocument") {
		alert(oRexCtl.IsDataSetEmpty());
	} else if (sEvent == "finishprint") {
	} else if (sEvent == "finishexport") {
	} else if (sEvent == "hyperlinkclicked") {
	} else if (sEvent == "finishprintalleach") {
		var oReport = oArgs.report;
		//alert(oReport.rptname);
	} else if (sEvent == "finishprintall") {
		var oReports = oArgs.reports;
		alert(oReports.length + "건 인쇄되었습니다.");
	}

	//window.close();
}

</script>
<body>
	<button onclick="fnPrintAll();">리포트 인쇄(printall)</button>
</body>
</html>