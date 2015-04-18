<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title><spring:message code="html.uservalidation.label.uservalidation.title"/> </title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" language="javaScript">
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
			 	  	  
			 	});
					
				$("#invaliedValidation").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $(this).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#validationRequired").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $(this).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#sentMail").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $(this).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#notSentMail").dialog({         
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
				
				if (message=='Invalied Validation') {
					$("#invaliedValidation").dialog('option', 'modal', true).dialog('open');
				} 
				
				if (message=="Validate") {
					$("#validationRequired").dialog('option', 'modal', true).dialog('open');
				}
				if (message=="sent") {
					$("#sentMail").dialog('option', 'modal', true).dialog('open');
				}
				if (message=="NotSent") {
					$("#notSentMail").dialog('option', 'modal', true).dialog('open');
				}
			 	
			});
			
			function reSendEmail() {
				var username = document.getElementById('email').value;
				var hasError = false;
				if (username == '') {
					$("#email").after("<br class='error'><span class='error'><spring:message code='html.login.error.email' /></span>");
					hasError = true; 	
				}
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/registration.view?resend=true";
					document.getElementById("uservalidationForm").action = ctx;
					document.getElementById("submitButton").click();
				} else {
					return false;
				}
			}
			
			function registrationValidation() {
				$(".error").hide();
				var username = document.getElementById('email').value;
				var validationCode = document.getElementById('validationCode').value;
				var hasError = false;
				if (username == '') {
					$("#email").after("<br class='error'><span class='error'><spring:message code='html.login.error.email' /></span>");
					hasError = true; 	
				}
				if (validationCode == '') {
					$("#validationCode").after("<br class='error'><span class='error'><spring:message code='html.login.error.password' /></span>");
					hasError = true; 
				}
				
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/uservalidation.view?uservalidation=true";
					document.getElementById("uservalidationForm").action = ctx;
					document.getElementById("submitButton").click();
				} else {
					return false;
				}
			}
		</script>
		
		
	</head>
	<body>
		<br>
		<center>
			<table width="100%" class="ui-widget-content" border="0" >
				<tr>
					<td>
					<div class=""   align="center" height="63px"> 
						<img alt="Header" src=<c:out value='${pageContext.request.contextPath}'/>/imgs/crmheader2.jpg width="578px" px height="63px" align=center />
					</div>
					</td>
				</tr>
			</table>		
			<table width="50%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" width="50%">
							<spring:message code="html.uservalidation.label.uservalidation.title"/>
						</div>
					</td>
				</tr>
			</table>
			<form name="uservalidationForm" id="uservalidationForm" method="POST">
				<div id="addDiv" name="addDiv">		
					<table width="50%" class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.login.label.email" />:</td>
							<td><input type="text" name="email" id="email" maxlength="50" size="20"/></td>
						</tr>
						
						<tr>
							<td  align="left"><spring:message code="html.login.label.validationCode" />:</td>
							<td><input type="password" name="validationCode" id="validationCode" maxlength="20" size="20"/></td>
						</tr>
						<tr>
							<td  align="center" colspan="4">
								<input type="button" name="submit" id="search" class="ui-button" value="<spring:message code="html.global.label.button.validate" />" onClick="registrationValidation();" />
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>
						
						<tr>
							<td  align="left" colspan="4">
								<a href="#" onclick="reSendEmail();">Resend E-mail</a>
							
							</td>
						</tr>
						
					</table>
				</div>
			</form>
			
			<div id="invaliedValidation" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.uservalidation.label.invaliedvalidation" /></p>
			 </div>
			 
			 <div id="validationRequired" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.uservalidation.label.validationrequired" /></p>
			 </div>
			 
			 <div id="sentMail" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.uservalidation.label.sentmail" /></p>
			 </div>
			 
			 <div id="notSentMail" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.uservalidation.label.notsentmail" /></p>
			 </div>
			
		</center>>
	</body>
</html>