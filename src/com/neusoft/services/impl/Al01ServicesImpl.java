package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Al01ServicesImpl extends JdbcServicesSupport {
	
	private boolean modifyOutOlder()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update al01")
    			.append("   set aal102=?,aal103=?,aal104=?,aal105=?,aal106=?")
    			.append(" where aal101=?")
    			;
    	Object args[]={
    			this.get("aal102"),
    			this.get("aal103"),
    			this.get("aal104"),
    			this.get("aal105"),
    			this.get("aal106"),
    			this.get("aal101"),
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    	
    }
    
    private boolean addOutOlder()throws Exception
    {
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into al01(aab101,aal102,aal103,aal104,aal105,")
    			.append("                 aal106,aal107)")
    			.append("           value(?,?,?,?,?,")
    			.append("                 ?,2)")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aab101"),
    			this.get("aal102"),
    			this.get("aal103"),
    			this.get("aal104"),
    			this.get("aal105"),
    			this.get("aal106"),
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }

    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aal101,a.aal102,a.aal103,a.aal104,a.aal105,")
    			.append("       a.aal106,b.aak101,b.aak103,b.aak102,a.aab101")
    			.append("  from al01 a")
    			.append("  LEFT JOIN ak01 b on a.aak101=b.aak101")
    			.append(" where a.aal101=?")
    			;
    	//ִ�в�ѯ
    	return this.queryForMap(sql.toString(), this.get("aal101"));
    }
    
      /**
       * ����������ѯ
       * @return
       * @throws Exception
       */
	  public List<Map<String,String>> query()throws Exception
	  {
	  		//��ԭҳ���ѯ����
		    Object aab101=this.get("aab101");
	  		Object aal102=this.get("qaal102");     //���ԭ��
	  		Object aal105=this.get("qaal105");     //��ͬ��
	  		Object aal106=this.get("qaal106");     //��ͬ�˵绰
	  		Object baal103=this.get("baal103");    //�������B
	  		Object eaal103=this.get("eaal103");    //�������E
	  		Object baal104=this.get("baal104");    //Ԥ�Ʒ�������B
	  		Object eaal104=this.get("eaal104");    //Ԥ�Ʒ�������E
	  		
	  		//����SQL����
	  		StringBuilder sql=new StringBuilder()
	  				.append("select a.aal102,a.aal105,a.aal106,a.aal103,a.aal104,")
	  				.append("       a.aal101,b.aab101,c.aak101,c.aak103")
	  				.append("  from (al01 a ")
	  				.append("  LEFT JOIN ab01 b ON a.aab101=b.aab101)")
	  				.append("  LEFT JOIN ak01 c ON a.aak101=c.aak101")
	  				.append("  where true")
	  				;
	  		
	  		//�����б�
	  		List<Object> paramList=new ArrayList<>();
	  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
	  		if(this.isNotNull(aab101))
	  		{
	  			sql.append(" and a.aab101=?");
	  			paramList.add(aab101);
	  		}
	  		if(this.isNotNull(aal102))
	  		{
	  			sql.append(" and a.aal102 like ?");
	  			paramList.add("%"+aal102+"%");
	  		}
	  		if(this.isNotNull(aal105))
	  		{
	  			sql.append(" and a.aal105=?");
	  			paramList.add(aal105);
	  		}
	  		if(this.isNotNull(aal106))
	  		{
	  			sql.append(" and a.aal106=?");
	  			paramList.add(aal106);
	  		}
	  		//�������
	  		if(this.isNotNull(baal103))
	  		{
	  			sql.append(" and a.aal103>=?");
	  			paramList.add(baal103);
	  		}
	  		if(this.isNotNull(eaal103))
	  		{
	  			sql.append(" and a.aal103<=?");
	  			paramList.add(eaal103);
	  		}
	  		//����
	  		if(this.isNotNull(baal104))
	  		{
	  			sql.append(" and a.aal104>=?");
	  			paramList.add(baal104);
	  		}
	  		if(this.isNotNull(eaal104))
	  		{
	  			sql.append(" and a.aal104<=?");
	  			paramList.add(eaal104);
	  		}
	  		sql.append(" order by a.aal103");
	  		return this.queryForList(sql.toString(), paramList.toArray());
	  }

	  private boolean batchDelete()throws Exception
	  {
		  //1.����SQL���
		  String sql="delete from al01 where aal101=?";
		  //2.��ȡҳ��idlist����
		  String idlist[]=this.getIdList("idlist");
		  //3.ִ��
		  return this.batchUpdate(sql, idlist);
	  }
	  
	  private boolean deleteById()throws Exception
	  {
		  Object aal101=this.get("aal101");
		  System.out.println(aal101);
		  String sql="delete from al01 where aal101=?";
	      return this.executeUpdate(sql, this.get("aal101"))>0;
	  }
	    

}
