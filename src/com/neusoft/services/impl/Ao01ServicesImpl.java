package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.support.ControllerSupport;

import com.neusoft.services.JdbcServicesSupport;

public class Ao01ServicesImpl extends JdbcServicesSupport
{
	
	
    private boolean deleteById()throws Exception
    {
    	//删除志愿记录
    	String sql="delete from ao01 where aao101=?";
    	return this.executeUpdate(sql, this.get("aao101"))>0;
    }    
    
    
    
    public Map<String,String> findById()throws Exception
    {
       //志愿细节
    	//1.编写SQL语句   	
		StringBuilder sql=new StringBuilder()
  				.append("select a.aao102,a.aao103,a.aao104,a.aao105,a.aao106,")
    			.append("       a.aao107,j.aaj101,j.aaj103,a.aao101,")
    			.append("       b.aan101,b.aan102,b.aan103,b.aan104,b.aan105,")
				.append("       b.aan106")
    			.append("  from ao01 a,aj01 j,an01 b")
    			.append("  where a.aao101=? and a.aaj101=j.aaj101")
    			.append("   and a.aan101=b.aan101")
  				;
    	//执行查询
		return this.queryForMap(sql.toString(), this.get("aao101"));
    }
    
    
    public List<Map<String,String>> query()throws Exception
	  {
	  		//还原页面查询条件
	  		Object aan101=this.get("aan101");   
	  		System.out.println(aan101);
	  		
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aao102,a.aao103,a.aao104,a.aao101")
	    			.append("  from ao01 a ")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aan101))
	  		{
	  			sql.append(" where a.aan101=?");
	  			paramList.add(aan101);
	  		}

	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
    
    private boolean gaiYuyue()throws Exception
    {
    	//修改预约
    	StringBuilder sql=new StringBuilder()
    			.append("update ao01 a")
    			.append("   set a.aao102=now(),a.aao104=?")
    			.append(" where a.aao101=?")
    			;
    	Object args[]={
    			this.get("aao104"),
    			this.get("aao101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    private List<Map<String,String>> queryForH()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aao101,a.aao104,a.aao105,d.fvalue aao106,a.aao107,")
				.append("       b.aan101,b.aan102,c.fvalue aan103,b.aan105")
				.append("  from ao01 a,an01 b,syscode c,syscode d")
				.append(" where a.aan101=b.aan101")
				.append("   and c.fcode=b.aan103 and c.fname='aan103'")
				.append("   and d.fcode=a.aao106 and d.fname='aao106'")
				;
		
		Object aan102=this.get("qaan102");
		Object aan103=this.get("qaan103");
		Object baao104=this.get("baao104");
		Object eaao104=this.get("eaao104");
		List<Object> paramList=new ArrayList<>();
		
		if(this.isNotNull(aan102))
  		{
  			sql.append(" and b.aan102=?");
  			paramList.add(aan102);
  		}
		
		if(this.isNotNull(aan103))
  		{
  			sql.append(" and b.aan103=?");
  			paramList.add(aan103);
  		}
	
		if(this.isNotNull(baao104))
	  	{
	  		sql.append(" and a.aao104>=?");
			paramList.add(baao104);
 		}
	  	if(this.isNotNull(eaao104))	  		
	  	{
	  		sql.append(" and a.aao104<=?");
  			paramList.add(eaao104);
  		}
	  	sql.append(" and a.aaj101=?");
	  	paramList.add(this.get("aaj101"));
	  	sql.append(" order by a.aao104 desc");
	  	return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	 private boolean modify()throws Exception
   {
   	StringBuilder sql=new StringBuilder()
   			.append("update ao01")
   			.append("   set aao105=?,aao106=?,aao107=?")
   			.append(" where aao101=?      ")
   			;
   	System.out.println(this.get("aao106"));
   	Object args[]= {
   			this.get("aao105"),
   			this.get("aao106"),
   			this.get("aao107"),
   			this.get("aao101")
   	};
   	return this.executeUpdate(sql.toString(), args)>0;
   }
}
