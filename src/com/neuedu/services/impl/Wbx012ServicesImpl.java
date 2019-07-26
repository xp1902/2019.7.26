package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.neusoft.services.JdbcServicesSupport;

public class Wbx012ServicesImpl extends JdbcServicesSupport {
	@Override
	public boolean update(String uType) throws Exception {
		if(uType.equals("verifyOuts")) {
			return this.verifyOuts();
		}
		return super.update(uType);
	}

	@Override
	public Map<String, String> findById() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select r.aar101, r.aar102, r.aar103, r.aar104, r.aar105"
				+ "	from ar01 r, syscode s"
				+ "	where"
				+ "		s.fname='aar103' and s.fcode = r.aar103"
				+ "		andr.aar101 =?");
		Object[] args = {
				this.get("aar101")
		};
		return this.queryForMap(sb.toString(), args);
	}
	
	@Override
	public List<Map<String, String>> queryForRows() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select r.aar101, r.aar102, s.fvalue cnaar103, r.aar103, r.aar104, r.aar105"
				+ "		,j.aaj103"
				+ "	from ar01 r, syscode s, aj01 j"
				+ "	where"
				+ "		s.fname='aar103' and s.fcode = r.aar103"
				+ "		and r.aaj101 = j.aaj101");
		List<Object> paramList = new ArrayList<>();
		Object aaj103 = this.get("aaj103");
		Object aar103 = this.get("aar103");
		Object baar102 = this.get("baar102");
		Object eaar102 = this.get("eaar102");
		
		if(this.isNotNull(aaj103)) {
			sb.append("	and j.aaj103 like ?");
			paramList.add("%"+aaj103+"%");
		}
		if(this.isNotNull(aar103)) {
			sb.append("	and r.aar103 = ?");
			paramList.add(aar103);
		}
		if(this.isNotNull(baar102)) {
			sb.append("	and r.aar102 >= ?");
			paramList.add(baar102);
		}
		if(this.isNotNull(eaar102)) {
			sb.append("	and r.aar102 <= ?");
			paramList.add(eaar102);
		}
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	private boolean verifyOuts() throws Exception {
		Object aak101 = this.get("aak101");
		if(!this.isNotNull(aak101)) {
			return false;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("update ar01"
				+ "	set");
		if(this.isNotNull(this.get("check")))
		{
			sb.append("		aar103 = '2', aak101 =?, aar104=CURRENT_TIMESTAMP");
			sb.append("	where"
					+ "		aar101 = ?");
			Object[] args = {aak101, this.get("aar101")};
			this.apppendSql(sb.toString(), args);
			List<Object> aap101 = JSON.parseArray((String) this.get("aap101"));
			List<Object> aas102 = JSON.parseArray((String) this.get("aas102"));
			if(aap101.size() != aas102.size())
				return false;
			for(int i = 0; i < aap101.size(); i ++) {
				StringBuilder sb2 = new StringBuilder();
				sb2.append("update ap01 set aap102 = aap102-? where aap101 = ?");
				Object[] arg2 = {aas102.get(i), aap101.get(i)};
				this.apppendSql(sb2.toString(),arg2);
			}
		}
		else {
			sb.append("		aar103 = '3', aak101 =?, aar104=CURRENT_TIMESTAMP");
			sb.append("	where"
					+ "		aar101 = ?");
			Object[] args = {aak101, this.get("aar101")};
			this.apppendSql(sb.toString(), args);
		}
		
		return this.executeTransaction();
	}
}
