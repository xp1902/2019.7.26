package com.neusoft.web.impl;

import com.neusoft.services.impl.Ae01ServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class PresControllerSupport extends ControllerSupport {
	public PresControllerSupport() {
		this.setServices(new Ae01ServicesImpl());
	}
}
