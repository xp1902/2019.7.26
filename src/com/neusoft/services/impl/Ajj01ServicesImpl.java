package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ajj01ServicesImpl extends JdbcServicesSupport {
	
	/**
	 * 查询护工信息
	 * ab01->ai01->aj01
	 */
	
	public Map<String,String> findById()throws Exception
	{
		
		StringBuilder sql=new StringBuilder()
				.append("select a.aaj101,a.aaj102,a.aaj103,a.aaj104,a.aaj105,")
				.append("       a.aaj106,a.aaj107,a.aaj108,a.aaj109,a.aaj110,")
				.append("       b.fvalue cnaaj104,c.fvalue cnaaj109")
				.append("  from aj01 a,syscode b,syscode c")
				.append(" where a.aaj104=b.fcode AND b.fname='aaj104'")
				.append("   AND a.aaj109=c.fcode AND c.fname='aaj109'")
				.append("   AND a.aaj101=?")
				;
		return this.queryForMap(sql.toString(), this.get("aaj101"));
	}
	
}
