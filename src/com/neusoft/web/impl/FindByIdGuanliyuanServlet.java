package com.neusoft.web.impl;

public class FindByIdGuanliyuanServlet extends GuanliyuanControllerSupport {

	@Override
	public String execute() throws Exception {
		System.out.println("findguanliyuanServlet");
		this.savePageInstance();
		System.out.println("FindguanliyuanServlet");
		return "checkGuanliyuan";
	}

}
