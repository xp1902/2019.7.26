package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.neusoft.services.JdbcServicesSupport;

public class Wbx014ServicesImpl extends JdbcServicesSupport {

	/**********Ö¾Ô¸Õß±í***************/
	@Override
	public boolean update(String uType) throws Exception {
		if(uType.equals("verify")) {
			return this.verify();
		}
		if(uType.equals("reject")) {
			return this.reject();
		}
		return super.update(uType);
	}

	private boolean verify() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("update ao01 set aao103 = '2'"
				+ "	where aan101 = ?");
		List<Object> list = JSON.parseArray(this.get("idlist").toString());
		this.appendBatch(sb.toString(), list.toArray());

		StringBuilder sb2 = new StringBuilder();
		sb2.append("update an01 set aak101 = ?"
				+ "	where aan101 = ?");
		this.appendBatch(sb2.toString(),this.get("aak101"), list.toArray());
		
		return this.executeTransaction();
	}
	
	private boolean reject() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("update ao01 set aao103 = '3'"
				+ "	where aan101 = ?");
		List<Object> list = JSON.parseArray(this.get("idlist").toString());
		this.appendBatch(sb.toString(), list.toArray());

		StringBuilder sb2 = new StringBuilder();
		sb2.append("update an01 set aak101 = ?"
				+ "	where aan101 = ?");
		this.appendBatch(sb2.toString(), this.get("aak101"), list.toArray());
		
		return this.executeTransaction();
	}
	
	@Override
	public List<Map<String, String>> queryForRows() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select n.aan101, n.aan102, n.aan103, s.fvalue cnaan103, n.aan104, n.aan105, n.aan106, n.aan108,"
				+ "	o.aao102, o.aao103, s1.fvalue cnaao103"
				+ "	from syscode s, an01 n, ao01 o, syscode s1"
				+ "	where"
				+ "		s.fname='aan103' and s.fcode = n.aan103"
				+ "		and s1.fname='aao103' and s1.fcode = o.aao103"
				+ "		and o.aan101 = n.aan101");
		
		List<Object> paramList = new ArrayList<>();
		Object aan106 = this.get("aan106");
		Object baao102 = this.get("baao102");
		Object eaao102 = this.get("eaao102");
		Object aao103 = this.get("aao103");
		if(this.isNotNull(aan106)) {
			sb.append("	and n.aan106 like ?");
			paramList.add("%"+aan106+"%");
		}
		if(this.isNotNull(aao103)) {
			sb.append("	and o.aao103 = ?");
			paramList.add(aao103);
		}
		if(this.isNotNull(baao102)) {
			sb.append("	and o.aao102 >= ?");
			paramList.add(baao102);
		}
		if(this.isNotNull(eaao102)) {
			sb.append("	and o.aao102 <= ?");
			paramList.add(eaao102);
		}
		System.out.println(sb);
		return this.queryForList(sb.toString(), paramList.toArray());
	}
}
