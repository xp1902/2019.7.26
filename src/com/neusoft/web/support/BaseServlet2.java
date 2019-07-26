package com.neusoft.web.support;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;

@WebServlet("*.htm")
public class BaseServlet2 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			String aak101=req.getParameter("aak101");
       	 if(aak101!=null) 
       	 {
       		 session.setAttribute("aak101",aak101 );//存储数据
       		 System.out.println("aaaaaaaaaaaaaaaaaaaaa"+aak101);
   		 }
     		String  uri=req.getRequestURI();
     		//获取请求资源的主文件名
     		
     		String baseName=uri.substring(uri.lastIndexOf("/")+1).replace(".htm", "");
     		
     		//定义变量,描述所有业务控制器的基础包名称
     		String basePackageName="com.neusoft.web.impl.";
     		//获取控制器的前缀名
     		String controllerFirstName=baseName.substring(0,1).toUpperCase()+baseName.substring(1);
     		
     		ControllerSupport2 controller = (ControllerSupport2)Class.forName(basePackageName+controllerFirstName+"Servlet").newInstance();
     		
     		controller.setMapDto(this.createDto(req));
     		
     		controller.execute();
     		
     		Object requestAttribute = JSON.toJSON(controller.getAttribute());
     		
     		resp.setCharacterEncoding("UTF-8");
     		
     		resp.getWriter().print(requestAttribute);
     		
		}catch(Exception e) {
			req.setAttribute("msg", "提示:网络故障!");
       	 	e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
	
	private void parseRueqestAttribute(HttpServletRequest request,Map<String,Object> rueqestAttribute)
	{
		//1.还原所有的键值对,形成集合
		Set<Map.Entry<String, Object>> entrySet=rueqestAttribute.entrySet();
		//2.循环集合
		for(Map.Entry<String, Object> entry:entrySet)
		{
			//3.将map的每个键值对,转换成request的属性
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		//清除所有的request级属性数据
		rueqestAttribute.clear();
	}
	
	/**
	 *  DTO切片
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//1.获取页面数据
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.导出所有键值对,形成键值对集合
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.定义数组,表示Enetry的value部分
		String value[]=null;
		
		//4.定义DTO容器
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.循环读取entrySet,获取每个键值对
		for(Entry<String,String[]> entry :entrySet)
		{
			//获取value部分的数组
			value=entry.getValue();
			//依据长度判断页面控件的类别
			if(value.length==1)  //非checkbox类控件
			{
		        //过滤掉页面未填充项目
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox类控件
			{
				dto.put(entry.getKey(), value);
			}	
		}
		//System.out.println(dto);
		return dto;
	}
	
}
