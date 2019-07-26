package com.neuedu.services.impl;

import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx008ServicesImpl extends JdbcServicesSupport {

	/***
	 * 预约查询入住人信息
	 */
	@Override
	public Map<String, String> findById() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select a.aab101, a.aab102, a.aab103, s1.fvalue cnaab104, s2.fvalue cnaab107, a.aab110, s3.fvalue cnaab109"
				+ "	from ab01 a, syscode s1, syscode s2, syscode s3"
				+ "	where"
				+ "		s1.fcode=a.aab104 and s1.fname='aab104'"
				+ "		and s2.fcode=a.aab107 and s2.fname='aab107'"
				+ "		and s3.fcode=a.aab109 and s3.fname='aab109'"
				+ "		and a.aab101 = ?");
		Object[] args = {this.get("aab101")};
		return this.queryForMap(sb.toString(), args);
	}
}
