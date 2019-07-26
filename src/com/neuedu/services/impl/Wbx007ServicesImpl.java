package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx007ServicesImpl extends JdbcServicesSupport{
	public boolean update(String uType) throws Exception {
		if(uType.equals("verifyFeedback")) {
			return this.verifyFeedback();
		}
		return false;
	}

	public boolean verifyFeedback() throws Exception{
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("update at01"
				+ "	set aak101=?,aat107=CURRENT_TIMESTAMP,"
				+ "		aat106='2'"
				+ "	where"
				+ "		aat101=?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("aat101"));
		Object aak101 = this.get("aak101");
		return this.batchUpdate(sb.toString(), aak101, paramList.toArray());
	}
	
	public List<Map<String, String>> queryForRows() throws Exception {
		Object baat102 = this.get("qbaat102");
		Object eaat102 = this.get("qeaat102");
		Object aat103 = this.get("qaat103");
		Object aat106 = this.get("qaat106");
		Object aat104 = this.get("aat104");
		
		StringBuilder sb = new StringBuilder();
		List<Object> paramList = new ArrayList<>();

		sb.append("select t.aat101, t.aat102, t.aat103, t.aat104, t.aat105, t.aat106, t.aat106, s.fvalue cnaat106"
				+ ""
				+ "	from at01 t, syscode s"
				+ "	where"
				+ "		s.fcode=t.aat106 and s.fname='aat106'"
				+ "		");
		if(this.isNotNull(baat102)) {
			sb.append(" and aat102 >= ?");
			paramList.add(baat102);
		}
		if(this.isNotNull(eaat102)) {
			sb.append(" and aat102 >= ?");
			paramList.add(eaat102);
		}
		if(this.isNotNull(aat103)) {
			sb.append("	and aat103 like ?");
			paramList.add(aat103);
		}
		if(this.isNotNull(aat106)) {
			sb.append(" and aat106 like ?");
			paramList.add(aat106);
		}
		if(this.isNotNull(aat104)) {
			sb.append(" and aat104 like ?");
			paramList.add(aat104);
		}
		return this.queryForList(sb.toString(), paramList.toArray());
	}
}
