package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ba01ServicesImpl extends JdbcServicesSupport
{
    private boolean addTeam()throws Exception
    {
    	Object aan101=this.get("aan101");
		
		List<Object> paramList=new ArrayList<>();
		
		paramList.add(aan101);
		
		String sql1="select aan102 from an01 where aan101=?";
		
		Map<String,String> result=this.queryForMap(sql1, paramList.toArray());
		
		String aaz102=result.get("aan102");
    	//创建小组
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ba01(bba102,aaz101,bba103,bba104,bba105,")
    			.append("                 bba106,aaz102)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("bba102"),
    			this.get("aan101"),
    			this.get("bba103"),
    			this.get("bba104"),
    			this.get("bba105"),
    			this.get("bba106"),
    			aaz102,
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean addVol()throws Exception
    {
    	//创建小组之后将小组的流水号写进个人信息
    	
    	Object aan101=this.get("aan101");
		
		List<Object> paramList=new ArrayList<>();
		
		paramList.add(aan101);
		
		String sql1="select bba101 from ba01 where aaz101=?";
		
		Map<String,String> result=this.queryForMap(sql1, paramList.toArray());
		
		String aan109=result.get("bba101");
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update an01")
    			.append("   set aan109=?")
    			.append(" where aan101=?")
    			;
    	//2.编写参数数组
    	Object args[]={
    			aan109,
    			this.get("aan101"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

    public Map<String,String> findById()throws Exception
    {
    	//志愿团队详细信息
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aan102,a.aan101,a.aan109,b.bba101,b.bba102,")
    			.append("       b.bba103,b.bba104,b.bba105,b.bba106,b.aaz101,b.aaz102")
    			.append("  from an01 a,ba01 b")
    			.append(" where a.aan101=? and a.aan109=b.bba101")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aan101"));
    }
    
    private boolean modifyTeam()throws Exception
    {
    	//队长修改团队信息
    	StringBuilder sql=new StringBuilder()
    			.append("update ba01 a")
    			.append("   set a.bba102=?,a.bba103=?,a.bba104=?,a.bba105=?,a.bba106=?")
    			.append(" where a.bba101=?")
    			;
    	Object args[]={
    			this.get("bba102"),
    			this.get("bba103"),
    			this.get("bba104"),
    			this.get("bba105"),
    			this.get("bba106"),
    			this.get("bba101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
	public List<Map<String,String>> query()throws Exception
	  {
		//查询所有战队
		StringBuilder sql=new StringBuilder()
				.append("select a.bba101,a.bba102,a.bba103,a.bba104,a.bba105,")
				.append("       a.bba106")
				.append("  from ba01 a")
				;
		Object args[]={
				
				
		};
		
		return this.queryForList(sql.toString(), args);
    }
	
    private boolean jiaTeam()throws Exception
    {
    	//创建小组
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update an01 a")
    			.append("   set a.aan109=?")
    			.append(" where a.aan101=?")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("bba101"),
    			this.get("aan101"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    private boolean delTeam()throws Exception
    {
    	//创建小组
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("update an01 a")
    			.append("   set a.aan109=Null")
    			.append(" where a.aan101=?")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aan101"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
}
