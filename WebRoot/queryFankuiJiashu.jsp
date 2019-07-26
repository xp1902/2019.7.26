<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>已提交的反馈意见</title>
   

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
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaat101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/FindByIdFankuiJiashu.html?aat101="+vaat101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaat101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/DelByIdFankuiJiashu.html?aat101="+vaat101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
   
<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**颐养中心</a></li>
  <li class="layui-nav-item layui-this"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">入住服务</a></li>
  <li class="layui-nav-item" style="float:right;margin-right:50px;">
    <a href="javascript:;">我</a>
    <dl class="layui-nav-child"> <!-- 二级菜单 -->
      <dd>
        <a href="<%=path%>/FindByIdJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">个人信息</a>
      </dd>
      <dd>
        <a href="<%=path%>/userLogin.jsp">退出登录</a>
      </dd>
    </dl>
  </li>
</ul>
 
   <script>
   layui.use('element', function(){
     var element = layui.element;
     //…
   });
   </script>
   
</head>
<body>

<form id="myform" action="<%=path%>/QueryFankuiJiashu.html" method="post">

${msg }
<br>
  <!-- 查询条件区 -->
	<table class="layui-table" style="width:90%;margin:30px auto;">
	  <caption>
	               外出事项记录
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="8">查询条件</td>
	  </tr>
	  <tr>
	    <td>反馈人</td>
	    <td>
	      <e:text name="qaat103"/>
	    </td>
	    <td>反馈人联系电话</td>
	    <td>
	      <e:text name="qaat104"/>
	    </td>
	    <td>反馈内容</td>
	    <td>
	      <e:text name="qaat105"/>
	    </td>
	    <td>处理管理员</td>
	    <td>
	      <e:text name="qaak103"/>
	    </td>
	  </tr>
	  <tr>
	    <td>反馈日期[B]</td>
	    <td>
	      <e:date name="baat102"/>
	    </td>
	    <td>反馈日期[E]</td>
	    <td>
	      <e:date name="eaat102"/>
	    </td>
	    <td>解决与否</td>
	    <td>
	      <e:radio name="qaat106" value="未处理:1,已处理:2,不限定:''" defval=""/>
	    </td>
	  </tr>
	</table>
	<!-- 数据迭代区 -->
	<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;;">
	  <tr>
	    <td></td>
	    <td>(序号)</td>
	    <td>反馈日期</td>
	    <td>反馈人</td>
	    <td>反馈人联系电话</td>
	    <td>反馈内容</td>
	    <td>处理管理员</td>
	    <td>解决与否</td>
	    <td></td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				    <c:if test="${ins.aat106 == '1'}">
				      <input type="checkbox" name="idlist" value="${ins.aat101 }"
				             onclick="onSelect(this.checked)" >
				    </c:if>
				    </td>
				    <td>${vs.count }</td>
				    <td>
				      <!-- #  空锚 -->
				      <a href="#" onclick="onEdit('${ins.aat101}')">${ins.aat102 }</a>
				    </td>
				    <td>${ins.aat103 }</td>
				    <td>${ins.aat104 }</td>
				    <td>${ins.aat105 }</td>
				    <td>${ins.aak103 }</td>
				    <td>${ins.cnaat106 }</td>
				    <td>
				    <c:if test="${ins.aat106 == '1'}">
				      <a href="#" onclick="onDel('${ins.aat101}')">删除</a>
				    </c:if>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
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
	           </tr>
	        </c:forEach>
	     </c:otherwise>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table class="layui-table" style="width:90%;margin-left: auto;margin-right: auto;margin-bottom:30px;">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询"  class="layui-btn layui-btn-sm">
	       <input type="submit" id="del" name="next" value="删除"  class="layui-btn layui-btn-sm"
	              formaction="<%=path%>/delFankuiJiashu.html"  disabled="disabled">
	       <input type="submit" name="next" value="返回"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/Ruyuan.html"
              formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	
	<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
    <input type="hidden" name="aab101" value="${empty ins.aab101?param.aab101:ins.aab101 }">
    <input type="hidden" name="aac104" value="${empty ins.aac104?param.aac104:ins.aac104 }">
    <input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>
	
</form>
</body>
</html>