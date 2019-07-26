package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx006ServicesImpl extends JdbcServicesSupport {

	 
	public boolean update(String uType) throws Exception{
		if(uType.equals("verifyVacation")) {
			return this.verifyVacation();
		}
		if(uType.equals("modifyVacation")) {
			return this.modifyVacation();
		}
		return false;
	}
	/**
	 * ÐÞ¸ÄÇë¼Ù
	 * @return
	 * @throws Exception 
	 */
	public boolean modifyVacation() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("update cx01"
				+ "	set acx102=?,"
				+ "		acx105=?"
				+ "	where"
				+ "		acx101=?");
		String acx102 = null, acx105 =null;
		if(this.isNotNull(this.get("acx102")))
			acx102 = java.net.URLDecoder.decode(this.get("acx102").toString() , "UTF-8");
		if(this.isNotNull(this.get("acx105")))
			acx105 = java.net.URLDecoder.decode(this.get("acx105").toString() , "UTF-8");
		Object[] args = {
				acx102, acx105
		};
		return this.batchUpdate(sb.toString(), args, this.getIdList("acx101"));
	}
	/***
	 * ÉóºËÇë¼Ù
	 * @return
	 * @throws Exception 
	 */
	public boolean verifyVacation() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("update cx01"
				+ "	set aak101=?,acx106=CURRENT_TIMESTAMP, acx105=CURRENT_TIMESTAMP,"
				+ "		acx107='2'"
				+ "	where"
				+ "		acx101=?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("acx101"));
		Object aak101 = this.get("aak101");
		return this.batchUpdate(sb.toString(), aak101, paramList.toArray());
	}
	 
	public List<Map<String, String>> queryForRows() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select cx.acx101, cx.acx102, cx.acx103, cx.acx103, dateDiff(cx.acx105, cx.acx103) datediff, cx.acx105, s.fvalue cnacx107, cx.acx107,"
				+ "	j.aaj103, j.aaj102"
				+ "	from"
				+ "		cx01 cx, aj01 j, syscode s"
				+ " where"
				+ "		s.fname='acx107' and cx.acx107=s.fcode"
				+ "		and j.aaj101 = cx.aaj101");
		Object bacx103 = this.get("qbacx103");
		Object eacx103 = this.get("qeacx103");
		Object aaj103 = this.get("qaaj103");
		Object acx107 = this.get("qacx107");
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(bacx103)) {
			sb.append(" and cx.acx103 >= ?");
			paramList.add(bacx103);
		}
		if(this.isNotNull(eacx103)) {
			sb.append(" and cx.acx103 <= ?");
			paramList.add(eacx103);
		}
		if(this.isNotNull(aaj103)) {
			sb.append(" and j.aaj103 like ?");
			paramList.add(aaj103);
		}
		if(this.isNotNull(acx107)) {
			sb.append(" and cx.acx107 like ?");
			paramList.add(acx107);
		}
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	 
	public Map<String, String> findById() throws Exception {
		//ID
		Object acx101 = this.get("acx101");
		Object acx107 = this.get("acx107");
		boolean checked = this.isNotNull(acx107);
		StringBuilder sb = new StringBuilder();
		sb.append("select j.aaj101, j.aaj102, j.aaj103,"
				+ "				cx.acx101, cx.acx102, cx.acx103, dateDiff(cx.acx104, cx.acx103) datediff, cx.acx104, cx.acx105, cx.acx106, cx.acx107, s.fvalue cnacx107");
				if(!checked) {
					sb.append("	,k.aak103");
				}
				sb.append("		from cx01 cx, aj01 j, syscode s,ak01 k"
						+ "		where"
						+ "			s.fname='acx107' and s.fcode = cx.acx107"
						+ "			and cx.aaj101 = j.aaj101"
						+ "		");
				if(!checked) {
					sb.append("		and cx.aak101 = k.aak101");
				}
				sb.append("			and cx.acx101 = ?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(acx101);
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
}
