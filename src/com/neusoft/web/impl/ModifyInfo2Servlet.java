package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx001ServiceImpl;
import com.neusoft.web.support.ControllerSupport2;

public class ModifyInfo2Servlet extends ControllerSupport2 {
	
	public ModifyInfo2Servlet() {
		this.setServices(new Wbx001ServiceImpl());
	}
	@Override
	public String execute() throws Exception {
		this.update("modifyInfo2", "ÐÞ¸Ä»¤¹¤");
		return null;
	}

}
