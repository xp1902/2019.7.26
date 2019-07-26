package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;



public class Ae01ServicesImpl extends JdbcServicesSupport
{
	private boolean addOlderChufang()throws Exception
    {
    	
		////////////////////////////////ae01//////////////////////////////////

    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append("INSERT INTO ae01 (aab101,aae102,aae103,aae104,aae105,")
    			.append("                  aae106,aae107)")
    			.append("           VALUE (?,?,?,?,?,")
    			.append("                  ?,?)")
    			;
    	//2.编写参数数组
    	Object args1[]={
    			this.get("aab101"),
    			this.get("aae102"),
    			this.get("aae103"),
    			this.get("aae104"),
    			this.get("aae105"),
    			this.get("aae106"),
    			this.get("aae107"),
    	};
    	
        return this.executeUpdate(sql1.toString(), args1)>0;	
    }
	
	//批量删除
	  private boolean batchDelete()throws Exception
	  {
		  //1.定义SQL语句
		  String sql="delete from ae01 where aae101=?";
		  //2.获取页面idlist数组
		  String idlist[]=this.getIdList("idlist");
		  //3.执行
		  return this.batchUpdate(sql, idlist);
	  }
	  
	  private boolean deleteById()throws Exception
	  {
		  Object aae101=this.get("aae101");
		  System.out.println(aae101);
		  String sql="delete from ae01 where aae101=?";
	      return this.executeUpdate(sql, this.get("aae101"))>0;
	  }
	  
	  public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("SELECT aae101,aab101,aae102,aae103,aae104,")
	    			.append("       aae105,aae106,aae107")
	    			.append("  FROM ae01")
	    			.append(" WHERE aae101=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aae101"));
	    }
	  
	  private boolean modifyOlderChufang()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("UPDATE ae01")
	    			.append("   SET aae102=?,aae103=?,aae104=?,aae105=?,aae106=?,")
	    			.append("       aae107=?")
	    			.append(" WHERE aae101=?")
	    			;
	    	Object args[]={
	    			this.get("aae102"),
	    			this.get("aae103"),
	    			this.get("aae104"),
	    			this.get("aae105"),
	    			this.get("aae106"),
	    			this.get("aae107"),
	    			this.get("aae101"),
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }
	
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aae101,aae102,aae103,aae104,aae105,aae106,")
				.append("       aae107")
				.append("  from ae01 ")
				.append(" where aab101=?")
				.append(" order by aae107")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
}