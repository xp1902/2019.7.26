<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=path %>/layui/css/layui.css">
<link rel="stylesheet" href="<%=path %>/layui/css/tree.css">
<script src="<%=path %>/layui/layui.js"></script>
<script src="<%=path %>/layui/uselayui.js"></script>
<script src="<%=path %>/js/layer-v3.1.1/layer/layer.js"></script>

<!--     <link rel="stylesheet" href="https://whvse.gitee.io/treetable-lay/assets/layui/css/layui.css"> -->
<!--     <link rel="stylesheet" href="https://whvse.gitee.io/treetable-lay/assets/common.css"/> -->
<!--     <script src="https://whvse.gitee.io/treetable-lay/assets/layui/layui.js"></script> -->

</head>
<ul class="layui-nav">
  <li class="layui-nav-item">
    <a href="<%=path%>/queryEmp.jsp">员工管理</a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryBed.jsp">床位管理 </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryTheOld.jsp">入住人管理 </a>
  </li>
  
	<li class="layui-nav-item">
	<a href="#">请假管理 </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryVacation.jsp">入住人请假管理</a></dd>
    	<dd><a href="<%=path%>/queryVacationEmp.jsp">员工请假管理</a></dd>
    </dl>
  	</li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/queryFeedback.jsp">反馈管理 </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryAppointment.jsp">预约管理 </a>
  </li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/addFangke.jsp">添加访客 </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryVisit.jsp">访客记录 </a></dd>
    </dl>
  </li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/queryWarehouse.jsp">库存管理 </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryIns.jsp">入库信息</a></dd>
    	<dd><a href="<%=path%>/queryOuts.jsp">出库信息</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryVolunteer.jsp">志愿者管理</a>
  </li>
  
  <li class="layui-nav-item">
    <a href="">我</a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">修改信息</a></dd>
      <dd><a href="javascript:;">安全管理</a></dd>
      <dd><a href="javascript:;">退了</a></dd>
    </dl>
  </li>
</ul>
</html>
