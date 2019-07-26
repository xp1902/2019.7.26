package com.neusoft.web.impl;

public class FindByIdAxx01Servlet extends Axx01ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		System.out.println("Axx");
		this.savePageInstance();
		System.out.println("Axx");
		return "checkOlder";
	}

}
