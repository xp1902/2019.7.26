package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Al01ServicesImpl extends JdbcServicesSupport {
	
	private boolean modifyOutOlder()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update al01")
    			.append("   set aal102=?,aal103=?,aal104=?,aal105=?,aal106=?")
    			.append(" where aal101=?")
    			;
    	Object args[]={
    			this.get("aal102"),
    			this.get("aal103"),
    			this.get("aal104"),
    			this.get("aal105"),
    			this.get("aal106"),
    			this.get("aal101"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean addOutOlder()throws Exception
    {
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into al01(aab101,aal102,aal103,aal104,aal105,")
    			.append("                 aal106,aal107)")
    			.append("           value(?,?,?,?,?,")
    			.append("                 ?,2)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aab101"),
    			this.get("aal102"),
    			this.get("aal103"),
    			this.get("aal104"),
    			this.get("aal105"),
    			this.get("aal106"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aal101,a.aal102,a.aal103,a.aal104,a.aal105,")
    			.append("       a.aal106,b.aak101,b.aak103,b.aak102,a.aab101")
    			.append("  from al01 a")
    			.append("  LEFT JOIN ak01 b on a.aak101=b.aak101")
    			.append(" where a.aal101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aal101"));
    }
    
      /**
       * 不定条件查询
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//还原页面查询条件
		    Object aab101=this.get("aab101");
	  		Object aal102=this.get("qaal102");     //外出原因
	  		Object aal105=this.get("qaal105");     //陪同人
	  		Object aal106=this.get("qaal106");     //陪同人电话
	  		Object baal103=this.get("baal103");    //外出日期B
	  		Object eaal103=this.get("eaal103");    //外出日期E
	  		Object baal104=this.get("baal104");    //预计返回日期B
	  		Object eaal104=this.get("eaal104");    //预计返回日期E
	  		
	  		//定义SQL主体
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aal102,a.aal105,a.aal106,a.aal103,a.aal104,")
	  				.append("       a.aal101,b.aab101,c.aak101,c.aak103")
	  				.append("  from (al01 a ")
	  				.append("  LEFT JOIN ab01 b ON a.aab101=b.aab101)")
	  				.append("  LEFT JOIN ak01 c ON a.aak101=c.aak101")
	  				.append("  where true")
	  				;
	  		
	  		//参数列表
	  		List<Object> paramList=new ArrayList<>();
	  		//逐一判断查询条件是否录入,拼接AND条件
	  		if(this.isNotNull(aab101))
	  		{
	  			sql.append(" and a.aab101=?");
	  			paramList.add(aab101);
	  		}
	  		if(this.isNotNull(aal102))
	  		{
	  			sql.append(" and a.aal102 like ?");
	  			paramList.add("%"+aal102+"%");
	  		}
	  		if(this.isNotNull(aal105))
	  		{
	  			sql.append(" and a.aal105=?");
	  			paramList.add(aal105);
	  		}
	  		if(this.isNotNull(aal106))
	  		{
	  			sql.append(" and a.aal106=?");
	  			paramList.add(aal106);
	  		}
	  		//外出日期
	  		if(this.isNotNull(baal103))
	  		{
	  			sql.append(" and a.aal103>=?");
	  			paramList.add(baal103);
	  		}
	  		if(this.isNotNull(eaal103))
	  		{
	  			sql.append(" and a.aal103<=?");
	  			paramList.add(eaal103);
	  		}
	  		//返回
	  		if(this.isNotNull(baal104))
	  		{
	  			sql.append(" and a.aal104>=?");
	  			paramList.add(baal104);
	  		}
	  		if(this.isNotNull(eaal104))
	  		{
	  			sql.append(" and a.aal104<=?");
	  			paramList.add(eaal104);
	  		}
	  		sql.append(" order by a.aal103");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }

	  private boolean batchDelete()throws Exception
	  {
		  //1.定义SQL语句
		  String sql="delete from al01 where aal101=?";
		  //2.获取页面idlist数组
		  String idlist[]=this.getIdList("idlist");
		  //3.执行
		  return this.batchUpdate(sql, idlist);
	  }
	  
	  private boolean deleteById()throws Exception
	  {
		  Object aal101=this.get("aal101");
		  System.out.println(aal101);
		  String sql="delete from al01 where aal101=?";
	      return this.executeUpdate(sql, this.get("aal101"))>0;
	  }
	    

}
