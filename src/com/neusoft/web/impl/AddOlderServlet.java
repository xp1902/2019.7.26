package com.neusoft.web.impl;

public class AddOlderServlet extends OlderControllerSupport 
{

	@Override
	public String execute() throws Exception {
		
		this.update("addOlder", "添加", "添加成功,该入住人编号是:", "aab102");
		this.savePageInstance();
		this.update("addYuyueOlder", "添加", "添加成功,该入住人编号是:", "aab102");
		this.savePageInstance();
		return "ruzhu";
	}

}
