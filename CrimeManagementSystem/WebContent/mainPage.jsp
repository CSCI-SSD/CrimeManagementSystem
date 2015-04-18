<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
	<head>
		<title>Welcome Page</title>
		<script type="text/javascript" src="dwr/interface/mainPageControllerdwr.js"></script>
		<script type="text/javascript" src="dwr/util.js"> </script>
		<script type="text/javascript" src="dwr/engine.js"></script>
		<jsp:include flush="true" page="libjs.jsp"></jsp:include>
		
		<script type="text/javascript" >
			$(document).ready(function(){
				$("#lodingData").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460
			 	  	  
			 	});
				
				$("#saveNotSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
			 	
				$("#saveSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				var message = "${message}";
				
				if (message=='Done') {
					$("#saveSucessfully").dialog('option', 'modal', true).dialog('open');
				} else if (message=='notDone'){
					$("#saveNotSucessfully").dialog('option', 'modal', true).dialog('open');
				}
				
				$('#requestDiv').hide();
			 	$('#requestHeader').hide();
			});
			
			
			function showTable() {
				$('#requestDiv').show();
			 	$('#requestHeader').show();
			}
			
			function createrequest() {
				var typeofcrime = document.getElementById("typeofcrime").value;
				var crimedate = document.getElementById("crimedate").value;
				var description = document.getElementById("description").value;
				var hasError = false;
				if (typeofcrime == '') {
					$("#typeofcrime").after("<br class='error'><span class='error'><spring:message code='html.request.error.typeofcrime' /></span>");
					hasError = true;
				}
				if (crimedate == '') {
					$("#crimedate").after("<br class='error'><span class='error'><spring:message code='html.request.error.crimedate' /></span>");
					hasError = true;
				}
				
				if (description == '') {
					$("#description").after("<br class='error'><span class='error'><spring:message code='html.request.error.description' /></span>");
					hasError = true;
				}
			
				
				if (!hasError) {
					var ctx = "${pageContext.request.contextPath}"+"/createrequest.view";
					document.getElementById("requestForm").action = ctx;
					document.getElementById("submitButton").click();
					
				} else {
					
				}
				
				
			}
			
			function loadDialog() {
				$("#lodingData").dialog('option', 'modal', true).dialog('open');
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
			<table width="70%" class="ui-widget-content" border="0">
				<tr>
					<td>
						<c:if test="${sessionScope.Login_Details.type == 'U'}">
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" onclick="showTable()" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.add"/>
						</div>
						</c:if>
					</td>
					
					<td>
						<c:if test="${sessionScope.Login_Details.type == 'U'}">
							<a href="status.view" onclick="loadDialog()">
								<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
									<spring:message code="html.mainpage.menu.status"/>
								</div>
							</a>
						</c:if>
						<c:if test="${sessionScope.Login_Details.type == 'A'}">
							<a href="status.view?requestType=approve" onclick="loadDialog()">
								<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
									<spring:message code="html.mainpage.menu.status"/>
								</div>
							</a>
						</c:if>
					</td>
					
					<c:if test="${sessionScope.Login_Details.type == 'A'}">
					
						
						<td>
							<a href="status.view?requestType=approve">
							<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
								<spring:message code="html.mainpage.menu.update"/> 
							</div>
							</a>
						</td>
					
					</c:if>
					
					<td>
						<a href="logout.view">
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.logout"/>
						</div>
						</a>
					</td>
					
				</tr>
			</table>
			<br><br>
			<div align="Center">
				<span>Welcome ${ sessionScope.Login_Details.lastName}</span>&nbsp;&nbsp;&nbsp;
			</div>
			<table width="50%" class="ui-widget-content" border="0" id="requestHeader">
				<tr>
					<td>
						<div class="ui-widget-header mainHeader" id="pageHeader" name="pageHeader" width="50%">
							Add Complaint
						</div>
					</td>
				</tr>
			</table>
			<form name="requestForm" id="requestForm" method="POST">
				<div id="requestDiv" name="requestDiv">		
					<table width="50%" class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.request.label.typeofcrime" />:</td>
							<td><input type="text" name="typeofcrime" id="typeofcrime" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.crimedate" />:</td>
							<td><input type="date" name="crimedate" id="crimedate" maxlength="20" size="20"/></td>
						</tr>
						
						
						<tr>
							<td align="left"><spring:message code="html.request.label.description" />:</td>
							<td><textarea rows="5" cols="30" name="description" id="description"></textarea></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.suspectDetails" />:</td>
							<td><textarea rows="5" cols="30" name="suspectDetails" id="suspectDetails"></textarea></td>
						</tr>
						
						
						<tr>
							<td  align="center" colspan="4">
								<input type="button" name="submit" id="search" class="ui-button" value="<spring:message code="html.global.label.button.submit" />" onClick="createrequest();" />
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>
						
					</table>
				</div>
				
				<div id="saveSucessfully" title="Message">  
				 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.save" /></p>
				 </div>
				 
				 <div id="saveNotSucessfully" title="Message">  
				 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.notsave" /></p>
				 </div>
			</form>
			
			
		</center>
		
		
	</body>
</html>