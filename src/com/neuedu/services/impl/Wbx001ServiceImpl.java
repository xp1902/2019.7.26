package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class Wbx001ServiceImpl extends JdbcServicesSupport{
	/***
	 * ��λ��������********************************
	 */
	
	public boolean update(String uType) throws Exception{
		if(uType.equals("modifyInfo")) {
			return this.modifyInfo();
		}
		if(uType.equals("modifyInfo2")) {
			return this.modifyInfo2();
		}
		if(uType.equals("addBed")) {
			return this.addBed();
		}
		return false;
	}
	
	/***
	 * ���һ����λ
	 * @return
	 */
	private boolean addBed() {
		return false;
	}
	/***
	 * �޸Ļ���
	 * @return
	 * @throws Exception 
	 */
	private boolean modifyInfo2() throws Exception {
		Object aaj101 = this.get("aaj101");
		Object aai101 = this.get("aai101");
		StringBuilder sb = new StringBuilder();
		sb.append("update ai01"
				+ "	set"
				+ "		aaj101=?"
				+ "	where"
				+ "		aai101=?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(aaj101);
		paramList.add(aai101);
		
		return this.executeUpdate(sb.toString(), paramList.toArray()) > 0;
	}

	/**
	 * ��λ���
	 * @return
	 */
	public boolean modifyInfo() throws Exception{
		Object aab101 = this.get("aab101");//��ס����ˮ��
		Object aai101 = this.get("aai101");//Ҫ�����Ŀ�Ĵ�λ��ˮ��
		//����Ŀ�ķ���Ļ�ʿ����ס״̬Ϊ2:��ס
		StringBuilder sb1 = new StringBuilder();
		sb1.append("update ai01"
				+ "	set aaj101 = (select a.aaj101 from (select aaj101 from ai01 where aab101 = ?) a), "
				+ "		aai106 = '2'"
				+ " where aai101 = ?");		
		List<Object> paramList1 = new ArrayList<>();
		paramList1.add(aab101);
		paramList1.add(aai101);
		//������ס����ˮŶ������ԭʼ����Ļ�ʿΪ��,��ס״̬Ϊ1������
		StringBuilder sb2 = new StringBuilder();
		sb2 .append("update ai01"
				+ "	set aab101 = NULL, "
				+ "	aai106 = '1'"
				+ " where aab101 = ?");
		List<Object> paramList2 = new ArrayList<>();
		paramList2.add(aab101);
		//����Ŀ�ķ������ס��Ϊ��ǰ��ס����ˮ��
		StringBuilder sb4 = new StringBuilder();
		sb4.append("update ai01"
				+ "	set aab101 = ?"
				+ "	where aai101 = ?");
		List<Object> paramList4 = new ArrayList<>();
		paramList4.add(aab101);
		paramList4.add(aai101);
		//������ס��״̬Ϊ��ס
		StringBuilder sb3 = new StringBuilder();
		sb3.append("update ab01"
				+ "	set aab111 = '2'"
				+ "	where aab101 = ?");
		List<Object> paramList3 = new ArrayList<>();
		paramList3.add(aab101);
		
		//����ԤԼ״̬Ϊ����ס
		StringBuilder sb5 = new StringBuilder();
		sb5.append("update ac01 set aac104 = '2' where aab101 = ?");
		Object[] args= {this.get("aab101")};
		
		this.apppendSql(sb1.toString(), paramList1.toArray());
		this.apppendSql(sb2.toString(), paramList2.toArray());
		this.apppendSql(sb3.toString(), paramList3.toArray());
		this.apppendSql(sb4.toString(), paramList4.toArray());
		this.apppendSql(sb5.toString(), args);
		return this.executeTransaction();
	}

	public List<Map<String, String>> queryForRows() throws Exception{
		StringBuilder sb = new StringBuilder();
			sb.append("select distinct(x.aai102)")
				.append(" from ai01 x");
			return queryForList(sb.toString());
	}
	
	public List<Map<String, String>> queryForColumns() throws Exception{
		Object aai102 = this.get("qaai102");
		if(aai102 == null) {
			aai102 = this.get("aai102");
		}
		Object aai103 = this.get("qaai103");
		Object aai104 = this.get("qaai104");
		Object aai105 = this.get("qaai105");
		Object aai106 = this.get("qaai106");
		Object aab103 = this.get("qaab103");
		StringBuilder sb = new StringBuilder();
		sb.append("select distinct"
				+ "  x.aai101"
				+ " ,x.aai102"
				+ " ,x.aai103"
				+ " ,x.aai104"
				+ " ,x.aai105"
				+ " ,x.aai106"
				+ " ,x.aab101"
				+ "	,x.aaj101"
				+ " from ai01 x, ab01 b"
				+ " where true");
		List<Object> paramList = new ArrayList<>();
		if(this.isNotNull(aai102)) {
			sb.append(" and x.aai102=?");
			paramList.add(aai102);
		}if(this.isNotNull(aai103)) {
			sb.append(" and x.aai103=?");
			paramList.add(aai103);
		}if(this.isNotNull(aai104)) {
			sb.append(" and x.aai104=?");
			paramList.add(aai104);
		}if(this.isNotNull(aai105)) {
			sb.append(" and x.aai105=?");
			paramList.add(aai105);
		}if(this.isNotNull(aai106)) {
			sb.append(" and x.aai106=?");
			paramList.add(aai106);
		}if(this.isNotNull(aab103)) {
			sb.append(" and b.aab103 = ?");
			sb.append(" and b.aab101 = x.aab101");
			paramList.add("%"+aab103+"%");
		}
		sb.append(" order by x.aai101");
		return queryForList(sb.toString(), paramList.toArray());
	}
	
	/**
	 * ���ݴ�λid������ס����Ϣ�ͻ�����Ϣ
	 */
	@Override
	public Map<String, String> findById() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select a.aab102, a.aab103, s1.fvalue cnaab104, s2.fvalue cnaab107, a.aab110, s3.fvalue cnaab109,"
				//        ����      �Ա�                ����                ��ϵ�绰   ������ò
				+ "		  b.aaj102, aaj103"
				//			�������      ��������
				+ "		  from ab01 a, aj01 b, ai01 c, syscode s1, syscode s2, syscode s3"
				+ "		  where "
				+ "			s1.fcode = a.aab104 and s1.fname='aab104'"
				+ "			and s2.fcode = a.aab107 and s2.fname='aab107'"
				+ "			and s3.fcode = a.aab109 and s3.fname='aab109'"
				+ "			and c.aai101= ?"
				+ "			and c.aaj101 = b.aaj101"
				+ "			and c.aab101 = a.aab101");
		Object aai101 = this.get("aai101");
		List<Object> paramList = new ArrayList<>();
		paramList.add(aai101);
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
}
