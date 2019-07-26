<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
	<title>addvol</title>
	<script language=javascript> 
	   setTimeout("document.form1.submit()",1) 
	</script> 
</head>
<body>
	${msg}
	<br>
	<br>
	<form name="form1" action="<%=path%>/volHome.html" method="post">		
			<e:hidden  name="aan101" defval="${ins.aan101 }"/>
			<e:hidden  name="aau101" defval="${ins.aau101 }"/>
	</form>

</body>
</html>