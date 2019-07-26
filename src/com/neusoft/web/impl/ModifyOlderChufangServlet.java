package com.neusoft.web.impl;

public class ModifyOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("modifyOlderChufang", "ÐÞ¸Ä");
		return "checkOlderChufang";
	}

}
