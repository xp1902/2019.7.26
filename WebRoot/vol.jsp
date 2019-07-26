<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

.layui-btn {
background-color:#393D49;
}


</style>

 <script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>志愿者主页</title>

	<ul class="layui-nav" lay-filter="">
	   <li class="layui-nav-item layui-this"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">首页</a></li>
	   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></li>
	   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">预约志愿</a></li>
	   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿记录</a></li>
	   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿团队</a></li>
	   <li class="layui-nav-item" style="float:right;margin-right:20px">
	     <a href="javascript:;">我</a>
	     <dl class="layui-nav-child"> <!-- 二级菜单 -->
	       <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></dd>
	       <dd><a href="<%=path%>/shouye.jsp">退出登录</a></dd>
	     </dl>
	   </li>
	</ul>
 
 <script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  
  //…
});
</script>


</head>
<body>
	<form method="post">
	
		<section>
		  <div style="width:80%;margin:0px auto;z-index:1;">
		    <img src="./images/home.jpg" style="width:100%;height:500px">
		    <div>
		    </div>
		  </div>
		</section>
		<fieldset class="layui-elem-field" style="width:60%;margin:10px auto;padding:5px 10px;">
		  <legend style="font-size: 40px;line-height: 1.2;color: #204479;margin-bottom: 0.5em;">**颐养中心</legend>
		  <div class="layui-field-box" style="font-size: 18px;line-height: 1.5;color: #7d7d7d;margin: 0;">
		     **颐养中心基于中国养老服务行业初步发展、巨大养老需求亟待解决的现状，**颐养中心放眼长期稳健发展，积极探索既适合中国国情、又与欧洲标准接轨的长期照护养老服务模式。
		  </div>
		</fieldset>
		
		<input type="hidden" name="aan101" value="${empty ins.aan101?param.aan101:ins.aan101 }">
	</form>
</body>
</html>