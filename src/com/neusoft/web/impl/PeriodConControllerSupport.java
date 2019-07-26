package com.neusoft.web.impl;

import com.neusoft.services.impl.Ag01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class PeriodConControllerSupport extends ControllerSupport 
{
	public PeriodConControllerSupport() 
	{
		this.setServices(new Ag01ServicesImpl());
	}
}