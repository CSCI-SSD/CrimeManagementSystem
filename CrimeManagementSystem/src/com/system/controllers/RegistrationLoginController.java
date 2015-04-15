package com.system.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.system.beans.RegiatrationBean;
import com.system.service.Service;
import com.system.util.SystemConstants;

public class RegistrationLoginController extends SystemAbstractController {
	
	@Autowired
	private Service service;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ModelAndView modelAndView = null;
		String resend = (String)request.getParameter("resend");
		RegiatrationBean regiatrationBean = new RegiatrationBean();
		regiatrationBean.setEmail((String)request.getParameter("email"));
		if (resend != null && resend.equals("true")) {
			
			String status = service.reSendEmail(regiatrationBean);
			modelAndView = new ModelAndView("registrationValidation");
			request.setAttribute(SystemConstants.MESSAGE, status);
			return modelAndView;
		}
		
		String uservalidation = (String)request.getParameter("uservalidation");
		if (uservalidation != null && uservalidation.equals("true")) {
			regiatrationBean.setCode(request.getParameter("validationCode"));
			String status = service.validateUser(regiatrationBean);
			modelAndView = new ModelAndView("login");
			request.setAttribute(SystemConstants.MESSAGE, status);
			return modelAndView;
		}
		
		
		
		regiatrationBean.setPassword((String)request.getParameter("password"));
		regiatrationBean.setFirstName((String)request.getParameter("firstname"));
		regiatrationBean.setLastName((String)request.getParameter("lastname"));
		regiatrationBean.setAdd1((String)request.getParameter("add1"));
		regiatrationBean.setAdd2((String)request.getParameter("add2"));
		regiatrationBean.setCity((String)request.getParameter("city"));
		regiatrationBean.setState((String)request.getParameter("state"));
		regiatrationBean.setPin(request.getParameter("pin"));
		regiatrationBean.setPhone(request.getParameter("phone"));
		
		String satus = service.registerUser(regiatrationBean);
		
		
		
		if (satus.equals(SystemConstants.REGISTRATION_SUCCESS)) {
			modelAndView = new ModelAndView("login");
		} else {
			modelAndView = new ModelAndView("registration");
			request.setAttribute(SystemConstants.MESSAGE, "registrationFaild");
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
