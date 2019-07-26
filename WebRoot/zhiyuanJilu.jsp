<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
    <title>志愿记录</title>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
   
      
   <script type="text/javascript">
	    function onDel(vaao101)
	    {
	  	    var vform = document.getElementById("myform");
	  	    vform.action="<%=path%>/shancZhiyuan.html?aao101="+vaao101;
	  	    //alert(vform.action);
	  	    vform.submit();
	    }    
	    
	    function onGai(vaao101)
	    {
	  	    var vform = document.getElementById("myform");
	  	    vform.action="<%=path%>/yuyVol.html?aao101="+vaao101;
	  	    //alert(vform.action);
	  	    vform.submit();
	    } 
		   
        function onEdit(vaao101)
        {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/zhiyXijie.html?aao101="+vaao101;
	    	 //alert(vform.action);
	    	 vform.submit();
        }
   
    </script>
   	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
    <style type="text/css">
     tr
     {
        height:45px;
     }
   </style>
</head>
<body>

	<div class="layui-form-item">
		<form class="layui-form" id="myform" action="<%=path%>/zhiyuanJilu.html" method="post">
			 <ul class="layui-nav" lay-filter="">
			   <li class="layui-nav-item"><a href="<%=path%>/vol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">首页</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/yuyueVol.jsp?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">预约志愿</a></li>
			   <li class="layui-nav-item layui-this"><a href="<%=path%>/zhiyuanJilu.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿记录</a></li>
			   <li class="layui-nav-item"><a href="<%=path%>/zhiyuanTuandui.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">志愿团队</a></li>
			   <li class="layui-nav-item" style="float:right;margin-right:20px">
			     <a href="javascript:;">我</a>
			     <dl class="layui-nav-child"> <!-- 二级菜单 -->
			       <dd><a href="<%=path%>/qaddVol.html?aan101=${empty ins.aan101?param.aan101:ins.aan101 }">个人中心</a></dd>
			       <dd><a href="<%=path%>/shouye.jsp">退出登录</a></dd>
			     </dl>
			   </li>
			 </ul>
			${msg}
		    <br>
		    <br>
		  <!-- 查询条件区 -->
			<table class="layui-table" style="width:90%;margin:30px auto;">
			  <caption>
			           志愿记录
			    <hr width="160">
			  </caption>
		    </table>
			<!-- 数据迭代区 -->
			<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;">
			  <thead>
			  <tr>
			    <th></th>
			    <th>申请日期</th>
			    <th>审核意见</th>
			    <th>志愿日期</th>
                <th>查看修改预定</th>
                <th>取消预定</th>
			  </tr>
			  </thead>
			  
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td><c:if test="${ins.aao103=='2'}">
						            <a href="#" onclick="onEdit('${ins.aao101}')">
						        </c:if>${vs.count }</a>
						    </td>				    
						    <td>${ins.aao102 }</td>
						    <td>
						        <c:if test="${ins.aao103=='1'}">
						                  待处理
						        </c:if>
						        <c:if test="${ins.aao103=='2'}">
						                  审核通过
						        </c:if>
						        <c:if test="${ins.aao103=='3'}">
						                  审核未通过
						        </c:if>
						    </td>
						    <td>${ins.aao104 }</td>	
						    <td>
						        <c:if test="${ins.aao103 == '2'}">
				                    <a href="#" onclick="onEdit('${ins.aao101}')">查看</a>
				                </c:if>
						        <c:if test="${ins.aao103 == '1'}">
				                    <a href="#" onclick="onGai('${ins.aao101}')">修改</a>
				                </c:if>
				            </td>
						    <td>
						        <c:if test="${ins.aao103 == '1'}">
				                    <a href="#" onclick="onDel('${ins.aao101}')">取消预定</a>
				                </c:if>
				            </td>									    
						  </tr>
				      </c:forEach>
				      <!-- 补充空行 -->
				      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="10">
					          <tr>
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
			        <c:forEach begin="1" step="1" end="10">
			           <tr>
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
			       <input class="layui-btn" type="submit" name="next" formaction="<%=path%>/vol.jsp" value="返回">
		
			    </td>
			  </tr>
			</table>
			<e:hidden name="aau101" value="${param.aau101 }"/>
		    <e:hidden name="aan101" value="${param.aan101 }"/>
		</form>
	</div>
</body>
</html>