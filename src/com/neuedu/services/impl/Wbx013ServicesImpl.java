package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Wbx013ServicesImpl extends JdbcServicesSupport {
	@Override
	public List<Map<String, String>> queryForRows() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select f.bbf101, f.bbf102, f.bbf103, f.bbf104, f.bbf105, f.bbf106, f.bbf107"
				+ "		,s1.fvalue cnbbf103, s2.fvalue cnbbf104"
				+ "		,b.aab103"
				+ "		,k.aak103"
				+ "	from syscode s1, syscode s2, ab01 b, ak01 k, bf01 f"
				+ "	where"
				+ "		s1.fname='bbf103' and s1.fcode = f.bbf103"
				+ "		and s2.fname = 'bbf104' and s2.fcode = bbf104"
				+ "		and k.aak101 = f.aak101"
				+ "		and b.aab101 = f.aab101");
		
		List<Object> paramList = new ArrayList<>();
		Object aab103 = this.get("aab103");
		Object bbf103 = this.get("bbf103");
		Object bbf104 = this.get("bbf104");
		Object bbbf107 = this.get("bbbf107");
		Object ebbf107 = this.get("ebbf107");
		
		if(this.isNotNull(aab103)) {
			sb.append("	and b.aab103 like ?");
			paramList.add("%"+aab103+"%");
		}
		if(this.isNotNull(bbf103)) {
			sb.append("	and f.bbf103 = ?");
			paramList.add(bbf103);
		}
		if(this.isNotNull(bbf104)) {
			sb.append("	and f.bbf104 = ?");
			paramList.add(bbf103);
		}
		if(this.isNotNull(bbbf107)) {
			sb.append("	and f.bbf107 >= ?");
			paramList.add(bbbf107);
		}
		if(this.isNotNull(ebbf107)) {
			sb.append("	and f.bbf107 <= ?");
			paramList.add(ebbf107);
		}
		System.out.println(sb);
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	@Override
	public Map<String, String> findById() throws Exception {
		return null;
	}
	
	@Override
	public boolean update(String uType) throws Exception {
		if(uType.equals("addMonthFee")) {
			return this.addMonthFee();
		}
		return false;
	}
	
	//追加月费用
	private boolean addMonthFee() throws Exception {
		String number = Tools.getEmpNumber();
		StringBuilder sb = new StringBuilder();
		sb.append("insert into bf01(aab101, ");
		
		return false;
	}
}
