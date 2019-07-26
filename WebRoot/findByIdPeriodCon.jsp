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
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){var element = layui.element;});
</script>
	<script type="text/javascript">
	window.onload=function()
	{
		var a=${empty ins};
		if(a)
		{
			var now = new Date(); 
			//格式化日，如果小于9，前面补0 
			var day = ("0" + now.getDate()).slice(-2); 
			//格式化月，如果小于9，前面补0 
			var month = ("0" + (now.getMonth() + 1)).slice(-2); 
			//拼装完整日期格式 
			var today = now.getFullYear()+"-"+(month)+"-"+(day) ; 
			document.getElementById("aag102").value=(today);
		}
	}
	</script>
</head>
<body>
	<form id="myform" method="post" action="" class="layui-form">
		<table class="layui-table" style="width:50%;margin:30px auto;">
			<caption>${empty param.aag101?'添加':'修改' }入住人近况信息<hr width="160"></caption>
			<tr>
				<td>姓名</td>
				<td>${param.aab103 }</td>
			</tr>
			<tr>
				<td>饮食特点</td>
				<td><e:text name="aag103" defval="${ins.aag103 }"/></td>
			</tr>
			<tr>
				<td>性格心理</td>
				<td><e:text name="aag104"  defval="${ins.aag104 }"/></td>
			</tr>
			<tr>
				<td>爱好</td>			
				<td><e:text name="aag105" defval="${ins.aag105 }"/></td>
			</tr>
			<tr>
				<td>异常表现</td>
				<td><e:text name="aag106" defval="${ins.aag106 }"/></td>
			</tr>
			<tr>
				<td>特殊要求</td>
				<td><e:text name="aag107" defval="${ins.aag107 }"/></td>
			</tr>
			<tr>
				<td>更新日期</td>
				<td><e:date name="aag102" id="aag102" defval="${ins.aag102 }"/></td>
			</tr>
			<tr>
				<td>备注</td>
				<td><e:textarea  rows="5" cols="40" name="aag108" defval="${ins.aag108 }"/></td>
			</tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
				<input type="submit" class="layui-btn" name="next" value="${empty param.aag101?'添加':'修改' }"
              formaction="<%=path%>/${empty param.aag101?'add':'modify' }PeriodCon.html">
	       			<input type="submit" class="layui-btn" name="next" value="返回" 
             		 formaction="<%=path%>/queryEPeriodCon.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
		<input type="hidden" name="aab101" value="${empty param.aab101?ins.aab101:param.aab101 }"/>
		<input type="hidden" name="aag101" value="${empty param.aag101?ins.aag101:param.aag101 }"/>
	</form>
</body>
</html>