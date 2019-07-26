package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ag01ServicesImpl extends JdbcServicesSupport
{
	private boolean addPeriodCon()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into ag01(aag102,aag103,aag104,aag105,aag106,")
				.append("                 aag107,aag108,aab101,aaj101)")
				.append(" values          (?,?,?,?,?,")
				.append("                  ?,?,?,?)")
				;
		Object args[]={
    			this.get("aag102"),
    			this.get("aag103"),
    			this.get("aag104"),
    			this.get("aag105"),
    			this.get("aag106"),
    			this.get("aag107"),
    			this.get("aag108"),
    			this.get("aab101"),
    			this.get("aaj101")
    	};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	private boolean modifyPeriodCon()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ag01 set aag102=?,aag103=?,aag104=?,aag105=?,")
				.append("                aag106=?,aag107=?,aag108=?")
				.append(" where aag101=? ")
				;
		Object args[]={
    			this.get("aag102"),
    			this.get("aag103"),
    			this.get("aag104"),
    			this.get("aag105"),
    			this.get("aag106"),
    			this.get("aag107"),
    			this.get("aag108"),
    			this.get("aag101")
    	};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aag101,aag102,aag103,aag104,aag105,")
				.append("       aag106,aag107,aag108")
				.append("  from ag01 ")
				.append(" where aag101=?")
				;
		return this.queryForMap(sql.toString(), this.get("aag101"));
	}
	
	public List<Map<String,String>> query()throws Exception
    {
		StringBuilder sql1=new StringBuilder()
				.append("select aab101 from ai01 ")
				.append(" where aaj101=?");
		List<Map<String,String>> idMapList=this.queryForList(sql1.toString(), this.get("aaj101"));
    	
		List<Object> idList=new ArrayList<>();
		for(Map<String,String> map:idMapList)
		{
			idList.add(map.get("aab101"));
		}
		
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
				.append("       b.aag102,b.aag103,b.aag104,b.aag105,b.aag106,")
				.append("       b.aag107,b.aag108")
				.append("  from ab01 a left join ag01 b")
				.append("    on a.aab101=b.aab101")
				.append(" where a.aab101=?")
				.append(" order by b.aag102 desc ")
				.append(" limit 1")
				;
		return this.queryBatch(sql.toString(), idList.toArray());
    }
	
	private List<Map<String,String>> queryForElder()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aag101,a.aag102,a.aag103,a.aag104,a.aag105,")
				.append("       a.aag106,a.aag107,a.aag108,b.aab103")
				.append("  from ag01 a,ab01 b")
				.append(" where a.aab101=? and a.aab101=b.aab101")
				.append(" order by a.aag102 desc")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
}
