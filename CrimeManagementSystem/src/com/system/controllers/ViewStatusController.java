package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.LoginBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class ViewStatusController extends SystemAbstractController {
	
	@Autowired
	private Service service;

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		LoginBean loginBean = (LoginBean)request.getSession().getAttribute(SystemConstants.LOGIN_DETAILS);
		
		ModelAndView modelAndView = new ModelAndView("viewstatus");
		String typeRequest = request.getParameter("requestType");
		String from = request.getParameter("from");
		if (loginBean.getType().equals(SystemConstants.ROLE_ADMIN) &&typeRequest != null && typeRequest.equalsIgnoreCase("approve")) {
			if (from != null && from.equalsIgnoreCase("View")) {
				modelAndView = new ModelAndView("viewstatus");
			} else {
				modelAndView = new ModelAndView("approvestatus");
			}
			request.setAttribute("statusList", service.getCrimeDetailsAdmin());
		} else {
			request.setAttribute("statusList", service.getCrimeDetailsUser(loginBean.getUserName()));
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
