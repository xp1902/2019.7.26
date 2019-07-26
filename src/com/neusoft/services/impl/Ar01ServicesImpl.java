package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ar01ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aar101,a.aar102,c.fvalue aar103,a.aar104,a.aar105,")
				.append("       b.aab102,b.aab103")
				.append("  from ar01 a,ab01 b ,syscode c")
				.append(" where a.aab101=b.aab101 and a.aaj101=?")
				.append("   and c.fcode=a.aar103 and c.fname='aar103'")
				;
				
		Object aab102=this.get("qaab102");
		Object aab103=this.get("qaab103");
		Object baar102=this.get("baar102");
		Object eaar102=this.get("eaar102");
		List<Object> paramList=new ArrayList<>();
		
		paramList.add(this.get("aaj101"));
		
		if(this.isNotNull(aab102))
  		{
  			sql.append(" and b.aab102=?");
  			paramList.add(aab102);
  		}
		if(this.isNotNull(aab103))
  		{
  			sql.append(" and b.aab103=?");
  			paramList.add(aab103);
  		}
		if(this.isNotNull(baar102))
	  	{
	  		sql.append(" and a.aar102>=?");
			paramList.add(baar102);
 		}
	  	if(this.isNotNull(eaar102))	  		
	  	{
	  		sql.append(" and a.aar102<=?");
  			paramList.add(eaar102);
  		}
		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	private boolean addApply()throws Exception
	{
		String sql1="insert into ar01(aaj101,aab101,aar102,aar103,aar105) values(?,?,?,'1',?)";
		Date date = new Date();
		java.sql.Date transDate = new java.sql.Date(date.getTime());
		Object args[]= {
				this.get("aaj101"),
				this.get("aab101"),
				transDate.toString(),
				this.get("aar105")
				};
		int a=this.executeUpdate(sql1, args);
		
		
		StringBuilder sql=new StringBuilder()
				.append("insert into as01(aar101,aap101,aas102)");
		
		int aar101=Tools.getSequence("aar101");
		List<Object> paramList=new ArrayList<>();
		
		String name[]={""};
		String num[]={""};
		
		if(this.get("aap101").getClass().isArray())
		{
			name=(String[])this.get("aap101");
			num=(String[])this.get("aas102");
		}
		else
		{
			name[0]=(String)this.get("aap101");
			num[0]=(String)this.get("aas102");
		}
		int temp=0;
		for(int i=0;i<num.length;i++)
		{
			if(!num[i].equals("0")&&this.isNotNull(num[i]))
			{
				if(temp==0)sql.append(" values ");
				else sql.append(",");
				temp+=1;
				sql.append("(?,?,?)");
				paramList.add(aar101);
				paramList.add(name[i]);
				paramList.add(num[i]);
			}
		}
		int b=this.executeUpdate(sql.toString(), paramList.toArray());
		return a>0&&b>0;
	}
}
