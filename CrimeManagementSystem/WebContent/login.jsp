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
			 	  	  
			 	});
				
				$("#invaliedLogin").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $(this).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				
				var message = "${message}";
				
				if (message=='Invalied Login') {
					$("#invaliedLogin").dialog('option', 'modal', true).dialog('open');
				}
			 	
			});
			
			function login() {
				$(".error").hide();
				var username = document.getElementById('userName').value;
				var password = document.getElementById('password').value;
				var hasError = false;
				if (username == '') {
					$("#userName").after("<br class='error'><span class='error'><spring:message code='html.login.error.username' /></span>");
					hasError = true; 	
				}
				if (password == '') {
					$("#password").after("<br class='error'><span class='error'><spring:message code='html.login.error.password' /></span>");
					hasError = true; 
				}
				
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/login.view";
					document.getElementById("loginForm").action = ctx;
					document.getElementById("submitButton").click();
				} else {
					return false;
				}
			}
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
			<table width="50%" class="ui-widget-content" border="0"  width="700px" height="500px" border="0">
				<tr height="70%" >
					<td colspan="2" class="topCell" >
						<span > CRIME MANAGEMENT was established by a group of current and retired law enforcement officials,
						<br> private citizens and security specialist. &nbsp; This for the all people for the security purpose.</span>
					</td>
				</tr>
				<tr>
					<td width="70%"> 
						<marquee  behavior="scroll" direction="up">
							Trafic Updates 
							<br>
							<br>
							 Construction going on pacific 90 to 102 streets
							 <br>
							 <br>
							 Trafic is slow on I-80 East from 450 Exit to 458 Exit
							 <br>
							 <br>
							 Accident on Dodge 72 street near Crossroad Mall, Trafic is very slow
						</marquee>
					</td>
					<td valign="bottom">
					<form name="loginForm" id="loginForm" method="POST">
						<div id="addDiv" name="addDiv">		
							<table class="ui-widget-content" border="0">
								<tr>
									<td colspan="2">
										<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" >
											<spring:message code="html.login.label.login.title"/>
										</div>
									</td>
								</tr>
								<tr>
									<td align="left"><spring:message code="html.login.label.email" />:</td>
									<td><input type="text" name="userName" id="userName" maxlength="50" size="30"/></td>
								</tr>
								
								<tr>
									<td  align="left"><spring:message code="html.login.label.password" />:</td>
									<td><input type="password" name="password" id="password" maxlength="20" size="30"/></td>
								</tr>
								<tr>
									<td  align="center" colspan="2">
										<input type="button" name="submit" id="search" class="ui-button" value="Login" onClick="login();" />
										<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
									</td>
								</tr>
								
								<tr>
									<td  align="left" colspan="2">
										<a href="registration.jsp">Sign up</a>
									</td>
								</tr>
								
							</table>
						</div>
					</form>
						
					</td>
				</tr>
			</table>
		
			
			
			<div id="invaliedLogin" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.login.label.invaliedlogin" /></p>
			 </div>
			
		</center>>
	</body>
</html>