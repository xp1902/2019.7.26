package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx008ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public class UpdateTheOld2Servlet extends ControllerSupport {

	public UpdateTheOld2Servlet() {
		this.setServices(new Wbx008ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageInstance();
		return "updateTheOld";
	}

}
