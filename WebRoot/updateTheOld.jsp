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
	<script type="text/javascript">
		function onSelectBedClick(vaab101){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/bed/queryBed.html?aab101="+vaab101;
			myform.submit();
		}
		function onQueryFamilies(vaab101, bool){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/families/queryFamilies.html?aab101=" + vaab101 + "&fkel=" + bool;
			myform.submit();
		}
		function onQueryFamilies2(vaab101){
			var myform = document.getElementById("myform");
			myform.action="<%=path%>/families/queryFamilies.html?aab101=" + vaab101;
			myform.submit();
		}
	</script>
</head>
<body><jsp:include page="header.jsp"></jsp:include>
	<form id="myform" method="post" action="" class="layui-form">
		<table align="center" class="layui-table" lay-skin="row" style="width:30%;margin:30px auto;" class="layui-table">
		<caption>入住人信息表<hr width="160"></caption>
			<tr>
				<td>编号</td>
				<td>
				<input type="text" name="aab102" id="aab102" value="${ins.aab102 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td>
				<input type="text" name="aab103" id="aab103" value="${ins.aab103 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
				<input type="text" name="aab104" id="aab104" value="${ins.cnaab104 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>大厦</td>
				<td>
				<input type="text" name="aaij102" id="aai102" value="${ins.aai102 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>房间号</td>
				<td>
				<input type="text" name="aai104" id="aai104" value="${ins.aai104 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>床位</td>
				<td>
				<input type="text" name="aai105" id="aai105" value="${ins.aai105 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>护工编号</td>
				<td>
				<input type="text" name="aaj102" id="aaj102" value="${ins.aaj102 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>护工姓名</td>
				<td>
				<input type="text" name="aaj103" id="aaj103" value="${ins.aaj103 }"
						class="layui-input" readonly="readonly" />
				</td>
			</tr>
		</table>		
		<table align="center" class="layui-table" lay-skin="row" class="layui-table" style="width:30%;margin:30px auto;">
			<tr align="center">
				<td><input type="submit" name="next" value="选择床位和护工" onclick="onSelectBedClick('${param.aab101}')"  class="layui-btn"/></td>
				<td>
				<c:choose>
					<c:when test="${empty ins.aai102 }">
						<input type="submit" name="next" value="查看家属信息" onclick="onQueryFamilies('${param.aab101}', '1')"  class="layui-btn"/>
					</c:when>
					<c:otherwise>
						<input type="submit" name="next" value="查看家属信息" onclick="onQueryFamilies2('${param.aab101}')"  class="layui-btn"/>
					</c:otherwise>
				</c:choose>
				</td>
				<td>
				<c:choose>
					<c:when test="${empty ins.aai102 }">
						<input type="submit" name="next" value="放弃返回" formaction="<%=path%>/appointment/queryAppointment.html"
              				formnovalidate="formnovalidate" class="layui-btn">
					</c:when>
					<c:otherwise>
						<input type="submit" name="next" value="放弃返回" formaction="<%=path%>/theold/queryTheOld.html"
              				formnovalidate="formnovalidate" class="layui-btn">
              		</c:otherwise>
				</c:choose>
              	</td>
			</tr>
		</table>
	</form>
</body>
</html>