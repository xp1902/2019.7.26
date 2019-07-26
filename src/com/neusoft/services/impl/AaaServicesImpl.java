package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class AaaServicesImpl extends JdbcServicesSupport
{
    public Map<String,String> findById()throws Exception
    {
    	
		//�޸�ԤԼ��ѯ
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aao101,a.aan101,a.aao104")
    			.append("  from ao01 a")
    			.append(" where a.aao101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aao101"));
    }
    

    
}
