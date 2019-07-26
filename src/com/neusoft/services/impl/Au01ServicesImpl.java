package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Au01ServicesImpl extends JdbcServicesSupport
{
	public Map<String,String> findById()throws Exception
	{
		Object aau102=this.get("aau102");
		Object aau103=Tools.getMd5(this.get("aau103"));
		
		List<Object> paramList=new ArrayList<>();
		paramList.add(aau102);
		paramList.add(aau103);
		String sql1="select aau104 from au01 where aau102=? and aau103=?";
		Map<String,String> result=this.queryForMap(sql1, paramList.toArray());
		String aau104=result.get("aau104");
		StringBuilder sql= new StringBuilder();
		if(aau104.equals("1"))
		{
			sql.append("select a.aau101,a.aau104,b.aak101 ")
				.append("  from au01 a,ak01 b");
		}
		else if(aau104.equals("2"))
		{
			sql.append("select a.aau101,a.aau104,b.aaj101 ")
				.append("  from au01 a,aj01 b");
		}
		else if(aau104.equals("3"))
		{
			sql.append("select a.aau101,a.aau104,b.aad101 ")
				.append("  from au01 a,ad01 b");
		}
		else if(aau104.equals("4"))
		{
			sql.append("select a.aau101,a.aau104,b.aan101 ")
				.append("  from au01 a,an01 b");
				
		}
		sql.append(" where a.aau102=? ")
			.append("   and a.aau103=? ")
			.append("   and a.aau101=b.aau101");

		System.out.println(this.queryForMap(sql.toString(), paramList.toArray()));
		
		return this.queryForMap(sql.toString(), paramList.toArray());
	}
	
	public boolean queryRepeat()throws Exception
	{
		String sql="select aau101 from au01 where aau102=?";
		if(this.queryForMap(sql, this.get("aau102"))!=null)
			return true;
		else
			return false;
	}
	
	public Map<String, String> findByIdForRegister()throws Exception
	{
		Object aau102=this.get("aau102");
		Object aau103=Tools.getMd5(this.get("aau103"));
		
		String sql="select aau101,aau104 from au01 where aau102=? and aau103=?";
		
		List<Object> paramList=new ArrayList<>();
		paramList.add(aau102);
		paramList.add(aau103);
		
		return this.queryForMap(sql.toString(), paramList.toArray());

	}
	
	private Map<String,String> saveData()throws Exception
	{
		Map<String,String> ins=new HashMap<String,String>();
		ins.put("aau102", this.get("aau102").toString());
		ins.put("aau103", this.get("aau103").toString());
		ins.put("aau104", this.get("aau104").toString());
		return ins;
	}
	
	//志愿者登陆提交
	 private boolean pingjun()throws Exception
	    {
	        Object aan101=this.get("aan101");
			
			List<Object> paramList=new ArrayList<>();
			
			paramList.add(aan101);
			
			String sql1="select ceil(avg(aao107)) from ao01 where aan101=?";
			
			Map<String,String> result=this.queryForMap(sql1, paramList.toArray());
			
			String aan108=result.get("ceil(avg(aao107))");
			
			StringBuilder sql2=new StringBuilder() 
					.append("update an01 set aan108=? where aan101=?");
			
			Object args[]={		
	    			aan108,
	    			this.get("aan101"),
	    	};
			return this.executeUpdate(sql2.toString(), args)>0;	
	    }
	 
	 public Map<String,String> findByIc()throws Exception
	    {
	    	
			
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aan102,a.aan103,a.aan104,a.aan105,a.aan106,")
	    			.append("       a.aan108,a.aan101,aau101")
	    			.append("  from an01 a")
	    			.append(" where a.aan101=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aan101"));
	    }
	
//	public boolean addUser()throws Exception
//	{
//		String sql1="select aau101 from au01 where aau102=?";
//		if(this.queryForMap(sql1, this.get("aau102"))!=null)return false;
//		StringBuilder sql2=new StringBuilder()
//				.append("insert into au01(aau102,aau103,aau104)")
//				.append("values (?,?,?)");
//		Object args[]= {
//				this.get("aau102"),
//				Tools.getMd5(this.get("aau103").toString()),
//				this.get("aau104")
//		};
//		return this.executeUpdate(sql2.toString(),args)>0;	
//	}
}
