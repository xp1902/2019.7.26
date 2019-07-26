package com.neusoft.web.impl;

import com.neuedu.services.impl.Wbx014ServicesImpl;
import com.neusoft.web.support.ControllerSupport2;

public abstract class VolunteerServlet extends ControllerSupport2 {
public VolunteerServlet() {
	this.setServices(new Wbx014ServicesImpl());
}
}
