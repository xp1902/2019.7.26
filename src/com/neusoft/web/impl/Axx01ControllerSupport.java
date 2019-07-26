package com.neusoft.web.impl;

import com.neusoft.services.impl.Axx01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class Axx01ControllerSupport extends ControllerSupport {

	public Axx01ControllerSupport() 
	{
		this.setServices(new Axx01ServicesImpl());
	}

}
