<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>物品申请</title>
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
   <ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看老人近况</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看所负责老人日常信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">打卡老人日常</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryHVolRe.jsp">志愿记录</a></li>
		<li class="layui-nav-item layui-this">
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
      			<dd>提交请假申请</dd>
      			<dd>查看请假申请记录</dd>
      			<dd>退出登录</dd>
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
<form id="myform" action="<%=path%>/queryLaoren.html" method="post" class="layui-form">
	  
	<!-- 数据迭代区 -->
	<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	<caption>
	               所负责老人物品申请
	    <hr width="160">
	  </caption>
	  <thead>
	  <tr><td>姓名</td><td colspan="4">${param.aab103 }</td></tr>
	  <tr>
	    <th>序号</th>
	    <th>物品名称</th>
		<td>物品单位</td>
		<td>物品单价</td>
		<td>数量</td>
	  </tr>
	  </thead>
	  
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>${ins.name }</td>
					<td>${ins.aap104 }</td>
					<td>${ins.aap105 }</td>
					<td>${ins.aas102 }
				  </tr>
		      </c:forEach>
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
			          <tr>
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table class="layui-table">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="返回" class="layui-btn" 
              formaction="<%=path%>/queryHApply.html"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	<e:hidden name="aaj101" defval="${sessionScope.aaj101 }"/>
	<e:hidden name="qaab102" defval="${param.qaab102 }"/>
	<e:hidden name="qaab103" defval="${param.qaab103 }"/>
	<e:hidden name="baar102" defval="${param.baar102 }"/>
	<e:hidden name="eaar102" defval="${param.eaar102 }"/>
</form>
</body>
</html>