package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        ҵ���߼�������ܹ�ע��
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        ����ҵ�����̷�װ
	 *****************************************/
	
	/**
	 * ����������ѯ*******************************************************************************��λ
	 * @throws Exception
	 */
	protected final void savePageDataForRows()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryForRows();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
	}
	
	protected final void savePageDataForColumns() throws Exception{
		List<Map<String,String>> columns=this.services.queryForColumns();
		if(columns.size()>0)
		{
			this.saveAttribute("columns", columns);
		}else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
	}
	/**
	 * ����������ѯ
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
			if(rows.get(0).get("aab103")!=null)
				this.saveAttribute("EName", rows.get(0).get("aab103"));
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	/**
	 * ��һʵ�� ��ѯ
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
			if(ins.get("aau104")!=null)
			this.saveAttribute("userType", ins.get("aau104"));
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	protected final void saveData()throws Exception
	{
		Method mtd=this.services.getClass().getDeclaredMethod("queryRepeat");
		mtd.setAccessible(true);
		if((boolean) mtd.invoke(services))
		{
			this.saveAttribute("repeat", "true");
			this.saveAttribute("msg", "���û����Ѵ��ڣ�");
		}
		else
		{
			this.saveAttribute("repeat", "false");
			Method method=this.services.getClass().getDeclaredMethod("saveData");
			method.setAccessible(true);
			Map<String,String> ins=(Map<String, String>) method.invoke(services);
			if(ins!=null)
			{
				this.saveAttribute("ins",  ins);
				if(ins.get("aau104")!=null)
				this.saveAttribute("userType", ins.get("aau104"));
			}
			else
			{
				this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
			}
		}

	}
	
	protected final void savePageDataForToday()throws Exception
	{
		Method mtd=this.services.getClass().getDeclaredMethod("queryTodayDaily");
		mtd.setAccessible(true);
		List<Map<String,String>> rows=(List<Map<String, String>>)mtd.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	protected final void savePageDataForElder()throws Exception
	{
		Method mtd=this.services.getClass().getDeclaredMethod("queryForElder");
		mtd.setAccessible(true);
		List<Map<String,String>> rows=(List<Map<String, String>>)mtd.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	protected final void savePageDataForH()throws Exception
	{
		Method mtd=this.services.getClass().getDeclaredMethod("queryForH");
		mtd.setAccessible(true);
		List<Map<String,String>> rows=(List<Map<String, String>>)mtd.invoke(services);
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
//	protected final void savePageInstanceForRegister()throws Exception
//	{
//		Method method=this.services.getClass().getDeclaredMethod("findByIdForRegister");
//		method.setAccessible(true);
//		Map<String,String> ins=(Map<String, String>) method.invoke(services);
//		if(ins!=null)
//		{
//			this.saveAttribute("ins",  ins);
//			if(ins.get("aau104")!=null)
//			this.saveAttribute("userType", ins.get("aau104"));
//		}
//		else
//		{
//			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
//		}
//	}
	/**
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * ������Ϊ���ܿ���
	 * <
	 *   ����Ϣ��ʾ
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"�ɹ�!":"ʧ��!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"ʧ��!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet��ҳ���������
    	this.saveAttribute("msg", msg);
	}
	
	/**
	 * ɾ��������ݼ���
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void savePageDataForDelete2()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryForRows();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	
	
	/*****************************************
	 * 	        ����������
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //ͬ��ΪServices����DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        ���������
	 *****************************************/
    private Map<String,Object> attribute=new HashMap<>();
    protected final void  saveAttribute(String key,Object value)
    {
    	this.attribute.put(key, value);
    }
    
    @Override
    public final Map<String, Object> getAttribute() 
    {
    	return this.attribute;
    }
}
