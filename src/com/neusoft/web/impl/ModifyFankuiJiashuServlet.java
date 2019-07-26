package com.neusoft.web.impl;

public class ModifyFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("modifyFankuiJiashu", "ÐÞ¸Ä");
		return "checkFankuiJiashu";
	}

}
