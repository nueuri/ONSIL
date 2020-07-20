<%@ page language="java" contentType="text/html; charset=UTF-8"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Rexpert Viewer</title>
<script type="text/javascript" src="./rexscript/rexpert.min.js"></script>
<script type="text/javascript" src="./rexscript/rexpert.properties.js"></script>
<script type="text/javascript">
    var goAgent = new rex_Agent();
    var goOOF = null;
    var goParamSet = {};
    var gid = "";

    var gaReports = new Array();
    var gaReportsIndex = 0;
    var gaReportsIndexTmp = 0;

    var giTimerCnt = 0;
    function init() {
        if (goAgent.isWin) {
            try {
                setTimeout(OnLoad, 1);
            } catch (ex) {
                if (goAgent.isSF) {
                    giTimerCnt++;

                    if (giTimerCnt < 50) {
                        setTimeout(init, 600);
                    } else {
                        alert("initial timeout.(safari plug-in bug)");
                        return;
                    }
                }

                return;
            }
        } else {
            setTimeout(OnLoad, 600);
        }
    }

    function OnLoad() {
        gid = "";
        var sParam = window.location.search;
        sParam = sParam.substr(1);
        var aParam = sParam.split("=");

        gid = aParam[1];

        var oOOF = null;

        if (opener != undefined) {
            oOOF = opener.rex_goParamSet[gid];
            goParamSet = opener.rex_goParamSet;
        } else if (parent.rex_goParamSet[gid] != undefined) {
            oOOF = parent.rex_goParamSet[gid];
            goParamSet = parent.rex_goParamSet;
        } else if (window.dialogArguments != undefined) {
            oOOF = window.dialogArguments.rex_goParamSet[gid];
            goParamSet = window.dialogArguments.rex_goParamSet;
        }

        if (oOOF == null)
            return;
        if (goParamSet == null)
            return;

        for ( var vParam in goParamSet) {
            gaReports.push(goParamSet[vParam]);
        }

        goOOF = oOOF;
        document.title = goOOF.windowtitle;

        if (oOOF.opentype == "export") {
            ExportServer();
        } else {
            if ((goAgent.isWin || goAgent.isIE)) {
                var printoption = oOOF.printoption;
                var exportoption = oOOF.exportoption;
                var toolbarbuttonoption = oOOF.toolbarbuttonoption;

                if (printoption != null) {
                    rex_fnPrintSetting(RexCtl, printoption);
                }

                if (exportoption != null) {
                    rex_fnExportVisible(RexCtl, exportoption);
                }

                if (toolbarbuttonoption != null) {
                    rex_fnToolBarButtonEnableTrue(RexCtl, toolbarbuttonoption);
                }

                if (gid == "rex_toc") {
                    fnOpenToc();
                } else {
                    fnOpen(oOOF);
                }
            } else {
                // Mac, Linux, Others
                if (oOOF.viewertype == "html4") {
                    rex_ifrmRexPreview.location.href = "./hero/client/html4/hero.client.html4.jsp";
                } else {
                    rex_ifrmRexPreview.location.href = "./hero/client/html5/hero.client.html5.jsp";
                }

                return;
            }
        } //end if
    }

    function fnOpen(oOOF) {
        try {
            if (typeof (rex_gsCss) != "undefined") {
                for (var i = 0; i < rex_gsCss.length; i++) {
                    RexCtl.SetCSS(rex_gsCss[i]);
                }
            }

            RexCtl.SetCSS("appearance.canvas.offsetx=0");
            RexCtl.SetCSS("appearance.canvas.offsety=0");
            RexCtl.SetCSS("appearance.canvas.alignment=center");
            RexCtl.SetCSS("appearance.canvas.backcolor=rgb(128,128,128)");
            RexCtl.SetCSS("appearance.paper.backgroundtransparent=0");
            RexCtl.SetCSS("appearance.paper.bordertransparent=0");
            RexCtl.SetCSS("license.server.path=" + rex_gsRexServiceRootURL + "license.jsp");
            RexCtl.UpdateCSS();
        } catch (ex) {
            return;
        }

        if (goOOF.event.init != null) {
            goOOF.event.init(RexCtl, "init", null);
        }

        if (oOOF.opentype == "open" || oOOF.opentype == "openmodal") {
            RexCtl.OpenOOF(oOOF.toString());
        } else if (oOOF.opentype == "iframe") {
            RexCtl.OpenOOF(oOOF.toString());
        } else if (oOOF.opentype == "print") {
            RexCtl.OpenOOF(oOOF.toString());
            //RexCtl.Print(false, 1,-1,1,"");
        } else if (oOOF.opentype == "printdirect") {
            RexCtl.OpenOOF(oOOF.toString());
            //RexCtl.PrintDirect("HP LaserJet 3050" , 260, 1, -1, 1, "");
        } else if (oOOF.opentype == "save") {
            RexCtl.OpenOOF(oOOF.toString());
            //RexCtl.Export(false, "pdf", "c:\\test.pdf", 1,-1,"");
        } else if (oOOF.opentype == "saveupload") {
            RexCtl.OpenOOF(oOOF.toString());
            //RexCtl.Export(false, "pdf", "c:\\test.pdf", 1,-1,"");
        }
    }

    function fnOpenToc() {
        try {
            if (typeof (rex_gsCss) != "undefined") {
                for (var i = 0; i < rex_gsCss.length; i++) {
                    RexCtl.SetCSS(rex_gsCss[i]);
                }
            }

            RexCtl.SetCSS("appearance.canvas.offsetx=0");
            RexCtl.SetCSS("appearance.canvas.offsety=0");
            RexCtl.SetCSS("appearance.canvas.alignment=center");
            RexCtl.SetCSS("appearance.canvas.backcolor=rgb(128,128,128)");
            RexCtl.SetCSS("appearance.paper.backgroundtransparent=0");
            RexCtl.SetCSS("appearance.paper.bordertransparent=0");

            RexCtl.SetCSS("license.server.path=" + rex_gsRexServiceRootURL + "license.jsp");
            RexCtl.UpdateCSS();
        } catch (ex) {
            return;
        }

        if (goOOF.event.init != null) {
            goOOF.event.init(RexCtl, "init", null);
        }

        gaReportsIndexTmp = gaReports.length;

        fnOpenTocSub();
    }

    function fnOpenTocSub() {
        for (var i = 0; i < gaReports.length; i++) {
            var oReport = gaReports[i];
            goOOF = oReport;
            RexCtl.OpenOOF(oReport.toString());
        }
    }

    function ExportServer() {
        var oAjax = rex_GetgoAjax();

        oAjax.Path = rex_gsRptExportURL;
        oAjax.Open();

        oAjax.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

        oAjax.AddParameter("oof", goOOF.toString());
        oAjax.AddParameter("filename", goOOF.exportservice.filename);
        oAjax.AddParameter("filetype", goOOF.exportservice.filetype);
        oAjax.AddParameter("afterjob", goOOF.exportservice.afterjob);

        oAjax.Send();

        var sRtn = oAjax.Response();

        if (goOOF.event.finishexportserver != null) {
            goOOF.event.finishexportserver(RexCtl, "finishexportserver", {
                "returnval" : sRtn
            });
        }
    }

    function fnTimerExport() {
        RexCtl.Export(goOOF.save.dialog, goOOF.save.filetype, goOOF.save.fileName, goOOF.save.startpage, goOOF.save.endpage, goOOF.save.Option);
    }

    function fnTimerExportUpload() {
        RexCtl.ExportUpload(goOOF.saveupload.dialog, goOOF.saveupload.filetype, goOOF.saveupload.fileName, goOOF.saveupload.startpage, goOOF.saveupload.endpage, goOOF.saveupload.Option, goOOF.saveupload.uploadurl);
    }

    function fnTimerPrint() {
        RexCtl.Print(goOOF.print.dialog, goOOF.print.startpage, goOOF.print.endpage, goOOF.print.copycount, goOOF.print.Option);
    }

    function fnTimerPrintDirect() {
        RexCtl.PrintDirect(goOOF.print.printname, goOOF.print.trayid, goOOF.print.startpage, goOOF.print.endpage, goOOF.print.copycount, goOOF.print.Option);
    }
</script>
<style type="text/css">
	* {margin: 0;padding: 0}
	html,body {height: 100%;overflow: hidden}
	#ReportViewerArea,#ReportCtl {width: 100%;height: 100%}
	#frmExportService {display: none}
</style>
</head>
<body onload="init();">
	<form id="frmExportService" name="frmExportService" method="post">
		<fieldset>
			<legend>Rexpert Viewer Parameter</legend>
			<input type="hidden" id="oof" name="oof" />
			<input type="hidden" id="filename" name="filename" />
			<input type="hidden" id="filetype" name="filetype" />
		</fieldset>
	</form>
	<div id="ReportViewerArea">
		<script type="text/javascript">
		rex_writeRexCtl("RexCtl");
        </script>
	</div>
</body>
</html>