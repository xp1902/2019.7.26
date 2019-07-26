package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Att01ServicesImpl extends JdbcServicesSupport {
	///////////////////////�ύ����//////////////////////////
    private boolean addFankui()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into at01(aau101,aat102,aat103,aat104,aat105,aat106)")
    			.append("          values(?,CURRENT_DATE,?,?,?,1)")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aau101"),
    			this.get("aat103"),
    			this.get("aat104"),
    			this.get("aat105"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    /**
     * ����������ѯ
     * @return
     * @throws Exception
     */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
		    Object aau101=this.get("aau101");
	  		Object aat103=this.get("qaat103");     //������
	  		Object aat104=this.get("qaat104");     //��ϵ�绰
	  		Object aat105=this.get("qaat105");     //��������
	  		Object aak103=this.get("qaak103");     //����Ա
	  		Object baat102=this.get("baat102");    //����ʱ��b
	  		Object eaat102=this.get("eaat102");    //����ʱ��e
	  		Object aat106=this.get("qaat106");     //������
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select t.aat101,t.aat102,t.aat103,t.aat104,t.aat105,")
	  				.append("       t.aat106,t.aak101,t.aau101,k.aak101,k.aak103,")
	  				.append("       a.fvalue cnaat106")
	  				.append("  from at01 t")
	  				.append("  LEFT JOIN ak01 k ON k.aak101=t.aak101")
	  				.append("  LEFT JOIN syscode a ON t.aat106=a.fcode AND a.fname='aat106'")
	  				.append(" WHERE true")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aau101))
	  		{
	  			sql.append(" and t.aau101=?");
	  			paramList.add(aau101);
	  		}
	  		if(this.isNotNull(aat103))
	  		{
	  			sql.append(" and t.aat103 like ?");
	  			paramList.add("%"+aat103+"%");
	  		}
	  		if(this.isNotNull(aat104))
	  		{
	  			sql.append(" and t.aat104=?");
	  			paramList.add(aat104);
	  		}
	  		if(this.isNotNull(aat105))
	  		{
	  			sql.append(" and t.aat105 like ?");
	  			paramList.add(aat105);
	  		}
	  		if(this.isNotNull(aak103))
	  		{
	  			sql.append(" and k.aak103=?");
	  			paramList.add(aak103);
	  		}
	  		if(this.isNotNull(aat106))
	  		{
	  			sql.append(" and t.aat106=?");
	  			paramList.add(aat106);
	  		}
	  		if(this.isNotNull(baat102))
	  		{
	  			sql.append(" and t.aat102>=?");
	  			paramList.add(baat102);
	  		}
	  		if(this.isNotNull(eaat102))
	  		{
	  			sql.append(" and t.aat102<=?");
	  			paramList.add(eaat102);
	  		}
	  		
	  		sql.append(" order by t.aat102");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }
	  //����ɾ��
	  private boolean batchDelete()throws Exception
	  {
		  //1.����SQL���
		  String sql="delete from at01 where aat101=?";
		  //2.��ȡҳ��idlist����
		  String idlist[]=this.getIdList("idlist");
		  //3.ִ��
		  return this.batchUpdate(sql, idlist);
	  }
	  
	  private boolean deleteById()throws Exception
	  {
		  Object aal101=this.get("aat101");
		  System.out.println(aal101);
		  String sql="delete from at01 where aat101=?";
	      return this.executeUpdate(sql, this.get("aat101"))>0;
	  }
	  
	  public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select t.aat101,t.aat102,t.aat103,t.aat104,t.aat105,")
	  				.append("       t.aat106,t.aak101,t.aau101,k.aak101,k.aak103,")
	  				.append("       a.fvalue cnaat106")
	  				.append("  from at01 t")
	  				.append("  LEFT JOIN ak01 k ON k.aak101=t.aak101")
	  				.append("  LEFT JOIN syscode a ON t.aat106=a.fcode AND a.fname='aat106'")
	    			.append(" where t.aat101=?")
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aat101"));
	    }
	  
	  private boolean modifyFankuiJiashu()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("update at01")
	    			.append("   set aat102=CURRENT_DATE,aat103=?,aat104=?,aat105=?")
	    			.append(" where aat101=?")
	    			;
	    	Object args[]={
	    			this.get("aat103"),
	    			this.get("aat104"),
	    			this.get("aat105"),
	    			this.get("aat101"),
	    	};
	    	return this.executeUpdate(sql.toString(), args)>0;
	    	
	    }

}
