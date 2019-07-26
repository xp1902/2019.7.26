package com.neusoft.web.impl;

import com.neusoft.services.impl.Ao01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class VolReControllerSupport extends ControllerSupport
{
	public VolReControllerSupport() 
	{
		this.setServices(new Ao01ServicesImpl());
	}
}