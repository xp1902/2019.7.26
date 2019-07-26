package com.neusoft.web.impl;


public class UserRegisterServlet extends UserControllerSupport
{
	public String execute()throws Exception
	{
		//this.savePageInstanceForRegister();
		this.saveData();
		if(this.getAttribute().get("repeat").equals("false"))
		{
			if(this.getAttribute().get("userType")!=null)
			{
				if(this.getAttribute().get("userType").equals("3"))
				{
					return "addJiashu";	
				}
				else if(this.getAttribute().get("userType").equals("4"))
				{
					return "addVol";	
				}
			}
		}	
		return "userRegister";
	}
}
