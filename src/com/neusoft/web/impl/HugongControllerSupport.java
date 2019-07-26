package com.neusoft.web.impl;

import com.neusoft.services.impl.Aj01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class HugongControllerSupport extends ControllerSupport
{
	public HugongControllerSupport() 
	{
		this.setServices(new Aj01ServicesImpl());
	}
}