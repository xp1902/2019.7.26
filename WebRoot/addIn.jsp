<%@ page language="java" import="java.util.*"
	import="com.neusoft.system.tools.Tools" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<script src="layui/uselayui.js"></script>
<script src="js/layer-v3.1.1/layer/layer.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var now = new Date();
		//��ʽ���գ����С��9��ǰ�油0 
		var day = ("0" + now.getDate()).slice(-2);
		//��ʽ���£����С��9��ǰ�油0 
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		//ƴװ�������ڸ�ʽ 
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		document.getElementById("date").value = (today);
	}
</script>

</head>
<body>
	<br>
	<form id="myform" method="post" action="" class="layui-form">
	<c:choose>
		<c:when test="${ins.aaq102 == null}">
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">���ݱ��</label>
						<div class="layui-input-block">
							<input type="text" name="aaq102" id="aaq102"
								value="<%=Tools.getEmpNumber()%>" class="layui-input"
								readonly="readonly" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">��Ʒ����</label>
						<div class="layui-input-block">
							<c:choose>
								<c:when test="${param.name != 'undefined'}">
									<input type="text" name="name" id="name" value="${param.name }"
										class="layui-input" readonly="readonly"/>
								</c:when>
								<c:otherwise>
									<input type="text" name="name" id="name" class="layui-input" />
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">��������</label>
						<div class="layui-input-block">
							<input type="text" name="aaq104" id="aaq104"
								value="${ins.aaq104 }" class="layui-input" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">�������</label>
						<div class="layui-input-block">
							<input type="text" name="aaq103" id="date" lay-verify="date"
								value="${ins.aaq103 }" class="layui-input" readonly="readonly">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">�Ƶ���</label>
						<div class="layui-input-block">
							<input type="text" name="next" id="next" value="����Ա"
								class="layui-input" readonly="readonly" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">������</label>
						<div class="layui-input-block">
							<input type="text" name="aak103" id="aak103" value=""
								class="layui-input" readonly="readonly" />
						</div>
					</div>
				</div>

				<c:if test="${param.name == 'undefined'}">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">��λ</label>
							<div class="layui-input-block">
								<input type="text" name="aap104" id="aap104" value=""
									class="layui-input" />
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">����</label>
							<div class="layui-input-block">
								<input type="text" name="aap105" id="aap105" value=""
									class="layui-input" />
							</div>
						</div>
					</div>

				</c:if>
				<div class="layui-form-item">
					<label class="layui-form-label">��ע</label>
					<div class="layui-input-block">
						<c:choose>
							<c:when test="${param.aap103 != 'undefined'}">
								<textarea name="aaq105" id="aaq105" class="layui-textarea"
									style="width: 500px;">${param.aap103}</textarea>
							</c:when>
							<c:otherwise>
								<textarea name="aaq105" id="aaq105" class="layui-textarea"
									style="width: 500px;">${ins.aaq105}</textarea>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<input type="hidden" name="aap101" id="aap101" value="${param.aap101 }">
				<input type="hidden" name="aak101" value="${sessionScope.aak101 }"> 
				<input type="hidden" name="pcode" value="0">
		</c:when>
		<c:otherwise>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">���ݱ��</label>
						<div class="layui-input-block">
							<input type="text" name="aaq102" id="aaq102"
								value="${ins.aaq102 }" class="layui-input" readonly="readonly" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">��Ʒ����</label>
						<div class="layui-input-block">
							<input type="text" name="name" id="name" value="${ins.name }"
								class="layui-input" readonly="readonly" />
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">��������</label>
						<div class="layui-input-block">
							<input type="text" name="aaq104" id="aaq104"
								value="${ins.aaq104 }" class="layui-input" readonly="readonly" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">�������</label>
						<div class="layui-input-block">
							<input type="text" name="aaq103" id="date" lay-verify="date"
								value="${ins.aaq103 }" readonly="readonly" class="layui-input">
						</div>
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">�Ƶ���</label>
						<div class="layui-input-block">
							<input type="text" name="next" id="next" value="����Ա"
								class="layui-input" readonly="readonly" />
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">������</label>
						<div class="layui-input-block">
							<input type="text" name="aak103" id="aak103" value="1"
								class="layui-input" readonly="readonly" />
						</div>
					</div>
				</div>


				<div class="layui-form-item">
					<label class="layui-form-label">��ⱸע</label>
					<div class="layui-input-block">
						<textarea name="aaq105" id="aaq105" class="layui-textarea"
							style="width: 500px;">${ins.aaq105}</textarea>
					</div>
				</div>
				<input type="hidden" name="aap101" value="${param.aap101 }">
				<input type="hidden" name="aak101" value="${sessionScope.aak101 }">
		</c:otherwise>
	</c:choose>
	</form>
</body>
</html>