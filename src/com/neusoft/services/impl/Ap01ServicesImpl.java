package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ap01ServicesImpl extends JdbcServicesSupport
{	
	public List<Map<String,String>> query()throws Exception
    {
    	String sql="select aap101,name,aap104,aap105 from ap01";
		return this.queryForList(sql);
    }
}