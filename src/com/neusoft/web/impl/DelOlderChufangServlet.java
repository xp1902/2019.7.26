package com.neusoft.web.impl;

public class DelOlderChufangServlet extends PresControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("batchDelete", "ɾ��");
		this.savePageDataForDelete();
		return "queryOlderChufang";
	}

}
