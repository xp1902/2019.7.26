package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx005ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyVacationTheOldServlet extends ControllerSupport2 {
	public ModifyVacationTheOldServlet() {
		this.setServices(new Wbx005ServicesImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("modifyVacation", "ÐÞ¸Ä");
		return "modifyVacation";
	}

}
