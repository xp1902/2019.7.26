package com.neusoft.web.impl;


public class ShancZhiyuanServlet extends JiluConttrollerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		//this.savePageData();
		return "zhiyuanJilu";
	}

}
