package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.support.ControllerSupport;

import com.neusoft.services.JdbcServicesSupport;

public class An01ServicesImpl extends JdbcServicesSupport
{
    private boolean modifyVol()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update an01 a")
    			.append("   set a.aan102=?,a.aan103=?,a.aan104=?,a.aan105=?,a.aan106=?")
    			.append(" where a.aan101=?")
    			;
    	Object args[]={
    			this.get("aan102"),
    			this.get("aan103"),
    			this.get("aan104"),
    			this.get("aan105"),
    			this.get("aan106"),
    			this.get("aan101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean volHome()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into au01(aau102,aau103,aau104)")
    			.append(         " values(?,?,?);")
    			;
    	
    	//2.编写参数数组
    	Object args1[]={
    			this.get("aau102"),
    			Tools.getMd5(this.get("aau103")),
    			this.get("aau104"),
    	};
    	//主键已经获取
    	int aau101=Tools.getSequence("aau101");
    	//1.编写SQL语句
    	StringBuilder sql2=new StringBuilder()
    			.append("insert into an01(aau101,aan102,aan103,aan104,aan105")
    			.append("                 ,aan106)")
    			.append(         " values(?,?,?,?,?")
    			.append("                 ,?);")
    			;
    	//2.编写参数数组
    	Object args2[]={
    			aau101,
    			this.get("aan102"),
    			this.get("aan103"),
    			this.get("aan104"),
    			this.get("aan105"),
    			this.get("aan106"),
    	};
    	System.out.println("try");
    	
        return this.executeUpdate(sql1.toString(), args1)>0&&this.executeUpdate(sql2.toString(), args2)>0;	
       
    }
    
   
    
    private boolean yuyueVol()throws Exception
    {
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ao01(aan101,aao102,aao104,aao103)")
    			.append(         " values(?,now(),?,1)")
    			;
    	//2.编写参数数组
    	Object args[]={		
    			this.get("aan101"),
    			this.get("aao104"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean pingjun()throws Exception
    {
        Object aan101=this.get("aan101");
		
		List<Object> paramList=new ArrayList<>();
		
		paramList.add(aan101);
		
		String sql1="select ceil(avg(aao107)) from ao01 where aan101=?";
		
		Map<String,String> result=this.queryForMap(sql1, paramList.toArray());
		
		String aan108=result.get("ceil(avg(aao107))");
		
		StringBuilder sql2=new StringBuilder() 
				.append("update an01 set aan108=? where aan101=?");
		
		Object args[]={		
    			aan108,
    			this.get("aan101"),
    	};
		return this.executeUpdate(sql2.toString(), args)>0;	
    }
    
    public Map<String,String> findById()throws Exception
    {
    	
		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aan102,a.aan103,a.aan104,a.aan105,a.aan106,")
    			.append("       a.aan108,a.aan101,aau101")
    			.append("  from an01 a")
    			.append(" where a.aan101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aan101"));
    }
    

    
}
