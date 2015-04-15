<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title><spring:message code="html.login.label.login.title"/> </title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript" language="javascript" src="dwr/util.js"> </script>
		<script type="text/javascript" language="javascript" src="dwr/engine.js"></script>
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" language="javaScript">
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
			 	  	  
			 	});
				
				$("#registrationError").dialog({         
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
				
				if (message=='registrationFaild') {
					$("#registrationError").dialog('option', 'modal', true).dialog('open');
				}
				
				
			});
			
			function register() {
				$(".error").hide();
				var firstname = document.getElementById('firstname').value;
				var lastname = document.getElementById('lastname').value;
				var username = document.getElementById('email').value;
				var password = document.getElementById('password').value;
				var add1 = document.getElementById('add1').value;
				var add2 = document.getElementById('add2').value;
				var city = document.getElementById('city').value;
				var state = document.getElementById('state').value;
				var pin = document.getElementById('pin').value;
				var phone = document.getElementById('phone').value;
				var hasError = false;
				
				if (firstname == '') {
					$("#firstname").after("<br class='error'><span class='error'><spring:message code='html.login.error.firstname' /></span>");
					hasError = true; 	
				}
				
				if (lastname == '') {
					$("#lastname").after("<br class='error'><span class='error'><spring:message code='html.login.error.lastname' /></span>");
					hasError = true; 	
				}
				
				if (email == '') {
					$("#email").after("<br class='error'><span class='error'><spring:message code='html.login.error.email' /></span>");
					hasError = true; 	
				}
				if (password == '') {
					$("#password").after("<br class='error'><span class='error'><spring:message code='html.login.error.password' /></span>");
					hasError = true; 
				}
				
				if (add1 == '') {
					$("#add1").after("<br class='error'><span class='error'><spring:message code='html.login.error.add1' /></span>");
					hasError = true; 	
				}
				
				if (city == '') {
					$("#city").after("<br class='error'><span class='error'><spring:message code='html.login.error.city' /></span>");
					hasError = true; 	
				}
				
				if (state == '') {
					$("#state").after("<br class='error'><span class='error'><spring:message code='html.login.error.state' /></span>");
					hasError = true; 	
				}
				
				if (pin == '') {
					$("#pin").after("<br class='error'><span class='error'><spring:message code='html.login.error.pin' /></span>");
					hasError = true; 	
				}
				
				if (phone == '') {
					$("#phone").after("<br class='error'><span class='error'><spring:message code='html.login.error.phone' /></span>");
					hasError = true; 	
				}
				
				if (!hasError) {
					alert('hello');
					var ctx = "${pageContext.request.contextPath}"+"/registration.view";
					document.getElementById("registrationForm").action = ctx;
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
			<table width="50%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" width="50%">
							<spring:message code="html.login.label.login.title"/>
						</div>
					</td>
				</tr>
			</table>
			<form name="registrationForm" id="registrationForm" method="POST">
				<div id="addDiv" name="addDiv">		
					<table width="50%" class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.login.label.firstname" />:</td>
							<td><input type="text" name="firstname" id="firstname" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.lastname" />:</td>
							<td><input type="text" name="lastname" id="lastname" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.email" />:</td>
							<td><input type="text" name="email" id="email" maxlength="50" size="30"/></td>
						</tr>
						
						<tr>
							<td  align="left"><spring:message code="html.login.label.password" />:</td>
							<td><input type="password" name="password" id="password" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.add1" />:</td>
							<td><input type="text" name="add1" id="add1" maxlength="50" size="50"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.add2" />:</td>
							<td><input type="text" name="add2" id="add2" maxlength="50" size="50"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.city" />:</td>
							<td><input type="text" name="city" id="city" maxlength="50" size="50"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.state" />:</td>
							<td><input type="text" name="state" id="state" maxlength="50" size="50"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.pin" />:</td>
							<td><input type="text" name="pin" id="pin" maxlength="50" size="50"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.login.label.phone" />:</td>
							<td><input type="text" name="phone" id="phone" maxlength="50" size="50"/></td>
						</tr>
						
						
						<tr>
							<td  align="center" colspan="4">
								<input type="button" name="submit" id="search" class="ui-button" value="<spring:message code="html.global.label.button.register" />" onClick="register();" />
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>
						
					</table>
				</div>
			</form>
			
			<div id="registrationError" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.login.label.registration.error" /></p>
			 </div>
			
		</center>>
	</body>
</html>