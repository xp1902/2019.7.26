package com.neusoft.web.impl;

import com.neusoft.services.impl.Ar01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ApplyControllerSupport extends ControllerSupport 
{
	public ApplyControllerSupport() 
	{
		this.setServices(new Ar01ServicesImpl());
	}
}