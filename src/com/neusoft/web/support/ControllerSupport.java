package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        业务逻辑组件及架构注入
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
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
	 * 	        子类业务流程封装
	 *****************************************/
	
	/**
	 * 数据批量查询*******************************************************************************床位
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
	
	protected final void savePageDataForColumns() throws Exception{
		List<Map<String,String>> columns=this.services.queryForColumns();
		if(columns.size()>0)
		{
			this.saveAttribute("columns", columns);
		}else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	/**
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	protected final void saveData()throws Exception
	{
		Method mtd=this.services.getClass().getDeclaredMethod("queryRepeat");
		mtd.setAccessible(true);
		if((boolean) mtd.invoke(services))
		{
			this.saveAttribute("repeat", "true");
			this.saveAttribute("msg", "该用户名已存在！");
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
				this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
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
			this.saveAttribute("msg", "没有符合条件的数据!");
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
			this.saveAttribute("msg", "没有符合条件的数据!");
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
			this.saveAttribute("msg", "没有符合条件的数据!");
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
//			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
//		}
//	}
	/**
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		return  (boolean)method.invoke(services);
	}
	
	
	/**
	 * 更新行为的总开关
	 * <
	 *   简单消息提示
	 * >
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * 带有编号的消息提示的更新行为
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String key)throws Exception
	{
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText+"[ <msg> "+this.dto.get(key)+" </msg> ]";
    	}
    	//Servlet向页面输出数据
    	this.saveAttribute("msg", msg);
	}
	
	/**
	 * 删除后的数据检索
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
	 * 	        数据输入流
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //同步为Services传递DTO
        this.services.setMapDto(dto);
        
    }
    
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        数据输出流
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
