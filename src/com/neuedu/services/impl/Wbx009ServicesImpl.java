package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx009ServicesImpl extends JdbcServicesSupport {

	 
	public boolean update(String uType) throws Exception {
		if(uType.equals("verifyVisit")) {
			return this.verifyVisit();
		}
		return false;
	}
	
	public boolean verifyVisit() throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("update am01"
				+ "	set aam106 = '2',aak101=?"
				+ "	where"
				+ "		aam101 =?");
		Object[] args = {this.get("aam101")};
		return this.batchUpdate(sb.toString() , this.get("aak101"), args);
	}

	 
	public List<Map<String, String>> queryForRows() throws Exception {
		
		Object baam104 = this.get("qbaam104");
		Object eaam104 = this.get("qeaam104");//结束时间
		Object aam102 = this.get("qaam102");//姓名
		Object aam106 = this.get("qaam106");//状态
		Object aam103 = this.get("qaam103");//电话

		List<Object> paramList = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("select m.aam101, m.aam102, m.aam103, m.aam104, m.aam105, s.fvalue cnaam106, m.aam106"
				+ "	from syscode s, am01 m"
				+ "	where"
				+ "		s.fcode=m.aam106 and s.fname= 'aam106'");
		if(this.isNotNull(baam104)) {
			sb.append("	and aam104 >= ?");
			paramList.add(baam104);
		}
		if(this.isNotNull(eaam104)) {
			sb.append("	and aam104 <= ?");
			paramList.add(eaam104);
		}
		if(this.isNotNull(aam102)) {
			sb.append("	and aam102 like ?");
			paramList.add(aam102);
		}
		if(this.isNotNull(aam106)) {
			sb.append("	and aam106 = ?");
			paramList.add(aam106);
		}
		if(this.isNotNull(aam103)) {
			sb.append("	and aam103 like ?");
			paramList.add(aam103);
		}
		System.out.println(sb);
		return this.queryForList(sb.toString(), paramList.toArray());
	}
}
