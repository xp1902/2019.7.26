package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Af01ServicesImpl extends JdbcServicesSupport {

	private boolean addOlderHealthy()throws Exception
    {
    	
		////////////////////////////////af01和ae01//////////////////////////////////
		
		Object aab101=this.get("aab101");
		System.out.println(aab101);
		
    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append("INSERT INTO af01 (aab101,aaf101,aaf102,aaf103,aaf104,")
    			.append("                  aaf105,aaf106)")
    			.append("           VALUE (?,?,?,?,?,")
    			.append("                  ?,?)")
    			;
    	//2.编写参数数组
    	Object args1[]={
    			this.get("aab101"),
    			this.get("aaf101"),
    			this.get("aaf102"),
    			this.get("aaf103"),
    			this.get("aaf104"),
    			this.get("aaf105"),
    			this.get("aaf106"),
    	};
    	
        return this.executeUpdate(sql1.toString(), args1)>0;	
    }
	
	/**
	 * 查询健康信息+处方
	 */
	
	public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("SELECT a.aaf101,a.aaf102,a.aaf103,a.aaf104,a.aaf105,")
    			.append("       a.aaf106,b.aae101,b.aae102,b.aae103,b.aae104,")
    			.append("       b.aae105,b.aae106,b.aae107,a.aab101")
    			.append("  from af01 a,ae01 b")
    			.append(" WHERE a.aab101=b.aab101")
    			.append("   and b.aab101=?")
    			;
    	
    	System.out.println(this.queryForMap(sql.toString(), this.get("aab101")));
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }
	
	////////////////////////////////同时更新af01和ae01////////////////////////////////////
	private boolean modifyOlderHealthy()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE af01 a,ae01 b")
    			.append("   SET a.aaf101=?,a.aaf102=?,a.aaf103=?,a.aaf104=?,a.aaf105=?,")
    			.append("       a.aaf106=?,b.aae102=?,b.aae103=?,b.aae104=?,b.aae105=?,")
    			.append("       b.aae106=?,b.aae107=?")
    			.append(" WHERE a.aab101=?")
    			.append("   AND b.aab101=?")
    			;
    	Object args[]={
    			this.get("aaf101"),
    			this.get("aaf102"),
    			this.get("aaf103"),
    			this.get("aaf104"),
    			this.get("aaf105"),
    			this.get("aaf106"),
    			this.get("aae102"),
    			this.get("aae103"),
    			this.get("aae104"),
    			this.get("aae105"),
    			this.get("aae106"),
    			this.get("aae107"),
    			this.get("aab101"),
    			this.get("aab101"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
	
}
