package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx002ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class NurseControllerSupport extends ControllerSupport {

	public NurseControllerSupport() 
	{
		this.setServices(new Wbx002ServicesImpl());
	}

}
