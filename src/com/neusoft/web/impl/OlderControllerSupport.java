package com.neusoft.web.impl;

import com.neusoft.services.impl.Ax01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class OlderControllerSupport extends ControllerSupport 
{

	public OlderControllerSupport() 
	{
		this.setServices(new Ax01ServicesImpl());
	}

}
