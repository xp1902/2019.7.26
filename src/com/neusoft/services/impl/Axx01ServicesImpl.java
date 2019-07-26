package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Axx01ServicesImpl extends JdbcServicesSupport {
	
	/**
	 * ��ѯ������Ϣ
	 * ��ȡ��ס�˱������Ϣ+�����Ĵ�λ�����ס״̬����λ+�����������aaj103
	 */
	
	public Map<String,String> findById()throws Exception
    {
		Object aad101=this.get("aad101");
		System.out.println(aad101);
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select d.aad101,d.aab101,a.aab102,a.aab103,a.aab104,")
    			.append("       a.aab105,a.aab106,a.aab107,a.aab108,a.aab109,")
    			.append("       a.aab110,a.aab112,a.aab113,a.aab114,")
    			.append("       b.aai102,b.aai103,b.aai104,b.aai105,")
    			.append("       c.aaj103,c.aaj101,e.aac103")
    			.append("  from ab01 a,ai01 b,aj01 c,ad01 d,ac01 e")
    			.append(" where a.aab101=d.aab101")
    			.append("   and a.aab101=b.aab101")
    			.append("   and b.aaj101=c.aaj101")
    			.append("   and a.aab101=e.aab101")
    			.append("   and d.aad101=?;")
    			;
    	
    	System.out.println(this.queryForMap(sql.toString(), this.get("aad101")));
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aad101"));
    }

}
