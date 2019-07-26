package com.neusoft.web.impl;

import com.neusoft.services.impl.Am01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class FangkeControllerSupport extends ControllerSupport {

	public FangkeControllerSupport() 
	{
		this.setServices(new Am01ServicesImpl());
	}

}
