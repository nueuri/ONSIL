// repert.properties.js info
// version : rexpert 3.0

// Rexpert context root url
rex_gsRexServiceRootURL = window.location.protocol + "//" + window.location.host + "/RexServer30/";

// preview page
rex_gsPreViewURL = rex_gsRexServiceRootURL + "rexpreview.jsp";

// rebfiles root directory
rex_gsReportURL = rex_gsRexServiceRootURL + "rebfiles/";

// cab & plugin download directory
rex_gsDownloadURL = rex_gsRexServiceRootURL + "cab/";

// setup page url
rex_gsSetupURL = rex_gsRexServiceRootURL + "cab/download/setup.jsp";

//Viewer Download Page URL
rex_gsViewerDownloadURL = rex_gsRexServiceRootURL + "cab/rexpert30viewer.exe";

// RexServer service url
rex_gsRptServiceURL = rex_gsRexServiceRootURL + "rexservice.jsp";

// default DBconnection
rex_gsUserService = "oracle1";

// viewer Version
rex_viewer_version = "1,0,0,347";

// setting CSV information
rex_gsCsvSeparatorColumn = "|*|";
rex_gsCsvSeparatorRow = "|#|";
rex_gsCsvSeparatorDataSet = "|@|";
rex_gsCsvEncoding = "utf-8"; 

// default XML xpath
rex_gsXPath = "gubun/rpt1/rexdataset/rexrow";

// Rexpert Web Viewer Windows Size
rex_gsPreViewFeatures = "center=yes,scrollbars=no,status=no,toolbar=no,resizable=1,location=no,menu=no,width=835,height=600";
rex_gsPreViewFeaturesModal = "center:yes;resizable:no;scroll:no;status:no;dialogWidth:825px;dialogHeight:600px";

// Use PreparedStatement
rex_gsUsePreparedStatement = "false";

/*
rex_gsHttpTimeout = {"connect.timeout": 60000
					, "control.send.timeout": 60000
					, "control.receive.timeout": 60000
					, "data.send.timeout": 60000
					, "data.receive.timeout": 60000};
*/

// plugin - webcrypto
/*
rex_gsPluginTypeWeb = "crypto.clipsoft";
rex_gsPluginWebParam = {"name": "name",
						"common-enable-encode": "1",
						"common-enable-decode": "0",
						"common-delimiter": "|!|",
						"common-encoding": "euc-kr",
						"common-enable-log": "0"};
*//*
rex_gsPluginTypeWeb = "crypto.xecureweb";
rex_gsPluginWebParam = {"name": "name",
						"common-enable-encode": "1",
						"common-enable-decode": "0",
						"common-delimiter": "|!|",
						"common-encoding": "euc-kr",
						"common-enable-log": "0",
						"common-log-filename": "c:\test2.log",
						"xecureweb-gateaddr": "ip-address:443:8080",
						"xecureweb-authtype": "",
						"xecureweb-mehtod": "POST"};
*/

// plugin - DRM
/*
rex_gsPluginType = "markany";

rex_gsPluginParam = {"datapath": rex_gsRexServiceRootURL + "/plugin/markany/MaFpsCommon.jsp",
					"datafilename": "MaPrintInfoCUSTRP.dat",
					"enablecapture": "0",
					"enablespool": "0",
					"enableprinter": "0",
					"printeroption": "3",
					"imagesaferoption": "0",
					"enableprinterdialog": "0"};
*/
//rex_gsPluginHttpParam = {"test": "abcd",
//						"test2": "1234"};

/*
rex_gsPluginType = "bcqure";
rex_gsPluginParam = {"initpath": rex_gsRexServiceRootURL +  "/plugin/bcqre/prnInit/",
					"datapath": rex_gsRexServiceRootURL +  "/plugin/bcqre/bcqre.server.jsp",
					"docnumber": "ksfc",
					"docname": "ksfc",
					"barcodewidth": "600",
					"barcodeminheight": "50",
					"barcodemaxheight": "200"};
*/

// plugin - DRM file
/*
rex_gsPluginFileType = "markany.drm";
rex_gsPluginFileParam = {"key1": "value1", "key2": "value2"};
*/


/*
rex_gsCss = [
         	"appearance.pagemargin.visible=0"
         	,"appearance.toolbar.button.print.enable=0"
         	,"accessibility.enable=0"
         	,"appearance.canvas.backcolor=rgb(255,255,0)"
         	,"appearance.control.backcolor=rgb(255,0,0)"
         	,"appearance.canvas.offsetx=0"
         	,"appearance.toolbar.button.open.visible=0"
         	,"appearance.toolbar.button.closewindow.visible=1"
         	,"appearance.tabheader.close.enable=0"
         	,"appearance.reportlist.visible=1"
         	,"print.appearance.allreportprint.enable=1"
         	,"print.allreportprint=1"
         ];
*/