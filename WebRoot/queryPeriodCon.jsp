<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>所负责老人近况信息列表</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="js/layer-v3.1.1/layer/layer.js"></script>
   	<link rel="stylesheet" href="layui/css/layui.css">
   	<script src="layui/layui.js"></script>
   	<script src="layui/uselayui.js"></script> 
   <script type="text/javascript">
   function onQuery(vaab101,vaab103)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/queryEPeriodCon.html?aab101="+vaab101+"&aab103="+encodeURI(vaab103);
 	 vform.submit();
   }

   </script>
     <ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看老人近况</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看所负责老人日常信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">打卡老人日常</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryHVolRe.jsp">志愿记录</a></li>
		<li class="layui-nav-item">
    		<a href="javascript:;">物品申请管理</a>
    		<dl class="layui-nav-child">
      			<dd><a href="<%=path%>/queryElderA.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">物品申请</a></dd>
      			<dd><a href="<%=path%>/queryHApply.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看申请记录</a></dd>
    		</dl>
 	    </li>
 	    <li class="layui-nav-item" style="float:right;margin-right:20px">
    		<a href="javascript:;">个人管理</a>
    		<dl class="layui-nav-child">
      			<dd><a href="<%=path%>/queryOneHugong.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">修改个人信息</a></dd>
      			<dd><a href="<%=path%>/addLeave.jsp">提交请假申请</a></dd>
      			<dd><a href="<%=path%>/queryLeave.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看请假申请记录</a></dd>
      			<dd><a href="<%=path%>/logout.do">退出登录</a></dd>
    		</dl>
 	    </li>
	</ul>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){var element = layui.element;});
</script>
</head>
<body>
${msg }
<form id="myform" action="<%=path%>/hugong.jsp" method="post" class="layui-form">
	  
	<!-- 数据迭代区 -->
	<table class="layui-table"  style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               所负责老人近况信息
	    <hr width="160">
	  </caption>
	  <thead>
	  <tr>
	    <th>序号</th>
	    <th>老人编号</th>
	    <th>姓名</th>
	    <th>性别</th>
	    <th>兴趣</th>
		<th>饮食特点</th>
		<th>性格心理</th>
		<th>爱好</th>
		<th>异常表现</th>
		<th>特殊要求</th>
	    <th>更新日期</th>
		<th>备注</th>
	    <th></th>
	  </tr>
	  </thead>
	  
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab103 }</td>
				    <td>${ins.aab104 }</td>
				    <td>${ins.aab105 }</td>
					<td>${ins.aag103 }</td>
					<td>${ins.aag104 }</td>
					<td>${ins.aag105 }</td>
					<td>${ins.aag106 }</td>
					<td>${ins.aag107 }</td>
					<td>${ins.aag102 }</td>
					<td>${ins.aag108 }</td>

				    <td>
				      <a href="#" onclick="onQuery('${ins.aab101}','${ins.aab103 }')">查看该老人所有近况信息</a>
				    </td>
				  
				  </tr>
		      </c:forEach>
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
			            <td></td>
	    				<td></td>
	             		<td></td>
			            <td></td>
	    				<td></td>
	             		<td></td>
			          </tr>
		      </c:forEach>
	     </c:when>
	     <c:otherwise>
	        <c:forEach begin="1" step="1" end="15">
	           <tr>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	             <td></td>
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table class="layui-table">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="返回"  class="layui-btn" 
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>