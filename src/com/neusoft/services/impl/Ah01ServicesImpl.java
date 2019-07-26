package com.neusoft.services.impl;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Ah01ServicesImpl extends JdbcServicesSupport 
{	
	private boolean modifyById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ah01 set aah102=?,aah103=?,aah104=?,aah105=?,")
				.append("                aah106=?,aah107=?,aah108=?,aah109=?")
				.append(" where aah101=? ")
				;
		Object args[]={
    			this.get("aah102"),
    			this.get("aah103"),
    			this.get("aah104"),
    			this.get("aah105"),
    			this.get("aah106"),
    			this.get("aah107"),
    			this.get("aah108"),
    			this.get("aah109"),
    			this.get("aah101")
    			};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aah101,a.aah102,a.aah103,a.aah104,a.aah105,")
				.append("       a.aah106,a.aah107,a.aah108,a.aah109,b.aab101,b.aab103")
				.append("  from ah01 a,ab01 b")
				.append(" where a.aah101=? and a.aab101=b.aab101")
				;
		return this.queryForMap(sql.toString(), this.get("aah101"));
	}

	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aah101,a.aah102,a.aah103,a.aah104,c.fvalue caah105,")
				.append("       d.fvalue caah106,e.fvalue caah107,f.fvalue caah108,a.aah109,")
				.append("       b.aab101,b.aab102,b.aab103,g.fvalue caab104  ")
				.append("  from ah01 a,ab01 b,syscode c,syscode d,syscode e,")
				.append("       syscode f,syscode g")
				.append(" where a.aab101=b.aab101")
				.append("   and a.aah105=c.fcode and c.fname='aah105' ")
				.append("   and a.aah106=d.fcode and d.fname='aah106' ")
				.append("   and a.aah107=e.fcode and e.fname='aah107' ")
				.append("   and a.aah108=f.fcode and f.fname='aah108' ")
				.append("   and b.aab104=g.fcode and g.fname='aab104' ")
				;
		Object aab102=this.get("qaab102");
		Object aab103=this.get("qaab103");
		Object aab104=this.get("qaab104");
		Object baah102=this.get("baah102");
		Object eaah102=this.get("eaah104");
		List<Object> paramList=new ArrayList<>();
		
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
		if(this.isNotNull(aab104))
  		{
  			sql.append(" and b.aab104=?");
  			paramList.add(aab104);
  		}
	
		if(this.isNotNull(baah102))
	  	{
	  		sql.append(" and a.aah102>=?");
			paramList.add(baah102);
 		}
	  	if(this.isNotNull(eaah102))	  		
	  	{
	  		sql.append(" and a.aah102<=?");
  			paramList.add(eaah102);
  		}
	  	sql.append(" order by a.aah102 desc");
	  	return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	private List<Map<String,String>>queryForElder()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aah101,a.aah102,a.aah103,a.aah104,c.fvalue caah105,")
				.append("       d.fvalue caah106,e.fvalue caah107,f.fvalue caah108,a.aah109,b.aab103")
				.append("  from ah01 a,ab01 b,syscode c,syscode d,syscode e,")
				.append("       syscode f")
				.append(" where a.aab101=? and a.aab101=b.aab101")
				.append("   and a.aah105=c.fcode and c.fname='aah105' ")
				.append("   and a.aah106=d.fcode and d.fname='aah106' ")
				.append("   and a.aah107=e.fcode and e.fname='aah107' ")
				.append("   and a.aah108=f.fcode and f.fname='aah108' ")
				.append(" order by a.aah102 desc")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	private List<Map<String,String>> queryTodayDaily()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aah101,a.aah102,a.aah103,a.aah104,c.fvalue caah105,")
				.append("       d.fvalue caah106,e.fvalue caah107,f.fvalue caah108,a.aah109,")
				.append("       b.aab101,b.aab102,b.aab103,g.fvalue caab104  ")
				.append("  from ah01 a,ab01 b,syscode c,syscode d,syscode e,")
				.append("       syscode f,syscode g")
				.append(" where a.aah102=? ")
				.append("   and a.aah105=c.fcode and c.fname='aah105' ")
				.append("   and a.aah106=d.fcode and d.fname='aah106' ")
				.append("   and a.aah107=e.fcode and e.fname='aah107' ")
				.append("   and a.aah108=f.fcode and f.fname='aah108' ")
				.append("   and b.aab104=g.fcode and g.fname='aab104' ")
				.append("   and a.aab101=b.aab101")
				.append("   and a.aab101=?")
				;
		StringBuilder sql1=new StringBuilder()
				.append("select aab101 from ai01 ")
				.append(" where aaj101=?");
		List<Map<String,String>> idMapList=this.queryForList(sql1.toString(), this.get("aaj101"));
    	
		List<Object> idList=new ArrayList<>();
		for(Map<String,String> map:idMapList)
		{
			if(this.isNotNull(map.get("aab101")))
			idList.add(map.get("aab101"));
		}
		// 返回系统当前时间
		Date date = new Date();
		//将当前时间转化为sql时间
		java.sql.Date transDate = new java.sql.Date(date.getTime());
		if(this.queryCBatch(sql.toString(), transDate.toString(), idList.toArray()).size()<idList.size())
		{
			StringBuilder sql2=new StringBuilder()
					.append("insert into ah01(aah102,aah103,aah104,aah105,aah106,")
					.append("                 aah107,aah108,aab101) ")
					.append("select CURDATE(),'未记录','未记录','3','3',")
					.append("		             '3','3',?")
					.append("  from dual ")
					.append(" where not EXISTS ")
					.append(" (select aab101 ")
					.append("from ah01 ")
					.append("where aab101=?) ")
					;
			this.batchUpdateNotExist(sql2.toString(),idList.toArray());
		}
		return this.queryCBatch(sql.toString(), transDate.toString(), idList.toArray());
	}
	
	
	private boolean modify()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update ah01 set ");
		Object temp=this.get("mod");
		if(temp.equals("1"))
			sql.append("aah105");
		else if(temp.equals("2"))
			sql.append("aah106");
		else if(temp.equals("3"))
			sql.append("aah107");
		else
			sql.append("aah108");
		sql.append("='1' where aab101=?");
		return this.batchUpdate(sql.toString(), this.getIdList("idlist"));
		
	}
}
