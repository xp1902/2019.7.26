package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Cx01ServicesImpl extends JdbcServicesSupport
{
	private boolean addLeave()throws Exception
	{
		String sql="insert into cx01(aaj101,acx102,acx103,acx104,acx107) values(?,?,?,?,'1')";
		Object args[]= {
				this.get("aaj101"),
				this.get("acx102"),
				this.get("acx103"),
				this.get("acx104")
				};
		return this.executeUpdate(sql, args)>0;
	}
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select acx102,acx103,acx104,acx105,acx106,")
				.append("       b.fvalue acx107")
				.append("  from cx01 a,syscode b")
				.append(" where a.aaj101=?")
				.append("   and b.fcode=a.acx107 and b.fname='acx107'")
				;
		return this.queryForList(sql.toString(), this.get("aaj101"));
	}
}