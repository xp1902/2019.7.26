package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
import com.neusoft.web.support.ControllerSupport;

/////////////////////////////家属信息Ad01//////////////////////////

public class Ad01ServicesImpl extends JdbcServicesSupport 
{
	
    private boolean deleteById()throws Exception
    {
    	String sql="delete from ab01 where aad101=?";
    	return this.executeUpdate(sql, this.get("aad101"))>0;
    }
    
    private boolean modifyJiashu()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ad01 a")
    			.append("   set a.aad102=?,a.aad103=?,a.aad104=?,a.aad105=?,a.aad106=?,")
    			.append("       a.aad107=?")
    			.append(" where a.aad101=?")
    			;
    	Object args[]={
    			this.get("aad102"),
    			this.get("aad103"),
    			this.get("aad104"),
    			this.get("aad105"),
    			this.get("aad106"),
    			this.get("aad107"),
    			this.get("aad101")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    
    private boolean addJiashu()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into au01(aau102,aau103,aau104)")
    			.append("          values(?,?,?);")
    			;
    	
    	//2.编写参数数组
    	Object args1[]={
    			this.get("aau102"),
    			Tools.getMd5(this.get("aau103")),
    			this.get("aau104"),
    	};
    	//主键已经获取
    	int aau101=Tools.getSequence("aau101");
    	//1.编写SQL语句
    	StringBuilder sql2=new StringBuilder()
    			.append("insert into ad01(aad102,aad103,aad104,aad105,")
    			.append("                 aad106,aad107,aau101)")
    			.append("          values(?,?,?,?,")
    			.append("                 ?,?,?);")
    			;
    	//2.编写参数数组
    	Object args2[]={
    			this.get("aad102"),
    			this.get("aad103"),
    			this.get("aad104"),
    			this.get("aad105"),
    			this.get("aad106"),
    			this.get("aad107"),
    			aau101,
    	};
    	System.out.println("try");
    	
        return this.executeUpdate(sql1.toString(), args1)>0&&this.executeUpdate(sql2.toString(), args2)>0;	
       
    }
    
    
    
    private boolean batchDelete()throws Exception
    {
    	//1.定义SQL语句
    	String sql="delete from ad01 where aad101=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("idlist");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
    }
    
    
    public Map<String,String> findById()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad102,a.aad103,a.aad104,a.aad105,a.aad106,")
    			.append("       a.aad107,a.aad101")
    			.append("  from ad01 a")
    			.append(" where a.aad101=?")
    			;
    	//执行查询
    	return this.queryForMap(sql.toString(), this.get("aad101"));
    }
    
    
      /**
       * 不定条件查询
       * @return
       * @throws Exception
       */
//	  public List<Map<String,String>> query()throws Exception
//	  {
//	  		//还原页面查询条件
//	  		Object aab102=this.get("qaad102");     //姓名  模糊查询
//	  		Object aab103=this.get("qaad103");     //身份证号
//	  		Object aab104=this.get("qaad104");     //联系电话
//	  		Object aab105=this.get("qaad105");     //与老人关系
//	  		Object aab106=this.get("qaad106");     //紧急联系电话
//	  		Object aab107=this.get("qaad107");     //家庭住址
////	  		Object baab104=this.get("baab104");    //生日B
////	  		Object eaab104=this.get("eaab104");    //生日E
//	  		
//	  		//定义SQL主体
//	  		StringBuilder sql=new StringBuilder()
//	  				.append("select x.aad101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
//	  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
//	  				.append("  from syscode a,syscode b, ab01 x")
//	  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
//	  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
//	  				;
//	  		
//	  		//参数列表
//	  		List<Object> paramList=new ArrayList<>();
//	  		//逐一判断查询条件是否录入,拼接AND条件
//	  		if(this.isNotNull(aab102))
//	  		{
//	  			sql.append(" and x.aab102 like ?");
//	  			paramList.add("%"+aab102+"%");
//	  		}
//	  		if(this.isNotNull(aab103))
//	  		{
//	  			sql.append(" and x.aab103=?");
//	  			paramList.add(aab103);
//	  		}
//	  		if(this.isNotNull(aab105))
//	  		{
//	  			sql.append(" and x.aab105=?");
//	  			paramList.add(aab105);
//	  		}
//	  		if(this.isNotNull(aab106))
//	  		{
//	  			sql.append(" and x.aab106=?");
//	  			paramList.add(aab106);
//	  		}
//	  		if(this.isNotNull(baab104))
//	  		{
//	  			sql.append(" and x.aab104>=?");
//	  			paramList.add(baab104);
//	  		}
//	  		if(this.isNotNull(eaab104))
//	  		{
//	  			sql.append(" and x.aab104<=?");
//	  			paramList.add(eaab104);
//	  		}
//	  		
//	  		sql.append(" order by x.aab102");
//	  		return this.queryForList(sql.toString(), paramList.toArray());
//	  }
    
    

	
}