package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyInsServlet extends ControllerSupport2 {

	public ModifyInsServlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		
		return null;
	}

}
