<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
	<title>志愿团队</title>
	<style type="text/css">
	  #a{
	    outline:none;
	    border:0;		
	    }

	</style>
	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
</head>
<body>

	<div class="layui-form-item">
	<form class="layui-form" action="<%=path%>/addVol.html" method="post">
		<ul class="layui-nav" lay-filter="">
		   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">首页</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">预约志愿</a></li>
		   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿记录</a></li>
		   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿团队</a></li>
		   <li class="layui-nav-item" style="float:right;margin-right:20px">
		     <a href="javascript:;">我</a>
		     <dl class="layui-nav-child"> <!-- 二级菜单 -->
		       <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></dd>
		       <dd><a href="<%=path%>/shouye.jsp">退出登录</a></dd>
		     </dl>
		   </li>
		 </ul>
		${msg}
	    <br>
	    <br>
		<table class="layui-table" style="width:50%;margin:30px auto;">
		  <caption>
		          ${empty param.bba102?'创建':'修改' }团队
		    <hr width="160">
		  </caption>
		  <tr>
		    <td><label class="layui-form-label">团队名称</label></td>
		    <td>
		      <e:text name="bba102" id="a" required="true" defval="${ins.bba102 }"/>
		    </td>
		  </tr>
		 
		  <tr>
		    <td><label class="layui-form-label">团队宣言</label></td>
		    <td>
		      <e:text name="bba105" id="a" required="true" defval="${ins.bba105 }" />
		    </td>
		  </tr>
		  
		  <tr>
		    <td><label class="layui-form-label" style="width:100px">一般活动时间</label></td>
		    <td>
		      <e:text name="bba106" id="a" required="true" placeholder="例如：周一、周日" defval="${ins.bba106 }" />
		    </td>
		  </tr>
		  
		  <tr>
		    <td><label class="layui-form-label">团队任务</label></td>
		    <td>
		      <e:textarea rows="5" cols="45" name="bba103" id="a" defval="${ins.bba103 }" />
		    </td>
		  </tr>
		  
		  <tr>
		    <td><label class="layui-form-label">任务时间</label></td>
		    <td>
		      <e:date name="bba104"  defval="${ins.bba104 }"/>
		    </td>
		  </tr>
		  
		  <tr>
		    <td colspan="2" align="center">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" formnovalidate="formnovalidate" 
		          formaction="${empty param.bba102?'zhiyuanTuandui':'zhiyuanTuandui' }.html" value="返回">
		      <input class="layui-btn layui-btn-sm" type="submit" name="next" value="${empty param.bba102?'创建':'修改' }"
	              formaction="<%=path%>/${empty param.bba102?'add':'modify' }Team.html">
		    </td>
		  </tr>
		</table>
		<e:hidden name="aau101" value="${param.aau101 }"/>
		<e:hidden name="aan101" value="${param.aan101 }"/>
		<e:hidden name="bba101" value="${param.bba101 }"/>
	</form>
	</div>

</body>
</html>