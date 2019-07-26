package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Wbx002ServicesImpl extends JdbcServicesSupport {
	/****
	 * 护工操作服务
	 */
	
	public boolean update(String uType) throws Exception {
		if(uType.equals("deleteById")) {
			return this.deleteById();
		}
		else if(uType.equals("batchDeleteEmp")) {
			return this.batchDelete();
		}
		else if(uType.equals("addEmp")) {
			return this.addEmp();
		}
		else {
			throw new Exception("使用了该类中没有定义的方法，其名称为" + uType);
		}
	}
	
	public boolean batchDelete()throws Exception
	{
		//1.定义SQL语句
		String sql="delete from aj01 where aaj101=?";
		//2.获取页面idlist数组
		String idlist[]=this.getIdList("idlist");
		//3.执行
		return this.batchUpdate(sql, idlist);
	}

	public boolean deleteById() throws Exception {
		//定义查询语句
		StringBuilder sb = new StringBuilder();
		sb.append("delete from aj01 where aaj101 = ?");
		return this.executeUpdate(sb.toString(), this.get("aaj101")) > 0;
	}
	

	public boolean addEmp() throws Exception {
		String aaj102 = Tools.getEmpNumber();
		this.put("aaj102", aaj102);
		
		StringBuilder sb = new StringBuilder();
		sb.append("insert into aj01(aau101, aaj102, aaj103, aaj104, aaj105,"
				+ "                 aaj106, aaj107, aaj108, aaj109)"
				+ "			   values(?,?,?,?,?,"
				+ "					  ?,CURRENT_TIMESTAMP,?,?)");
		Object[] args= {
				this.getAau101(this.get("aaj102")),
				this.get("aaj102"),
				this.get("aaj103"),
				this.get("aaj104"),
				this.get("aaj105"),
				this.get("aaj106"),
				this.get("aaj108"),
				this.get("aaj109")
		};
		return this.executeUpdate(sb.toString(), args) > 0;
	}

	public Object getAau101(Object aaj102) throws Exception{
		StringBuilder sb2 = new StringBuilder();
		sb2.append("insert into au01(aau102, aau103, aau104)"
				+ "		values(?,?,?)");
		Object[] args2 = {this.get("aaj102"), Tools.getMd5("0000"), 3};
		this.executeUpdate(sb2.toString(), args2);
		return Tools.getSequence("aau101");
	}

	public List<Map<String, String>> queryForRows() throws Exception {
		// TODO Auto-generated method stub
		Object aaj103 = this.get("qaaj103");
		Object aaj102 = this.get("qaaj102");
		Object aaj104 = this.get("qaaj104");
		Object aaj109 = this.get("qaaj109");
		Object baaj105 = this.get("qaaj105");
		Object eaaj105 = this.get("eaaj105");
		Object aaj108 = this.get("qaaj108");
		Object aaj106 = this.get("qaaj106");
		
		StringBuilder sql=new StringBuilder()
  				.append("select x.aaj101,x.aaj102,x.aaj103,x.aaj105,a.fvalue cnaaj104,")
  				.append("       x.aaj108,b.fvalue cnaaj109")
  				.append("  from syscode a,syscode b, aj01 x")
  				.append(" where x.aaj104=a.fcode and a.fname='aaj104'")
  				.append("   and x.aaj109=b.fcode and b.fname='aaj109'");
		//参数列表
		List<Object> list= new ArrayList<Object>();
		if(this.isNotNull(aaj103)) {
			sql.append(" and x.aaj103 like ?");
			list.add("%"+aaj103 + "%");
		}
		if(this.isNotNull(aaj102)) {
			sql.append(" and x.aaj102 like ?");
			list.add("%"+aaj102 + "%");
		}
		if(this.isNotNull(aaj104)) {
			sql.append(" and x.aaj104 = ?");
			list.add(aaj104);
		}
		if(this.isNotNull(aaj109)) {
			sql.append(" and x.aaj109 = ?");
			list.add(aaj109);
		}
		if(this.isNotNull(baaj105)) {
			sql.append(" and x.aaj105 >= ?");
			list.add(baaj105);
		}
		if(this.isNotNull(eaaj105)) {
			sql.append(" and x.aaj103 <= ?");
			list.add(eaaj105);
		}
		if(this.isNotNull(aaj108)) {
			sql.append(" and x.aaj108 like ?");
			list.add("%"+aaj108 + "%");
		}
		if(this.isNotNull(aaj106)) {
			sql.append(" and x.aaj106 like ?");
			list.add("%"+aaj106 + "%");
		}
		sql.append(" order by x.aaj101");
		System.out.println(sql + "$$$$$$$$$$");
		return this.queryForList(sql.toString(), list.toArray());
	}
}
