<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title><spring:message code="html.login.label.login.title"/> </title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" language="javaScript">
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
				
			 	}) });

		</script>
		
		
	</head>
	<body>
	<table width="100%" class="ui-widget-content" border="0" >
		<tr>
			<td>
			<div class=""   align="center" height="63px"> 
				<img alt="Header" src=<c:out value='${pageContext.request.contextPath}'/>/imgs/crmheader2.jpg width="578px" px height="63px" align=center />
			</div>
			</td>
		</tr>
	</table>
	
		<br>
		<center>
			<div align="right">
				<span>Welcome Visitor</span>&nbsp;&nbsp;&nbsp;
			</div>
			<table  class="ui-widget-content" border="0"  width="350px" height="151px" border="0">
				
				<tr>
					<td colspan="2" valign="top">
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" >
							Contact Us
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
						Office : 402 507 6594
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
					E-mail : admin@crimemanagementsystem.com
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top">
					 67 th ave, pine street <br>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" valign="top">
						Omaha, &nbsp; &nbsp;NE  &nbsp;-  &nbsp; 68104
					</td>
				</tr>
				
				<tr>
					<td colspan="2" valign="top">
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader"  align="center">
							<a href="login.jsp">Home</a>
						</div>
					</td>
				</tr>
			</table>

			
		</center>
	</body>
</html>