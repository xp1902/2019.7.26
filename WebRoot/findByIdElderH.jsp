<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<style type="text/css">
	tr{
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
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
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
</head>
	<h2 align= "center">以下为入住人详细信息</h2>
<body>
	<form method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">

			<caption>入住人信息表<hr width="160"></caption>
			<tr>
				<td>姓名</td>
				<td>${ins.aab103 }</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>${ins.aab104 }</td>
			</tr>
			<tr>
				<td>户籍</td>
				<td>${ins.aab106 }</td>
			</tr>
			<tr>
				<td>民族</td>			
				<td>${ins.aab107 }</td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td>${ins.aab108 }</td>
			</tr>
			<tr>
				<td>政治面貌</td>
				<td>${ins.aab109 }</td>
			</tr>
			<tr>
				<td>紧急联系手机号</td>
				<td>${ins.aab110 }</td>
			</tr>
			<tr>
				<td>入住状态</td>
				<td>${ins.aab111 }</td>
			</tr>
			<tr>
				<td>医疗保险</td>
				<td>${ins.aab113 }</td>
			</tr>
			<tr>
				<td>身份证号</td>
				<td>${ins.aab112 }</td>
			</tr>
			<tr>
				<td>护理级别</td>
				<td>${ins.aab114 }</td>
			</tr>
			
			
			
			
			
			<tr>
				<td colspan=2 align="center">入住人健康信息表</td>
			</tr>
			<tr>
				<td>神志</td>
				<td>${ins.aaf101 }</td>
			</tr><tr>
				<td>过敏药物</td>
				<td>${ins.aaf102 }</td>
			</tr><tr>
				<td>主治医院</td>
				<td>${ins.aaf103 }</td>
			</tr><tr>
				<td>主治医师</td>
				<td>${ins.aaf104 }</td>
			</tr><tr>
				<td>医院电话</td>
				<td>${ins.aaf105 }</td>
			</tr><tr>
				<td>主要疾病</td>
				<td>${ins.aaf106 }</td>
			</tr>
			
			
			
			
			<tr>
				<td colspan=2 align="center">入住人住宿表</td>
			</tr>
			<tr>
				<td>大厦</td>
				<td>${ins.aai102 }</td>
			</tr>
			<tr>
				<td>房间号</td>
				<td>${ins.aai104 }</td>
			</tr>
			<tr>
				<td>床位</td>
				<td>${ins.aai105 }</td>
			</tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
	       			<input type="submit" name="next" value="返回" class="layui-btn" 
             		 formaction="<%=path%>/queryLaoren.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
	</form>
</body>
</html>