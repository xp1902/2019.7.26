package com.neusoft.web.impl;

public class DelFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "queryFankuiJiashu";
	}

}
