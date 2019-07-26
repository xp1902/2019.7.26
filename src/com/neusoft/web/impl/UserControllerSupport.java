package com.neusoft.web.impl;

import com.neusoft.services.impl.Au01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class UserControllerSupport extends ControllerSupport 
{
	public UserControllerSupport() 
	{
		this.setServices(new Au01ServicesImpl());
	}
}
