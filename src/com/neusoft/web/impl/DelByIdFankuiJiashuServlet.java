package com.neusoft.web.impl;

public class DelByIdFankuiJiashuServlet extends FankuiJiashuControllerSupport {

	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		//this.savePageData();
		return "queryFankuiJiashu";
	}

}
