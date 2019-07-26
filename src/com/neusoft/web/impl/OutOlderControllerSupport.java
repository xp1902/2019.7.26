package com.neusoft.web.impl;

import com.neusoft.services.impl.Al01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class OutOlderControllerSupport extends ControllerSupport {

	public OutOlderControllerSupport() 
	{
		this.setServices(new Al01ServicesImpl());
	}


}
