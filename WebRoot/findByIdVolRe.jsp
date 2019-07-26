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
   	window.onload=function(){
   		var v=document.getElementById("aao107").value/2;
   	  layui.use('rate', function(){
   	    var rate = layui.rate;
   	   
   	    //渲染
   	    var ins1 = rate.render({
   	    	elem: '#eaao107' , //绑定元素
   	    	half:'true',
   	    	value:v,
   	    	choose: function(vvalue){
   				document.getElementById("aao107").value=vvalue*2;
   	        }
   	    });
   	  });
   	}
   	
  </script>  
</head>
<body>
<form id="myform" method="post" action="" class="layui-form">
	<table class="layui-table" style="width:50%;margin:30px auto;">
		<caption>志愿情况详细信息<hr width="160"></caption>
		  <tr>
		    <td>志愿者姓名</td>
		    <td>${empty ins.aan102?param.aan102:ins.aan102 }</td>
		  </tr>
		
			
		  <tr>
		    <td>志愿者性别</td>
		    <td>
    			<e:radio name="aan103" value="男:1,女:2,不确定:3" defval="${empty ins.aan103?param.aan103:ins.aan103 }"/>
     		</td>
		  </tr>
		
			
		  <tr>
		    <td>志愿者联系电话</td>
		    <td>${empty ins.aan105?param.aan105:ins.aan105 }</td>
		  </tr>
		
			
		  <tr>
		    <td>志愿日期</td>
		    <td>${empty ins.aao104?param.aao104:ins.aao104 }</td>
		  </tr>
		  
		  <tr>
		    <td>志愿内容</td>
		    <td>
		      <e:text  name="aao105" defval="${empty ins.aao105?param.aao105:ins.aao105 }"/>
		    </td>
		  </tr>
		  <tr>
		    <td>完成情况</td>
		    <td>
		      <e:radio name="aao106" value="未记录:1,已完成:2,未完成:3" defval="${empty ins.aao106?param.aao106:ins.aao106 }"/>
		    </td>  
		  </tr>
		  <tr>
		    <td>评分</td>
		    <td>
		    	<div id="eaao107"></div>
		      	<e:hidden name="aao107"  defval="${empty ins.aao107?param.aao107:ins.aao107 }"/>
		    </td>  
		  </tr>
		</table>		
		<table class="layui-table">
			<tr>
				<td align="center">
				<input type="submit" class="layui-btn" name="next" value="提交评分"
              formaction="<%=path%>/modifyHVolRe.html">
	       			<input type="submit" class="layui-btn" name="next" value="返回" 
             		 formaction="<%=path%>/queryHVolRe.html"
             		 formnovalidate="formnovalidate">
	    		</td>
			</tr>
		</table>
		<input type="hidden" name="aaj101" value="${sessionScope.aaj101 }"/>
		<input type="hidden" name="aao101" value="${empty param.aao101?ins.aao101:param.aao101 }"/>
		<input type="hidden" name="qaan102" value="${param.qaan102 }"/>
		<input type="hidden" name="qaan103" value="${param.qaan103 }"/>
		<input type="hidden" name="baao104" value="${param.baao104 }"/>
		<input type="hidden" name="eaao104" value="${param.eaao104 }"/>
	</form>
</body>
</html>