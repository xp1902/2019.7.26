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
    <a href="<%=path%>/queryEmp.jsp">Ա������</a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryBed.jsp">��λ���� </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryTheOld.jsp">��ס�˹��� </a>
  </li>
  
	<li class="layui-nav-item">
	<a href="#">��ٹ��� </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryVacation.jsp">��ס����ٹ���</a></dd>
    	<dd><a href="<%=path%>/queryVacationEmp.jsp">Ա����ٹ���</a></dd>
    </dl>
  	</li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/queryFeedback.jsp">�������� </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryAppointment.jsp">ԤԼ���� </a>
  </li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/addFangke.jsp">��ӷÿ� </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryVisit.jsp">�ÿͼ�¼ </a></dd>
    </dl>
  </li>
  
  <li class="layui-nav-item">
    <a href="<%=path%>/queryWarehouse.jsp">������ </a>
    <dl class="layui-nav-child">
    	<dd><a href="<%=path%>/queryIns.jsp">�����Ϣ</a></dd>
    	<dd><a href="<%=path%>/queryOuts.jsp">������Ϣ</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/queryVolunteer.jsp">־Ը�߹���</a>
  </li>
  
  <li class="layui-nav-item">
    <a href="">��</a>
    <dl class="layui-nav-child">
      <dd><a href="javascript:;">�޸���Ϣ</a></dd>
      <dd><a href="javascript:;">��ȫ����</a></dd>
      <dd><a href="javascript:;">����</a></dd>
    </dl>
  </li>
</ul>
</html>
