package com.neusoft.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport {
	
      /////////////////管理员审批///////////////
//    private boolean modifyRuyun()throws Exception
//    {
	      
//    }
    
	//////////////家属查询是否审批成功////////////////
	public Map<String,String> findById()throws Exception
    {
		Object aad101=this.get("aad101");
		System.out.println(aad101);
    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append("      SELECT a.aad101,b.aab101,c.aac104")
    			.append("        FROM (ad01 a LEFT OUTER JOIN ab01 b ON a.aab101=b.aab101)")
    			.append("  LEFT OUTER JOIN ac01 c ON b.aab101=c.aab101")
    			.append("       WHERE a.aad101=?")
    			;
    	
    	System.out.println(this.queryForMap(sql1.toString(), this.get("aad101")));
    	//执行查询
    	return this.queryForMap(sql1.toString(), this.get("aad101"));
    }
	

    //////////删除ac01入院信息
//    private boolean batchDelete()throws Exception
//    {
//    	
//    }

    
//    public Map<String,String> findById()throws Exception
//    {
//    	//1.编写SQL语句
//    	StringBuilder sql=new StringBuilder()
//    			.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
//    			.append("       a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
//    			.append("       a.aab112,a.aab113")
//    			.append("  from ab01 a")
//    			.append(" where a.aab101=?")
//    			;
//    	//执行查询
//    	return this.queryForMap(sql.toString(), this.get("aab101"));
//    }

}
