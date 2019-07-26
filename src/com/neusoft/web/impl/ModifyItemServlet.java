package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx010ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyItemServlet extends ControllerSupport2 {

	public ModifyItemServlet() {
		this.setServices(new Wbx010ServicesImpl());
	}
	
	@Override
	public String execute() throws Exception {
		this.update("modifyItem", "ÐÞ¸Ä¿â´æ");
		return null;
	}

}
