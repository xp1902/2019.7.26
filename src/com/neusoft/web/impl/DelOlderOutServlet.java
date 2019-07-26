package com.neusoft.web.impl;

public class DelOlderOutServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "queryOlderOut";
	}

}
