package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ab01ServicesImpl extends JdbcServicesSupport 
{
    public List<Map<String,String>> query()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab103,c.fvalue aab104,a.aab105,")
				.append("       a.aab106,d.fvalue aab107,a.aab108,a.aab109,a.aab110,")
				.append("       a.aab111,a.aab112,a.aab113,e.fvalue aab114")
				.append("  from ab01 a,ai01 b,syscode c,syscode d,syscode e")
				.append(" where a.aab101=b.aab101 and b.aaj101=?")
				.append("   and c.fcode=a.aab104 and c.fname='aab104'")
				.append("   and d.fcode=a.aab107 and d.fname='aab107'")
				.append("   and e.fcode=a.aab114 and e.fname='aab114'")
				;
		return this.queryForList(sql.toString(), this.get("aaj101"));
    }
    
    public Map<String,String> findById()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aab102,a.aab103,d.fvalue aab104,a.aab105,a.aab106,")
    			.append("       e.fvalue aab107,a.aab108,a.aab109,a.aab110,f.fvalue aab111,")
    			.append("       a.aab112,a.aab113,g.fvalue aab114,h.fvalue aaf101,b.aaf102,")
    			.append("       b.aaf103,b.aaf104,b.aaf105,b.aaf106,")
    			.append("       c.aai102,c.aai103,c.aai104,c.aai105")
    			.append("  from ab01 a left join af01 b on a.aab101=b.aab101 ")
    			.append("  left join syscode h on h.fcode=b.aaf101 and h.fname='aaf101',")
    			.append("       ai01 c,syscode d,syscode e,syscode f,syscode g")
    			.append(" where a.aab101=? and c.aab101=a.aab101")
				.append("   and d.fcode=a.aab104 and d.fname='aab104'")
				.append("   and e.fcode=a.aab107 and e.fname='aab107'")
				.append("   and f.fcode=a.aab111 and f.fname='aab111'")
				.append("   and g.fcode=a.aab114 and g.fname='aab114'")
    			;
    	return this.queryForMap(sql.toString(), this.get("aab101"));
    }	
}