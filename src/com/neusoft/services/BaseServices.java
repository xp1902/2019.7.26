package com.neusoft.services;

import java.util.List;
import java.util.Map;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * 接口的默认实现
      * @return
      * @throws Exception
      * 
      */
 	default boolean update(String uType) throws Exception{
		return false;
	}
     default Map<String,String> findById()throws Exception
     {
    	 return null;
     }

     
     default List<Map<String,String>> query()throws Exception
     {
    	 return null;
     }
     
 	/**
 	 * 待重构
 	 * @return
 	 * @throws Exception
 	 */
 	default Map<String, String> findById2() throws Exception{
 		return null;
 	}

 	//返回附带房间信息
 	default List<Map<String, String>> queryForColumns() throws Exception{
 		return null;
 	};
 	
 	default List<Map<String, String>> queryForRows() throws Exception{
 		return null;
 	}
}
