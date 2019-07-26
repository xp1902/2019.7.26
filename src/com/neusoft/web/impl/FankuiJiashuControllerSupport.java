package com.neusoft.web.impl;

import com.neusoft.services.impl.Att01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class FankuiJiashuControllerSupport extends ControllerSupport {

	public FankuiJiashuControllerSupport() 
	{
		this.setServices(new Att01ServicesImpl());
	}

}
