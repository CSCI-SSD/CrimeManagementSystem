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
				
				$("#deletedSucessfully").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Ok: function() {
		                    $( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				$("#deleteValidationDiv").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 460,
			 	  	buttons: {
				 	  	Delete: function() {
				 	  		alert(document.getElementById("deleterequestId").value);
		                	var ctx = "${pageContext.request.contextPath}"+"/deleterequest.view";
		   					document.getElementById("deleteForm").action = ctx;
		   					document.getElementById("deleteFormsubmitButton").click();
		                },
		                
		                Cancel : function() {
		                	document.getElementById("deleterequestId").value = '';
		                	$( this ).dialog( "close" );
		                }
			        }
			 	  	  
			 	});
				
				var message = "${message}";
				
				if (message=='Updated') {
					$("#saveSucessfully").dialog('option', 'modal', true).dialog('open');
				} else if (message == 'Deleted') {
					
				}
				
				
				$("#requestEditDiv").dialog({         
			 		autoOpen: false,         
			 		modal: true,
			 	  	width: 450,
			 	  	buttons: {
				 	  	Update: function() {
		                   var hasError = validate();
		                   if (hasError) {
		                	   return;
		                   } else {
		                	   var ctx = "${pageContext.request.contextPath}"+"/createrequest.view";
		   						document.getElementById("requestEditForm").action = ctx;
		   						document.getElementById("submitButton").click();
		                   }
		                },
		                
		                Cancel : function() {
		                	clearFeilds();
		                	$( this ).dialog( "close" );
		                }
			        }
			 	});
			 	
			});
			
			function populateValue(row) {
				document.getElementById("typeofcrime").value = document.getElementById("typeofcrime"+row).innerHTML;
				document.getElementById("description").value =document.getElementById("description"+row).innerHTML;
				document.getElementById("suspectDetails").value = document.getElementById("suspectDetails"+row).innerHTML;
				document.getElementById("requestId").value = document.getElementById("requestId"+row).value;
				document.getElementById("notes").value = document.getElementById("notes"+row).innerHTML;
				document.getElementById("status").value = document.getElementById("status"+row).innerHTML;
				
				 $("#crimedate").val(document.getElementById("crimedate"+row).innerHTML);
				
				$("#requestEditDiv").dialog('option', 'modal', true).dialog('open');
			}
			
			function clearFeilds() {
				$(".error").hide();
				document.getElementById("typeofcrime").value = '';
				document.getElementById("description").value = '';
				document.getElementById("suspectDetails").value = '';
				document.getElementById("notes").value = "";
				document.getElementById("status").value = "";
				document.getElementById("requestId").value = "";
			}
			
			function validate() {
				var typeofcrime = document.getElementById("typeofcrime").value;
				var crimedate = document.getElementById("crimedate").value;
				var description = document.getElementById("description").value;
				var suspectDetails = document.getElementById("suspectDetails").value;
				var notes = document.getElementById("notes").value;
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
				
				
				return hasError;
			}
			
			function showDeleteValidaiton(row) {
				document.getElementById("deleterequestId").value = document.getElementById("requestId"+row).value;
				$("#deleteValidationDiv").dialog('option', 'modal', true).dialog('open');
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
						<a href="mainpage.view">
						<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" onclick="showTable()" style="cursor:pointer;">
							<spring:message code="html.mainpage.menu.add"/>
						</div>
						</a>
						</c:if>
					</td>
					
					<td>
						<a href="status.view">
							<div class="ui-widget-header mainHeader pointer" id="pageHeadermenu" name="pageHeader" width="50%" style="cursor:pointer;">
								<spring:message code="html.mainpage.menu.status"/>
							</div>
						</a>
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
				
			
			<div id="requestDiv" name="requestDiv"  style="height:300px; overflow: auto">								
					<table width="70%" id="requestTable" name="requestTable" class="ui-widget-content;sortable"  cellspacing="1" cellpadding="1" height="35%">
						<thead class="cGrid ui-widget-header">
							<tr style="position:relative;top:expression(this.offsetParent.scrollTop);">
								<td align="center"><spring:message code="html.view.page.label.typeofcrime" /></td>
								<td align="center"><spring:message code="html.view.page.label.crimedate" /></td>
								<td align="center"><spring:message code="html.view.page.label.description" /></td>
								<td align="center"><spring:message code="html.view.page.label.suspectDetails" /></td>
								<td align="center"><spring:message code="html.view.page.label.notes" /></td>
								<td align="center"><spring:message code="html.view.page.label.status" /></td>
								<td align="center"><spring:message code="html.view.page.label.edit" /></td>
							</tr>
						</thead>
						<tbody class="cLabel">
							<c:choose>
								<c:when  test="${not empty statusList}">
									<c:set var="count" value="0"/>
									<c:forEach var="requestBean" items="${statusList}">
										<c:set var="count" value="${count+1}"/>
										<c:choose>
											<c:when test="${count % 2 == 0}">
												<tr class="even" id="row<c:out value='${count}'/>">
											</c:when>
											<c:otherwise>
												<tr class="odd" id="row<c:out value='${count}'/>">
											</c:otherwise>
										</c:choose>
											<td><span id="typeofcrime${count}"><c:out value="${requestBean.typeofcrime}"/></span></td>
											<td><span id="crimedate${count}"><c:out value="${requestBean.crimedate}"/></span></td>
											<td><span id="description${count}"><c:out value="${requestBean.description}"/></span></td>
											<td><span id="suspectDetails${count}"><c:out value="${requestBean.suspectDetails}"/></span></td>
											<td>
												<span id="notes${count}"><c:out value="${requestBean.notes}"/></span>
												<input type="hidden" id="requestId${count}" name="requestId${count}"  value="${requestBean.requestId}"/>
											</td>
											<td><span id="status${count}"><c:out value="${requestBean.status}"/></span></td>
												<td>
													<c:if test="${ requestBean.status != 'Resolved'}">
														<img src=<c:out value='${pageContext.request.contextPath}'/>/imgs/edit.png  alt="Edit" onclick="populateValue(${count})"/>
														<img src=<c:out value='${pageContext.request.contextPath}'/>/imgs/delete.png  alt="Delete" onclick='showDeleteValidaiton(${count})'/>
													</c:if>
												</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr><td colspan="5" align="center"><label class="ui-widget-header" style="font-size:18">No Data Found</label></td></tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
			</div>
			
			
			<div id="requestEditDiv" name="requestEditDiv"  title="Details">		
				<form name="requestEditForm" id="requestEditForm" method="POST">
				
					<table  class="ui-widget-content" border="0">
						<tr>
							<td align="left"><spring:message code="html.request.label.typeofcrime" />:</td>
							<td><input type="text" name="typeofcrime" id="typeofcrime" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.crimedate" />:</td>
							<td><input type="date" name="crimedate" id="v" maxlength="20" size="20"/></td>
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
							<td align="left"><spring:message code="html.request.label.suspectDetails" />:</td>
							<td><input type="text" name="status" id="status" maxlength="20" size="20"/></td>
						</tr>
						
						<tr>
							<td align="left"><spring:message code="html.request.label.notes" />:</td>
							<td><textarea rows="5" cols="30" name="notes" id="notes"></textarea>
								<input type="text" name="type" id="type" maxlength="20" size="20"/>
								<input type="hidden" name="requestId" id="requestId" maxlength="20" size="20"/>
								<input type="submit" name="submit" id="submitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
							</td>
						</tr>						
						
					</table>
				</form>
			</div>
			
			<div id="saveSucessfully" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.updated" /></p>
			 </div>
			
			<div id="deletedSucessfully" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.mainpage.label.delete" /></p>
			 </div>
			
			<div id="deleteValidationDiv" title="Message">  
			 	 <p><span class="ui-icon ui-icon-alert"></span><spring:message code="html.global.label.delete.validation"/></p>
			 	 <form name="deleteForm" id="deleteForm" method="POST">
			 	 	<input type="hidden" name="deleterequestId" id="deleterequestId" maxlength="20" size="20"/>
				 	<input type="submit" name="deleteFormsubmitButton" id="deleteFormsubmitButton" class="ui-button" value="<spring:message code="html.global.label.button.submit" />"  style="display: none"/>
			 	 </form>
			 </div>
			
		</center>
		
		
	</body>
</html>