package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Wbx011ServicesImpl extends JdbcServicesSupport {

	@Override
	public boolean update(String uType) throws Exception {
		if(uType.equals("addIn")) {
			return this.addIn();
		}
		return false;
	}

	/***
	 * 添加入账
	 * @return
	 * @throws Exception 
	 */
	private boolean addIn() throws Exception {
		Object aap101 = this.get("aap101");
		Object aak101 = this.get("aak101");
		if(!this.isNotNull(aak101))
			return false;
		
		if(aap101.equals("undefined")) {
			StringBuilder sb2 = new StringBuilder();
			sb2.append("insert into ap01(aap102, aap103, pcode, code, name, aap104, aap105)"
					+ "	values(?,?,?,?,?,?,?)");

			String aap104 = null;
			if(this.isNotNull(this.get("aap104")))
				aap104 = java.net.URLDecoder.decode(this.get("aap104").toString() , "UTF-8");
			String aaq105 = null;
			if(this.isNotNull(this.get("aaq105")))
				aaq105 = java.net.URLDecoder.decode(this.get("aaq105").toString() , "UTF-8");
			String name = null;
			if(this.isNotNull(this.get("name")))
				name = java.net.URLDecoder.decode(this.get("name").toString() , "UTF-8");
			Object[] args2 = {
					this.get("aaq104"),
					aaq105,//备注，入账备注当做物品备注
					this.get("pcode"),
					Tools.getEmpNumber(),
					name,
					aap104,
					this.get("aap105")
			};
			this.executeUpdate(sb2.toString(), args2);
			aap101 = Tools.getSequence("aap101");
		}
		else {
			StringBuilder sb2 = new StringBuilder();
			sb2.append("update ap01 set aap102 = aap102 + ? "
					+ "where aap101 = ?");
			Object[] args2 = {this.get("aaq104"),
					this.get("aap101")};
			this.executeUpdate(sb2.toString(), args2);
		}
		
		String aaq102 = Tools.getEmpNumber();
		StringBuilder sb = new StringBuilder();
		sb.append("insert into aq01(aaq102,aap101,aak101,aaq103,aaq104,aaq105)"
				+"	values(?,?,?,CURRENT_TIMESTAMP,?,?)");
		String aaq105 = null;
		if(this.isNotNull(this.get("aaq105")))
			aaq105 = java.net.URLDecoder.decode(this.get("aaq105").toString() , "UTF-8");
		Object[] args = {
				aaq102,
				aap101,
				aak101,
				this.get("aaq104"),
				aaq105
		};
		return this.executeUpdate(sb.toString(), args) > 0;
	}
	
	 
	public List<Map<String, String>> queryForRows()  throws Exception{
		StringBuilder sb = new StringBuilder();
		sb.append("select q.aaq101, q.aaq102, q.aaq103, q.aaq104, q.aaq105"
				+ "		 ,p.name"
				+ "		 ,k.aak103"
				+ "		from aq01 q, ak01 k ,ap01 p"
				+ "		where"
				+ "		q.aap101 = p.aap101"
				+ "		and q.aak101 = k.aak101");
		List<Object> paramList = new ArrayList<>();
		
		Object aaq102 = this.get("aaq102");
		Object name = this.get("name");

		Object aak103 = this.get("aak103");
		Object baaq103 = this.get("baaq103");
		Object eaaq103 = this.get("eaaq103");
		
		if(this.isNotNull(aaq102)) {
			sb.append("	and q.aaq102 like ?");
			paramList.add(aaq102);
		}
		if(this.isNotNull(name)) {
			sb.append("	and p.name like ?");
			paramList.add(name);
		}
		if(this.isNotNull(aak103)) {
			sb.append("	and k.aak103 like ?");
			paramList.add(name);
		}
		if(this.isNotNull(baaq103)) {
			sb.append("	and q.aaq103 >= ?");
			paramList.add(baaq103);
		}
		if(this.isNotNull(eaaq103)) {
			sb.append("	and q.aaq103 <= ?");
			paramList.add(eaaq103);
		}
		return this.queryForList(sb.toString(), paramList.toArray());
	}
	
	 
	public Map<String, String> findById() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select q.aaq102, q.aaq103, q.aaq104, q.aaq105"
				+ "		 ,p.name"
				+ "		 ,k.aak103"
				+ "		from aq01 q, ak01 k ,ap01 p"
				+ "		where"
				+ "		q.aap101 = p.aap101"
				+ "		and q.aak101 = k.aak101"
				+ "		and q.aaq101 = ?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("aaq101"));
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
}
