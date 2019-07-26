package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx003ServicesImpl extends JdbcServicesSupport {
	/***
	 ******************入住人服务***********************
	 */
	
	public List<Map<String, String>> queryForRows() throws Exception {
		//还原查询条件
		Object aab103=this.get("qaab103");//姓名
		Object aab102=this.get("qaab102");//编号
		Object aaj103=this.get("qaaj103");//护理员
		Object aab110=this.get("qaab110");//联系电话
		Object aab111=this.get("qaab111");//入住状态
		Object baac103=this.get("baac103");//入院开始日期
		Object aab104=this.get("qaab104");//性别
		Object aad102=this.get("qaad102");//亲属
		Object aai104=this.get("qaai104");//房间号
		Object aab109=this.get("qaab109");//政治面貌
		Object aab114=this.get("qaab114");//护理级别
		Object eaac103=this.get("eaac103");//入院结束日期
		
		//创建sql
		StringBuilder sb = new StringBuilder();
		sb.append("select b.aab101,b.aab102,b.aab103,s1.fvalue cnaab104,s2.fvalue cnaab114,b.aab110,"
				+ "		 s4.fvalue cnaab111,b.aab108,c.aac103,i.aai102,i.aai104,i.aai105,s3.fvalue cnaab109"
				+ "			from"
				+ "			ab01 b, ac01 c, ai01 i, aj01 j, ad01 d, syscode s1, syscode s2, syscode s3,syscode s4"
				+ "			where true"
				+ "			and b.aab104 = s1.fcode and s1.fname = 'aab104'"
				+ "			and b.aab114 = s2.fcode and s2.fname = 'aab114'"
				+ "			and b.aab109 = s3.fcode and s3.fname = 'aab109'"
				+ "         and b.aab111 = s4.fcode and s4.fname = 'aab111'"
				+ "			and	b.aab101 = d.aab101"
				+ "			and b.aab101 = i.aab101"
				+ "			and b.aab101 = c.aab101"
				+ "			and i.aaj101 = j.aaj101");
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(aab103)) {
			sb.append("			and b.aab103 like ?");
			paramList.add("%"+aab103+"%");
		}
		if(this.isNotNull(aab102)) {
			sb.append("			and b.aab102 like ?");
			paramList.add("%"+ aab102+"%");
		}
		if(this.isNotNull(aab110)) {
			sb.append("			and b.aab110 like ?");
			paramList.add("%"+aab110+"%");
		}
		if(this.isNotNull(aab111)) {
			sb.append("			and b.aab111 =    ?");
			paramList.add(aab111);
		}
		if(this.isNotNull(baac103)) {
			sb.append("			and c.aac103 >=   ?");
			paramList.add(baac103);
		}
		if(this.isNotNull(aab104)) {
			sb.append("			and b.aab104 =    ?");
			paramList.add(aab104);
		}
		if(this.isNotNull(aad102)) {
			sb.append("			and d.aad102 like ?");
			paramList.add("%"+aad102+"%");
		}
		if(this.isNotNull(aai104)) {
			sb.append("			and i.aai104 like ?");
			paramList.add("%"+aai104+"%");
		}
		if(this.isNotNull(aab109)) {
			sb.append("			and b.aab109 =    ?");
			paramList.add(aab109);
		}
		if(this.isNotNull(aab114)) {
			sb.append("			and b.aab114 =    ?");
			paramList.add(aab114);
		}
		if(this.isNotNull(eaac103)) {
			sb.append("			and c.aac103 <=   ?");
			paramList.add(eaac103);
		}
		if(this.isNotNull(aaj103)) {
			sb.append("			and j.aaj103 like ?");
			paramList.add("%"+aaj103+"%");
		}
		sb.append(" order by b.aab102");
		System.out.println(sb);
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	public List<Map<String, String>> queryForColumns() throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("select distinct c.aac101, c.aac102, c.aac104,"
				+ "	b.aab101, b.aab102, b.aab103, s1.fvalue cnaab104, s2.fvalue cnaab114, b.aab110, b.aab108,"
				+ "	s5.fvalue cnaac104"
				+ "	from"
				+ "		ab01 b, ac01 c, syscode s1, syscode s2, ad01 d, syscode s5"
				+ "		where"
				+ "			s1.fcode=b.aab104 and s1.fname='aab104'"
				+ "			and s2.fcode=b.aab114 and s2.fname='aab114'"
				+ "			and c.aac104 = s5.fcode and s5.fname = 'aac104'"
				+ "			and b.aab111='1'"
				+ "			and b.aab101 = c.aab101");
		Object aab103 = this.get("qaab103");
		Object aac104 = this.get("qaac104");
		Object aab110 = this.get("qaab110");
		Object baac103 = this.get("baac103");
		
		Object aab104 = this.get("qaab104");
		Object aad102 = this.get("qaad102");
		Object aab114 = this.get("qaab114");
		Object eaac103 = this.get("eaac103");
		List<Object> paramList = new ArrayList<>();
		
		if(this.isNotNull(aad102)) {
			sb.append("	and d.aab101 = b.aab101");
			sb.append("	and d.aad102 like ?");
			paramList.add(aad102);
		}
		if(this.isNotNull(aab103)) {
			sb.append("	and b.aab103 like ?");
			paramList.add(aab103);
		}
		if(this.isNotNull(aac104)) {
			sb.append("	and c.aac104 = ?");
			paramList.add(aac104);
		}
		if(this.isNotNull(aab110)) {
			sb.append("	and b.aab110 like ?");
			paramList.add(aab110);
		}
		if(this.isNotNull(baac103)) {
			sb.append("	and c.aac103 >= ?");
			paramList.add(baac103);
		}
		if(this.isNotNull(eaac103)) {
			sb.append("	and c.aac103 <= ?");
			paramList.add(eaac103);
		}
		if(this.isNotNull(aab104)) {
			sb.append("	and b.aab104 = ?");
			paramList.add(aab104);
		}
		if(this.isNotNull(aab114)) {
			sb.append("	and b.aab114 = ?");
			paramList.add(aab114);
		}
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	public boolean update(String uType) throws Exception {
		// TODO Auto-generated method stub
		if(uType.equals("delAppointmentById")) {
			return this.delAppointmentById();
		}
		else if(uType.equals("modifyAppointment")) {
			return this.modifyAppointment();
		}
		else if(uType.equals("modifyAppointment2")) {
			return this.modifyAppointment2();
		}
		else {
			throw new Exception("使用了未定义的方法");
		}
	}
	/***
	 * 拒收预约
	 * @return
	 */
	private boolean modifyAppointment2() throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("update ac01"
				+ "	set aac104 = '3'"
				+ "	where aab101=?");
		Object[] args = {this.get("aab101")};
		
		return this.executeUpdate(sb.toString(), args) > 0;
	}

	/**
	 * 批量预约转入住
	 * @return
	 * @throws Exception 
	 */
	private boolean modifyAppointment() throws Exception {
		String[] idlist = this.getIdList("idlist");
		StringBuilder sb1 = new StringBuilder();
		sb1.append("update ac01"
				+ "	set aac104='2', aac103=CURRENT_TIMESTAMP"
				+ "	where aab101=?");
		StringBuilder sb2 = new StringBuilder();
		sb2.append("update ab01"
				+ "	set aab111='2'"
				+ "	where aab101=?");
		StringBuilder sb3 = new StringBuilder();
		sb3.append("");
		
		this.apppendSql(sb1.toString(), idlist);
		this.apppendSql(sb2.toString(), idlist);
		
		return this.executeTransaction();
	}

	private boolean delAppointmentById() throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("delete from ab01 where aab102 = ?");
		return this.executeUpdate(sb.toString(), this.get("aab102")) > 0;
	}
	
	@Override
	public Map<String, String> findById() throws Exception {
		Object aab101 = this.get("aab101");
		StringBuilder sb = new StringBuilder();
		sb.append("select b.aab101,b.aab102, b.aab103, b.aab104, s.fvalue cnaab104,"
				+ "		  i.aai102, i.aai104, i.aai105,"
				+ "		  j.aaj102, j.aaj103"
				+ "	from ab01 b, ai01 i, aj01 j, syscode s"
				+ "	where "
				+ "	s.fcode=b.aab104 and s.fname='aab104'"
				+ "	and i.aaj101 = j.aaj101"
				+ "	and   i.aab101 = b.aab101"
				+ "	and   b.aab101 = ?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(aab101);
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
}
