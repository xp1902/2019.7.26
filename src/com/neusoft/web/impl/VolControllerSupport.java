package com.neusoft.web.impl;

import com.neusoft.services.impl.An01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class VolControllerSupport extends ControllerSupport
{
	public VolControllerSupport() 
	{
		this.setServices(new An01ServicesImpl());
	}
}
