package com.neusoft.services;

import java.util.List;
import java.util.Map;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * �ӿڵ�Ĭ��ʵ��
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
 	 * ���ع�
 	 * @return
 	 * @throws Exception
 	 */
 	default Map<String, String> findById2() throws Exception{
 		return null;
 	}

 	//���ظ���������Ϣ
 	default List<Map<String, String>> queryForColumns() throws Exception{
 		return null;
 	};
 	
 	default List<Map<String, String>> queryForRows() throws Exception{
 		return null;
 	}
}
