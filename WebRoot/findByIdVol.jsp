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
</head>
<body>
<form id="myform" method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">
		       <caption>
			           志愿者详细信息
			    <hr width="160">
			   </caption>
			   <tr>
			     <td>姓名</td>
			     <td>${ins.aan102 }</td>
			   </tr>
			   <tr>
			     <td>性别</td>
			     <td>
			     <div id="div1">
			       <e:radio readonly="true" value="男:1,女:2,不确定:3" name="aan103" defval="${ins.aan103 }"/>
			     </div>
			     </td>
			   </tr>
			   <tr>
			     <td>出生日期</td>
			     <td>${ins.aan104 }</td>
			   </tr>
			   <tr>
			     <td>联系电话</td>
			     <td>${ins.aan105 }</td>
			   </tr>
			   <tr>
			     <td>所属单位</td>
			     <td>${ins.aan106 }</td>
			   </tr>
			   <tr>
			     <td>综合评分</td>
			     <td>${ins.aan108 }</td>
			   </tr>	
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
	       			<input type="submit" class="layui-btn" name="next" value="返回" 
             		 formaction="<%=path%>/queryHVolRe.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
		<input type="hidden" name="qaan102" value="${param.qaan102 }"/>
		<input type="hidden" name="qaan103" value="${param.qaan103 }"/>
		<input type="hidden" name="baao104" value="${param.baao104 }"/>
		<input type="hidden" name="eaao104" value="${param.eaao104 }"/>
	</form>
</body>
</html>