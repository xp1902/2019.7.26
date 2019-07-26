package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.support.ControllerSupport;

import com.neusoft.services.JdbcServicesSupport;

public class OldServicesImpl extends JdbcServicesSupport
{
    
	public List<Map<String,String>> query()throws Exception
	  {
		//查询对应护工负责的老人信息
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,a.aab104,a.aab105,b.aai103,")
				.append("       a.aab107,a.aab108,a.aab109,b.aai102,b.aai104,")
				.append("       b.aai105,c.aaj103,c.aaj104,c.aaj105,c.aaj108")
				.append("  from ab01 a,ai01 b,aj01 c")
				.append(" where a.aab101=b.aab101 and b.aaj101=?")
				.append("   and c.aaj101=b.aaj101 ")
				;
		return this.queryForList(sql.toString(), this.get("aaj101"));
      }
	
	 public Map<String,String> findById()throws Exception
	    {
	    	//查询护工
			
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaj101,a.aaj102,a.aaj103,a.aaj104,a.aaj105,")
	    			.append("       a.aaj108")
	    			.append("  from aj01 a")
	    			.append(" where a.aaj101=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aaj101"));
	    }
	
}
