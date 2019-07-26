package com.neusoft.web.impl;

import com.neusoft.services.impl.AaaServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class AaaControllerSupport extends ControllerSupport
{
	public AaaControllerSupport() 
	{
		this.setServices(new AaaServicesImpl());
	}
}
