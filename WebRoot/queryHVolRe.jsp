<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>志愿记录信息列表</title>
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
   function onQuery(vaao101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdVolRe.html?aao101="+vaao101;
 	 vform.submit();
   }
   function onQueryVol(vaan101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdHVol.html?aan101="+vaan101;
 	 vform.submit();
   }
   </script>
      <ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看老人近况</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看所负责老人日常信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">打卡老人日常</a></li>
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryHVolRe.jsp">志愿记录</a></li>
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
	window.onload=function()
	{
		var a=${empty rows};
		var b=${empty msg};
		
		if(a&&b)
		{
			var now = new Date(); 
			//格式化日，如果小于9，前面补0 
			var day = ("0" + now.getDate()).slice(-2); 
			//格式化月，如果小于9，前面补0 
			var month = ("0" + (now.getMonth() + 1)).slice(-2); 
			//拼装完整日期格式 
			var today = now.getFullYear()+"-"+(month)+"-"+(day) ; 
			document.getElementById("baao104").value=(today);
			document.getElementById("eaao104").value=(today);
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/queryHVolRe.html";
		 	vform.submit();
		}
	}		
</script>
</head>
<body>
${msg }
<form id="myform" action="<%=path%>/hugong.jsp" method="post" class="layui-form">
	  
	  <table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	  <caption>
	               志愿记录查询
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="8" align="center">查询条件</td>
	  </tr>
	  <tr>
	    <td>志愿者姓名</td>
	    <td>
	      <e:text name="qaan102"/>
	    </td>
	    <td>志愿者性别</td>
	    <td colspan="3">
	      <e:radio name="qaan103" value="男:1,女:2,不确定:3,不限定:''" defval=""/>
	    </td>
	    
	  </tr>
	  <tr>
	  <td>开始日期</td>
	    <td>
	      <e:date name="baao104"/>
	    </td>
	    <td>结束日期</td>
	    <td>
	      <e:date name="eaao104"/>
	    </td>
	    </tr>
	  <tr>
	    <td colspan="4" align="center">
	     <input type="submit" name="next" value="查询" class="layui-btn"
              formaction="<%=path%>/queryHVolRe.html"/>
	    </td>
	  </tr>
	  </table>
	  
	  
	<!-- 数据迭代区 -->
	<table class="layui-table"  style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               志愿记录信息列表
	    <hr width="160">
	  </caption>
	  <tr>
	    <td>序号</td>
		<td>志愿者姓名</td>
		<td>志愿者性别</td>
		<td>志愿者联系电话</td>
	    <td>志愿日期</td>
		<td>志愿内容</td>
		<td>完成情况</td>
	    <td>评分</td>
	    <td></td>
	    <td></td>
	  </tr>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
					<td>${ins.aan102 }</td>
					<td>${ins.aan103 }</td>
					<td>${ins.aan105 }</td>
					<td>${ins.aao104 }</td>
					<td>${ins.aao105 }</td>
					<td>${ins.aao106 }</td>
					<td>${ins.aao107 }</td>
				    <td>
				      <a href="#" onclick="onQueryVol('${ins.aan101}')">查看该志愿者情况</a>
				    </td>
				    <td>
				      <a href="#" onclick="onQuery('${ins.aao101}')">为该次志愿情况评分</a>
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
	<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
</form>
</body>
</html>