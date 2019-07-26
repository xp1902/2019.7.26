package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx004ServicesImpl extends JdbcServicesSupport {
	//¼ÒÊô·þÎñ
	public List<Map<String, String>> queryForRows() throws Exception {
		Object aab101 = this.get("aab101");
		StringBuilder sb = new StringBuilder();
		sb.append("select d.aad101 ,d.aad102 ,d.aad103 ,d.aad104 ,d.aad105"
				+ " 	  ,d.aad106 ,d.aad107"
				+ "       from ad01 d"
				+ "		  where"
				+ "		  d.aab101 = ?");
		
		List<Object> paramList = new ArrayList<>();
		paramList.add(aab101);
		return this.queryForList(sb.toString(), paramList.toArray());
	}
}
