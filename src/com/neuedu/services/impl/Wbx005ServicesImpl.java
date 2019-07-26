package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx005ServicesImpl extends JdbcServicesSupport {
	//入住人请假模块处理
	public List<Map<String, String>> queryForRows() throws Exception {
		Object baal103 = this.get("qbaal103");
		Object eaal103 = this.get("qeaal103");
		Object aab103  = this.get("qaab103");
		Object aal107  = this.get("qaal107");
		//创建sql语句
		
		StringBuilder sb = new StringBuilder();
		sb.append("		select l.aal107,b.aab101, b.aab103, l.aal101, l.aal102, l.aal103, l.aal104, s.fvalue cnaal107,"
				+ "		i.aai102, i.aai104, datediff(l.aal104, l.aal103) dateDiff"
				+ "		from ab01 b, al01 l, ai01 i, syscode s"
				+ "		where s.fname = 'aal107' and s.fcode = l.aal107"
				+ "		and l.aab101 = b.aab101"
				+ "		and i.aab101 = b.aab101");
		
		//参数列表
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(aab103)) {
			sb.append("		and b.aab103 like ?");
			paramList.add("%"+ aab103 +"%");
		}
		if(this.isNotNull(baal103)) {
			sb.append("		and l.aal103 >= ?");
			paramList.add(baal103);
		}
		if(this.isNotNull(eaal103)) {
			sb.append("	 	and l.aal103 <= ?");
			paramList.add(eaal103);
		}
		if(this.isNotNull(aal107)) {
			sb.append("		and l.aal107 = ?");
			paramList.add(aal107);
		}
		
		return this.queryForList(sb.toString(), paramList.toArray());
	}

	/***
	 * 数据更新方法---------请假审核
	 */
	public boolean update(String uType) throws Exception{
		if(uType.equals("verifyVacation")) {
			return this.verifyVacation();
		}
		if(uType.equals("modifyVacation")) {
			return this.modifyVacation();
		}
		return false;
	}
	
	/***
	 * 修改请假申请
	 * @return
	 * @throws Exception 
	 */
	private boolean modifyVacation() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("update al01"
				+ "	set aal102=?,"
				+ "		aal105=?,"
				+ "		aal106=?"
				+ "	where"
				+ "	aal101=?");
				String aal102 = null, aal105 =null;
				if(this.isNotNull(this.get("aal102")))
					aal102 = java.net.URLDecoder.decode(this.get("aal102").toString() , "UTF-8");
				if(this.isNotNull(this.get("aal105")))
					aal105 = java.net.URLDecoder.decode(this.get("aal105").toString() , "UTF-8");
		Object[] args= {
				aal102,
				aal105,
				this.get("aal106")
		};
		return this.batchUpdate(sb.toString(), args, this.get("aal101"));
	}

	public boolean verifyVacation() throws Exception{
		Object aal101 = this.get("aal101");
		Object aak101 = this.get("aak101");
		StringBuilder sb = new StringBuilder();
		sb.append("update al01"
				+ "		set"
				+ "			aak101 = ?, aal108=CURRENT_TIMESTAMP,"
				+ "			aal107 = '2'"
				+ "			where"
				+ "				aal101 = ?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(aal101);
		return this.batchUpdate(sb.toString(), aak101, paramList.toArray());
	}


	/*
	 * 根据请假id检索请假信息
	 */
	@Override
	public Map<String, String> findById() throws Exception {
		//请假ID
		Object aal101 = this.get("aal101");
		Object aal107 = this.get("aal107");
		boolean checked = this.isNotNull(aal107);
		StringBuilder sb = new StringBuilder();
		sb.append("select b.aab101, b.aab102, b.aab103, "
				+ "			 			i.aai104,"
				+ "			 			l.aal101, l.aal102, l.aal103, l.aal104, l.aal105, l.aal106, l.aal107, s.fvalue cnaal107, l.aal108");
				if(!checked) {
					sb.append("			,k.aak103");
				}
				sb.append("			 	from ab01 b, ai01 i, ak01 k, al01 l, syscode s"
				+ "			 			where"
				+ "							s.fname = 'aal107' and s.fcode = l.aal107"
				+ "							and l.aab101 = b.aab101");
				if(!checked) {
					sb.append("				and l.aak101 = k.aak101");
				}
				sb.append("					and l.aab101 = i.aab101"
				+ "							and l.aal101 = ?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(aal101);
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
}
