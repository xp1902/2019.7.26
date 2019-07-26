package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class BbbservicesImpl extends JdbcServicesSupport
{
    public List<Map<String,String>> query()throws Exception
	  {
  
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("SELECT a.aan101,a.aan102,a.aan103,a.aan105,a.aan108,")
	    			.append("       b.bba101,b.aaz101 ")
	    			.append("  FROM an01 a,ba01 b ")
	    			.append(" WHERE b.bba101=? ")
	    			.append("   and b.bba101=a.aan109 ")
	  				;
	  		


	  		return this.queryForList(sql.toString(), this.get("bba101"));
	  }

    
}
