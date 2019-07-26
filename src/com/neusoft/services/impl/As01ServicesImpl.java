package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class As01ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aas102,b.name,b.aap104,b.aap105,b.aap101")
				.append("  from as01 a,ap01 b")
				.append(" where a.aar101=? and b.aap101=a.aap101")
				;
		return this.queryForList(sql.toString(),this.get("aar101"));
	}
}