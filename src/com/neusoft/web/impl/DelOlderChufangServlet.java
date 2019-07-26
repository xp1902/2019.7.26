package com.neusoft.web.impl;

public class DelOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "queryOlderChufang";
	}

}
