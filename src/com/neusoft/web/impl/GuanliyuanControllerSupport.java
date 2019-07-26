package com.neusoft.web.impl;

import com.neusoft.services.impl.Akk01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class GuanliyuanControllerSupport extends ControllerSupport {

	public GuanliyuanControllerSupport() 
	{
		this.setServices(new Akk01ServicesImpl());
	}

}
