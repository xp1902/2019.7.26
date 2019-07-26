package com.neusoft.web.impl;

public class FankuiJiashuServlet extends RuyuanControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "fankuiJiashu";
	}

}
