package com.neusoft.web.impl;

import com.neusoft.services.impl.Ah01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class DailyControllerSupport extends ControllerSupport
{

	public DailyControllerSupport() 
	{
		this.setServices(new Ah01ServicesImpl());
	}
}
