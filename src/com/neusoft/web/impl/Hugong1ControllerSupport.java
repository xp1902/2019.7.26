package com.neusoft.web.impl;

import com.neusoft.services.impl.Ajj01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class Hugong1ControllerSupport extends ControllerSupport {

	public Hugong1ControllerSupport() 
	{
		this.setServices(new Ajj01ServicesImpl());
	}

}
