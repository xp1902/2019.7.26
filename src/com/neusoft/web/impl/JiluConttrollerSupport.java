package com.neusoft.web.impl;

import com.neusoft.services.impl.Ao01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class JiluConttrollerSupport extends ControllerSupport 
{
	public JiluConttrollerSupport() 
	{
		this.setServices(new Ao01ServicesImpl());
	}
}
