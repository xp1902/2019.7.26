package com.neusoft.web.impl;

public class DelByIdOlderChufangServlet extends PresControllerSupport {
	
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		return "queryOlderChufang";
	}

}
