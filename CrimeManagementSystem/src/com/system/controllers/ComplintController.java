package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.LoginBean;
import com.system.beans.RequestBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class ComplintController extends SystemAbstractController {
	
	@Autowired
	private Service service;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		LoginBean loginBean = (LoginBean)request.getSession().getAttribute(SystemConstants.LOGIN_DETAILS);
		String approve = null;
		RequestBean requestBean = new RequestBean();
		requestBean.setTypeofcrime(request.getParameter("typeofcrime"));
		requestBean.setCrimedate(request.getParameter("crimedate"));
		requestBean.setDescription(request.getParameter("description"));
		requestBean.setSuspectDetails(request.getParameter("suspectDetails"));
		requestBean.setUserEmail(loginBean.getUserName());
		String requestID = request.getParameter("requestId");
		Integer requestIDInt = null;
		String status  = null;
		if (requestID != null) {
			try {
			requestIDInt = Integer.parseInt(requestID);
			} catch (NumberFormatException nfe) {
				requestIDInt = null;
				requestBean.setNotes("");
			}
		} else {
			requestBean.setStatus(SystemConstants.USER_STATUS);
			requestBean.setNotes("");
		}
		requestBean.setRequestId(requestIDInt);
		
		if (requestIDInt != null) {
			requestBean.setNotes(request.getParameter("notes"));
			
			if (loginBean.getType().equals(SystemConstants.ROLE_ADMIN)) {
				approve = request.getParameter("approve");
				if (approve != null  && approve.equals("accept")) {
					requestBean.setStatus(SystemConstants.APPROVE);
				} else if (approve != null  && approve.equals("decline")){
					requestBean.setStatus(SystemConstants.NOT_APPROVE);
				}
			}
			
			status = service.updateRequest(requestBean);
		} else {
			status = service.createNewRequest(requestBean);
		}
		
		
		
		ModelAndView modelAndView = new ModelAndView("mainPage");
		if (SystemConstants.SUCESS_CREATING_REQUEST.equals(status)) {
			request.setAttribute(SystemConstants.MESSAGE, SystemConstants.SUCESS_CREATING_REQUEST);
		} else if (SystemConstants.SUCESS_UPDATING_REQUEST.equals(status)) {
			
			
			modelAndView = new ModelAndView("viewstatus");
			request.setAttribute(SystemConstants.MESSAGE, SystemConstants.SUCESS_UPDATING_REQUEST);
			approve = request.getParameter("approve");
			if (approve != null  && approve.equals("accept")) {
				modelAndView = new ModelAndView("approvestatus");
				request.setAttribute("statusList", service.getCrimeDetailsAdmin());
			} else if (approve != null  && approve.equals("decline")){
				modelAndView = new ModelAndView("approvestatus");
				request.setAttribute("statusList",service.getCrimeDetailsUser(loginBean.getUserName()));
			}
			
			
		} else if (SystemConstants.UNSUCESS_UPDATING_REQUEST.equals(status)) {
			
			
			modelAndView = new ModelAndView("viewstatus");
			request.setAttribute(SystemConstants.MESSAGE, SystemConstants.UNSUCESS_UPDATING_REQUEST);
			approve = request.getParameter("approve");
			if (approve != null  && approve.equals("accept")) {
				modelAndView = new ModelAndView("approvestatus");
				request.setAttribute("statusList", service.getCrimeDetailsAdmin());
			} else if (approve != null  && approve.equals("decline")){
				modelAndView = new ModelAndView("approvestatus");
				request.setAttribute("statusList", service.getCrimeDetailsUser(loginBean.getUserName()));
			}
			
		}else {
			request.setAttribute(SystemConstants.MESSAGE, SystemConstants.UNSUCESS_CREATING_REQUEST);
		}
		
		
		return modelAndView;
	}
	
	/**
	 * @return the service
	 */
	public Service getService() {
		return service;
	}

	/**
	 * @param service the service to set
	 */
	public void setService(Service service) {
		this.service = service;
	}


}
