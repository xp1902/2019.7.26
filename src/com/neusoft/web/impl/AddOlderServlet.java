package com.neusoft.web.impl;

public class AddOlderServlet extends OlderControllerSupport 
{

	@Override
	public String execute() throws Exception {
		
		this.update("addOlder", "���", "��ӳɹ�,����ס�˱����:", "aab102");
		this.savePageInstance();
		this.update("addYuyueOlder", "���", "��ӳɹ�,����ס�˱����:", "aab102");
		this.savePageInstance();
		return "ruzhu";
	}

}
