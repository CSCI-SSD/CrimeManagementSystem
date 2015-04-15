package com.system.service;

import java.util.List;

import com.system.beans.LoginBean;
import com.system.beans.RegiatrationBean;
import com.system.beans.RequestBean;

public interface Service {
	
	public LoginBean userLogin(LoginBean loginBean);
	
	public String createNewRequest(RequestBean requestBean);
	
	public List<RequestBean>  getCrimeDetailsUser(String userEmail);

	public String updateRequest(RequestBean requestBean);

	public String deleteRequest(RequestBean requestBean);

	public  List<RequestBean> getCrimeDetailsAdmin();
	
	public String registerUser(RegiatrationBean regiatrationBean);

	public String reSendEmail(RegiatrationBean regiatrationBean);

	public String validateUser(RegiatrationBean regiatrationBean);

}
