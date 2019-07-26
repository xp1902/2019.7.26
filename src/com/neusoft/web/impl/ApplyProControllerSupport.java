package com.neusoft.web.impl;

import com.neusoft.services.impl.As01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ApplyProControllerSupport extends ControllerSupport 
{
	public ApplyProControllerSupport()
	{
		this.setServices(new As01ServicesImpl());
	}
}