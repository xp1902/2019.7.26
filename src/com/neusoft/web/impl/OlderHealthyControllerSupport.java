package com.neusoft.web.impl;

import com.neusoft.services.impl.Af01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class OlderHealthyControllerSupport extends ControllerSupport {

	public OlderHealthyControllerSupport() 
	{
		this.setServices(new Af01ServicesImpl());
	}

}
