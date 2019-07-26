package com.neuedu.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Wbx010ServicesImpl extends JdbcServicesSupport {
	 
	public List<Map<String, String>> queryForColumns() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select item.name, item.code, item.pcode, item.aap101, item.aap102, item.aap103, item.aap104, item.aap105"
				+ "	from ap01 item"
				+ "	where item.pcode=?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("pcode"));
		return this.queryForList(sb.toString(),  paramList);
	}
	 
	public List<Map<String, String>> queryForRows() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select item.aap101, item.code, item.pcode, item.pcode, item.name, item.aap102, item.aap103, item.aap104, item.aap105"
				+ "	from ap01 item");
		
		return this.queryForList(sb.toString());
	}
	 
	public Map<String, String> findById() throws Exception {
		StringBuilder sb = new StringBuilder();
		sb.append("select item.name, item.code, item.pcode, item.aap101, item.aap102, item.aap103, item.aap104, item.aap105"
				+ "	from ap01 item"
				+ "	where item.aap101=?");
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("aap101"));
		return this.queryForMap(sb.toString(), paramList.toArray());
	}
	
	 
	public boolean update(String uType) throws Exception {
		if(uType.equals("delItem")) {
			return this.delItem();
		}
		if(uType.equals("modifyItem")) {
			return this.modifyItem();
		}
		return false;
	}
	/***
	 * 修改一个物品项
	 * @return
	 */
	private boolean modifyItem() throws Exception{
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append("update ap01"
				+ "	set aap102 = ?,"
				+ "		aap103 = ?,"
				+ "		name = ?,"
				+ "		aap104 = ?,"
				+ "		aap105 = ?"
				+ "	where"
				+ "		aap101 = ?");
		String aap103 = null, name = null, aap104 = null;
		if(this.isNotNull(this.get("aap103")))
			aap103 = java.net.URLDecoder.decode(this.get("aap103").toString() , "UTF-8");

		if(this.isNotNull(this.get("aap104")))
			aap104 = java.net.URLDecoder.decode(this.get("aap104").toString() , "UTF-8");

		if(this.isNotNull(this.get("name")))
			name = java.net.URLDecoder.decode(this.get("name").toString() , "UTF-8");
		
		Object[] args = {
				this.get("aap102"),
				aap103,
				name,
				aap104,
				this.get("aap105")
		};
		
		return this.batchUpdate(sb.toString() , args, this.get("aap101"));
	}
	/***
	 * 单例删除物品项
	 * @return
	 * @throws Exception 
	 */
	private boolean delItem() throws Exception {
		List<Map<String,String>> rows=this.queryForColumns();
		
		System.out.println(rows.size());
		if(rows.size()>0)
		{
			return false;
		}
		else
		{
			StringBuilder sb = new StringBuilder();
			sb.append("delete "
					+ "	from ap01"
					+ "	where "
					+ "	aap101 = ?"
					+ "	and aap102 = '0'");
			Object[] args = {this.get("aap101")};
			return this.executeUpdate(sb.toString(), args) > 0;
		}
	}
	
	
	/***
	 * 新建一个物品项并返回
	 * @return
	 * @throws Exception 
	 */
	public Map<String, String> findById2() throws Exception {
		Object code = this.get("code");
		if(!this.isNotNull(code)) {
			code = Tools.getEmpNumber();
		}
		System.out.println(code);
		StringBuilder sb = new StringBuilder();
		sb.append("insert into ap01(aap103, code, pcode)"
				+ "	values(?,?,?)");
		Object[] args = {
				this.get("aap103"),
				code,
				this.get("pcode")
		};
		if(this.executeUpdate(sb.toString(), args) > 0) {
			System.out.println("插入成功");
			StringBuilder sb2 = new StringBuilder();
			sb2.append("select item.name, item.code, item.pcode, item.aap101, item.aap102, item.aap103, item.aap104, item.aap105"
					+ "	from ap01 item"
					+ "	where item.code=?");
			List<Object> paramList = new ArrayList<>();
			paramList.add(code);
			return this.queryForMap(sb2.toString(), paramList.toArray());
		}
		else {
			System.out.println("插入失败");
			return null;
		}
	}
	
}
