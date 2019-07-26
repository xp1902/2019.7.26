package com.neusoft.web.support;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport2 implements BaseController {
	private BaseServices services = null;
	
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
	 * 单一实例查询
	 * @throws Exception 
	 */
	protected final void savePageInstance() throws Exception {
		Map<String,String> instance = this.services.findById();
		if(instance != null) {
			this.saveAttribute("ins", instance);
		}
		else {
			this.saveAttribute("msg", "0");
		}
	}
	
	/***
	 * 库存添加后查询返回
	 * @throws Exception
	 */
	protected final void savePageInstance2() throws Exception{
		Map<String,String> ins=this.services.findById2();
		if(ins.size()>0)
		{
			this.saveAttribute("ins", ins);
			this.saveAttribute("msg", "1");
		}
		else
		{
			this.saveAttribute("msg", "0");
		}
	}
	
	protected final void savePageDataForRows() throws Exception{
		List<Map<String,String>> rows=this.services.queryForRows();
		if(rows.size()>0)
		{
			this.saveAttribute("data", rows);
			this.saveAttribute("msg", "1");
			this.saveAttribute("count", rows.size());
			this.saveAttribute("code", '0');
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
	
	/**
	 * 更新方法
	 * @param uType
	 * @return
	 * @throws Exception
	 */
	protected final void update(String uType, String msgText) throws Exception{
		String msg=this.services.update(uType)?"1":"0";
		this.saveAttribute("msg", msg);
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
//    	System.out.println(this.dto);
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
