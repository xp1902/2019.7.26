<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>护工请假</title>


<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
<script type="text/javascript">
</script>
   	<ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看老人近况</a></li>
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
 	    <li class="layui-nav-item layui-this" style="float:right;margin-right:20px">
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
<form action="<%=path%>/outOlder.html" method="post" class="layui-form">
${msg }
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       护工请假信息
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">填写请假申请</td>
   </tr>
   <tr>
     <td>请假事由</td>
     <td>
       <e:text name="acx102" required="true" defval="${ins.acx102 }"/>
     </td>
   </tr>
   <tr>
     <td>外出时间</td>
     <td>
        <e:date name="acx103" required="true" defval="${ins.acx103 }"/>
     </td>
   </tr>
   <tr>
     <td>预计返回时间</td>
     <td>
       <e:date name="acx104"  required="true" defval="${ins.acx104 }"/>
     </td>
   </tr>
   
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="提交"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/AddLeave.html">
       <input type="submit" name="next" value="返回"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
</form>
</body>
</html>