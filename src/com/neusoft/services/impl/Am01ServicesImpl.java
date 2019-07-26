package com.neusoft.services.impl;

import com.neusoft.services.JdbcServicesSupport;

public class Am01ServicesImpl extends JdbcServicesSupport {
	
	private boolean addFangke()throws Exception
    {
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into am01(aak101,aam102,aam103,aam104,aam105)")
    			.append("          values(1,?,?,CURRENT_DATE,?)")
    			;
    	//2.编写参数数组
    	Object args[]={
    			this.get("aam102"),
    			this.get("aam103"),
    			this.get("aam105"),
    			this.get("aam106"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

}
