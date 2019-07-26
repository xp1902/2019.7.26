<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
</head>
<body><jsp:include page="header.jsp"></jsp:include>
<br>${msg }
<br>
<form action="<%=path%>/addEmp.html" method="post" class="layui-form" align="center">
<table  class="layui-table" lay-skin="row" align="center" width="45%" class="layui-table">
    <caption>
       员工添加
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">员工数据</td>
   </tr>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="aaj103" required="true" autofocus="true"/> 
     </td>
   </tr>
   <tr>
   		<td>身份证号</td>
   		<td><e:text name="aaj106" required="true" autofocus="true"/></td>
   </tr>
   <tr>
     <td>生日</td>
     <td>
       <e:date name="aaj105"  required="true"/>
     </td>
   </tr>
   <tr>
     <td>性别</td>
     <td>
        <e:radio name="aaj104" value="男:1,女:2,不确定:3"/>
     </td>
   </tr>
   <tr>
     <td>手机号码</td>
     <td>
       <e:text name="aaj108"  required="true"/> 
     </td>
   </tr>
   <tr>
   <td>护工级别</td>
   	<td>
   		<e:select value="特级:1,一级:2,二级:3,三级:4,普通:5" name="aaj109" required="true"/>
   	</td>
   </tr>
   <tr>
     <td>备注</td>
     <td>
       <e:textarea rows="5" cols="45" name="aaj110"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'添加':'修改' }"
              formaction="<%=path%>/addEmp.html" class="layui-btn">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryEmp.html"
              formnovalidate="formnovalidate" class="layui-btn">
     </td>
   </tr>
</table>
<input type="hidden" name="aaj101" value="${param.aab101 }">
<e:hidden name="qaaj103"/>
<e:hidden name="qaaj102"/>
<e:hidden name="baaj105"/>
<e:hidden name="eaaj105"/>
<e:hidden name="qaaj104"/>
<e:hidden name="qaaj109"/>
<e:hidden name="qaaj108"/>
<e:hidden name="qaaj106"/>

</form>
</body>
</html>