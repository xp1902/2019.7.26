package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Aj01ServicesImpl extends JdbcServicesSupport 
{
	public Map<String,String> findById()throws Exception
	{
		Object aaj101=this.get("aaj101");
		System.out.println(aaj101);
		StringBuilder sql=new StringBuilder()
				.append("select aaj101,aaj102,aaj103,aaj104,aaj105,")
				.append("       aaj106,aaj107,aaj108,aaj109,aaj110")
				.append("  from aj01 where aaj101 = ?");
		System.out.println(this.queryForMap(sql.toString(), this.get("aaj101")));
		return this.queryForMap(sql.toString(), this.get("aaj101"));
	}
	private boolean modifyHugong()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update aj01 a")
    			.append("   set a.aaj103=?,a.aaj104=?,a.aaj105=?,a.aaj106=?,a.aaj108=?,")
    			.append("       a.aaj109=?,a.aaj110=?")
    			.append(" where a.aaj101=?")
    			;
    	Object args[]={
    			this.get("aaj103"),
    			this.get("aaj104"),
    			this.get("aaj105"),
    			this.get("aaj106"),
    			this.get("aaj108"),
    			this.get("aaj109"),
    			this.get("aaj110"),
    			this.get("aaj101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
	
	public List<Map<String,String>> query()throws Exception
	{

		return null;
	}
}
