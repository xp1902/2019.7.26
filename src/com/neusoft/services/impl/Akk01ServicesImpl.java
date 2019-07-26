package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Akk01ServicesImpl extends JdbcServicesSupport {
	
	/**
	 * 家属查询管理员信息
	 */
	
	public Map<String,String> findById()throws Exception
    {
		Object aad101=this.get("aad101");
		System.out.println(aad101);
		Object aak101=this.get("aak101");
		System.out.println(aak101);
//		StringBuilder sql=new StringBuilder()
//				.append("select a.aak102,a.aak103,a.aak104,a.aak105,a.aak107,")
//				.append("       a.aak108,b.aak101,b.aal101,b.aab101,d.aad101")
//				.append("  from ak01 a,al01 b,ab01 c,ad01 d")
//				.append(" where a.aak101=b.aak101")
//				.append("   and b.aab101=c.aab101")
//				.append("   and c.aab101=d.aab101")
//				.append("   and b.aal101=?")
//				;
//    	
//    	System.out.println(this.queryForMap(sql.toString(), this.get("aal101")));
//    	//执行查询
//    	return this.queryForMap(sql.toString(), this.get("aal101"));
//    	
		StringBuilder sql=new StringBuilder()
				.append("select a.aak102,a.aak103,a.aak104,a.aak107,")
				.append("       a.aak108,a.aak101,b.fvalue cnaak104")
				.append("  from ak01 a,syscode b")
				.append(" where a.aak104=b.fcode AND b.fname='aak104'")
				.append("   AND a.aak101=?")
				;
    	
    	System.out.println(this.queryForMap(sql.toString(), this.get("aak101")));
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aak101"));
    }

}
