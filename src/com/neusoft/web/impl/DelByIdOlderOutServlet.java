package com.neusoft.web.impl;

public class DelByIdOlderOutServlet extends OutOlderControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		//this.savePageData();
		return "queryOlderOut";
	}

}
