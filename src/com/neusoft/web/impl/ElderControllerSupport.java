package com.neusoft.web.impl;

import com.neusoft.services.impl.Ab01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class ElderControllerSupport extends ControllerSupport {
	public ElderControllerSupport() {
		this.setServices(new Ab01ServicesImpl());
	}
}
