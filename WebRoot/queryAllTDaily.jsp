<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>所负责老人今日日常管理</title>
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
   var count=0;
   
   layui.use('form', function(){
	   var form=layui.form;
	   form.on('checkbox(idlist)', function(data){
		   data.elem.checked?count++:count--;
		   
		   var v=document.getElementById("dai");
		   v.className=(count==0)?"layui-btn layui-btn-disabled":"layui-btn";

		   var v=document.getElementById("diet");;
		   v.className=(count==0)?"layui-btn layui-btn-disabled":"layui-btn";

		   var v=document.getElementById("act");;
		   v.className=(count==0)?"layui-btn layui-btn-disabled":"layui-btn";

		   var v=document.getElementById("medi");;
		   v.className=(count==0)?"layui-btn layui-btn-disabled":"layui-btn";
		 	  
	 });});

	  
   function onQuery(vaah101)
   {
 	 var vform = document.getElementById("myform");
 	 vform.action="<%=path%>/findByIdDaily.html?aah101="+vaah101;
 	 vform.submit();
   }
	   </script>
	   <ul class="layui-nav" lay-filter="">
   		<li class="layui-nav-item"><a href="<%=path%>/hugong.jsp">首页</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryLaoren.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看自己所负责的老人信息</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryPeriodCon.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看老人近况</a></li>
		<li class="layui-nav-item"><a href="<%=path%>/queryDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">查看所负责老人日常信息</a></li>
		<li class="layui-nav-item layui-this"><a href="<%=path%>/queryAllTDaily.html?aaj101=${empty ins.aaj101?sessionScope.aaj101:ins.aaj101}">打卡老人日常</a></li>
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
	<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
	  <thead>
	  <tr>
	 	<th></th>
	    <th>序号</th>
	    <th>老人编号</th>
	    <th>姓名</th>
	    <th>性别</th>
		<th>血压</th>
		<th>脉搏</th>
		<th>起居是否正常</th>
		<th>饮食是否正常</th>
		<th>活动是否正常</th>
		<th>用药是否正常</th>
		<th>日期</th>
	    <th></th>
	  </tr>
	  </thead>
	   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
	    	   	  
	    	   	  	<td style="width:5px;height:3px;">
	    	   	  	 <div class="layui-form-item">
    					<div class="layui-input-block" style="margin-left:10px;">
				      		<input type="checkbox" name="idlist" value="${ins.aab101 }"
				             onclick="onSelect(this.checked)" lay-skin="primary" lay-filter="idlist"/>
				        </div>
				     </div>
				    </td>
				    <td>${vs.count }</td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aab103 }</td>
				    <td>${ins.caab104 }</td>
					<td>${ins.aah103 }</td>
					<td>${ins.aah104 }</td>
					<td>${ins.caah105 }</td>
					<td>${ins.caah106 }</td>
					<td>${ins.caah107 }</td>
					<td>${ins.caah108 }</td>
					<td>${ins.aah102 }</td>
					<td>
				      <a href="#" onclick="onQuery('${ins.aah101}')">修改该条日常情况</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="12">
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
	        <c:forEach begin="1" step="1" end="12">
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
	    	<input type="submit" class="layui-btn layui-btn-disabled" name="next" id="dai" value="打卡所选老人起居"
	    	formaction="<%=path%>/modifyDaily.html" 
	    	onclick="this.form.mod.value='1'"/>
	    	<input type="submit" class="layui-btn layui-btn-disabled" name="next" id="diet" value="打卡所选老人饮食"
	    	formaction="<%=path%>/modifyDaily.html" 
	    	onclick="this.form.mod.value='2'"/>
	    	<input type="submit" class="layui-btn layui-btn-disabled" name="next" id="act" value="打卡所选老人活动"
	    	formaction="<%=path%>/modifyDaily.html" 
	    	onclick="this.form.mod.value='3'"/>
	    	<input type="submit" class="layui-btn layui-btn-disabled" name="next" id="medi" value="打卡所选老人用药"
	    	formaction="<%=path%>/modifyDaily.html" 
	    	onclick="this.form.mod.value='4'"/>
	       <input type="submit" class="layui-btn" name="next" value="返回" 
              formaction="<%=path%>/hugong.jsp"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
	<input type="hidden" id="mod" name="mod" value="1">
</form>
</body>
</html>