package com.neusoft.web.impl;


public class ShancZhiyuanServlet extends JiluConttrollerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		//this.savePageData();
		return "zhiyuanJilu";
	}

}
