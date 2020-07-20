<%@page import="java.util.*,java.text.*,java.net.InetAddress,java.text.SimpleDateFormat" %><%

	response.setContentType("text/html;charset=UTF-8");
	
	SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy/MM/dd");
	String sCurrDate = simpledateformat.format(new Date());
	out.println("Date : " + sCurrDate + "<br><br>");

	Runtime runtime = Runtime.getRuntime();
	int iCpu = runtime.availableProcessors();

	out.println("CPU Count : " + iCpu + "<br><br>");
	
	String sIpAddr = InetAddress.getLocalHost().getHostAddress();	
	
	out.println("IP Address : " + sIpAddr + "<br><br>");
%>