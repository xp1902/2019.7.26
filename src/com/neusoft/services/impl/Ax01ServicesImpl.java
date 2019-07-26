package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

/////////////////////////入住人信息Ab01//////////////////////////////

public class Ax01ServicesImpl extends JdbcServicesSupport 
{
	
	private boolean modifyOlder()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ab01 a")
    			.append("   set a.aab103=?,a.aab104=?,a.aab105=?,a.aab106=?,a.aab107=?,")
    			.append("       a.aab108=?,a.aab109=?,a.aab110=?,a.aab112=?,a.aab113=?,")
    			.append("       a.aab114=?")
    			.append(" where a.aab101=?")
    			;
    	Object args[]={
    			this.get("aab103"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			this.get("aab112"),
    			this.get("aab113"),
    			this.get("aab114"),
    			this.get("aab101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }
/////////////////////////添加ad01的同时加ac01入住申请表//////////////////
	private boolean addOlder()throws Exception
    {
    	//获取入住人编号
    	String aab102=Tools.getEmpNumber();
    	//向DTO添加入住人编号
    	this.put("aab102", aab102);
    	System.out.println("12345"+aab102);
    	//获取入住人流水号
    	int aab101=Tools.getSequence("aab101");
    	System.out.println(aab101);
    	//添加老人信息
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab112,")
    			.append("                 aab113,aab114)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
    	Object args1[]={
    			aab102,
    			this.get("aab103"),
    			this.get("aab104"),
    			this.get("aab105"),
    			this.get("aab106"),
    			this.get("aab107"),
    			this.get("aab108"),
    			this.get("aab109"),
    			this.get("aab110"),
    			this.get("aab112"),
    			this.get("aab113"),
    			this.get("aab114"),
    	};
    	
        //在家属表中插入入住人流水号
    	StringBuilder sql2=new StringBuilder()
    			.append("update ad01")
    			.append("   set aab101=?")
    			.append(" where aad101=?;")
    			;
    	Object args2[]={
    			aab101,
    			this.get("aad101")
    	};
        return this.executeUpdate(sql1.toString(), args1)>0&&this.executeUpdate(sql2.toString(), args2)>0;	
    }
	
	private boolean addYuyueOlder()throws Exception
    {
		Object aad101=this.get("aad101");
		List<Object> paramList=new ArrayList<>();
		paramList.add(aad101);
		String sql2="select aab101 from ad01 where aad101=?";
		Map<String,String> result=this.queryForMap(sql2, paramList.toArray());
		String aab101=result.get("aab101");
		//在预约申请表中添加信息
    	StringBuilder sql3=new StringBuilder()
    			.append("insert into ac01(aab101,aac102,aac103,aac104)")
    			.append("           value(?,CURRENT_DATE,?,1)")
    			;
    	Object args3[]={
    			aab101,
    			this.get("aac103"),
    	};
    	return this.executeUpdate(sql3.toString(), args3)>0;

    }
	
	/**
	 * 查询老人基本信息
	 */
	
	public Map<String,String> findById()throws Exception
    {
		Object aad101=this.get("aad101");
		System.out.println(aad101);
		
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select d.aad101,a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
    			.append("       a.aab106,a.aab107,a.aab108,a.aab109,a.aab110,")
    			.append("       a.aab112,a.aab113,a.aab114,c.aac103,c.aac104")
    			.append("  from (ad01 d LEFT OUTER JOIN ab01 a ON d.aab101=a.aab101)")
    			.append("  LEFT OUTER JOIN ac01 c ON c.aab101=a.aab101")
    			.append(" where d.aad101=?")
    			;
    	
    	System.out.println(this.queryForMap(sql.toString(), this.get("aad101")));
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aad101"));
    }
	
}
