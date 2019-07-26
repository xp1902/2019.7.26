package com.neusoft.web.support;

import java.util.Map;

public interface BaseController 
{
	//Ϊҵ����������DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;
    
    Map<String,Object> getAttribute();
}
