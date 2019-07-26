package com.neusoft.web.impl;

import com.neusoft.services.impl.BbbservicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class DuiControllerSupport extends ControllerSupport
{
	public DuiControllerSupport() 
	{
		this.setServices(new BbbservicesImpl());
	}
}
