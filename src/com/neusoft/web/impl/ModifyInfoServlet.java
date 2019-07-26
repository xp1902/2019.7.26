package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyInfoServlet extends ControllerSupport2 {

	public ModifyInfoServlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("modifyInfo", "ÐÞ¸Ä");
		return null;
	}

}
