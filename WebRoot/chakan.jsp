<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>查看老人</title>
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
   
   	<script>
	
	
		layui.use('element', function(){
		  var element = layui.element;
		});
	</script>
   
    <style type="text/css">
	  #a{
	    outline:none;
	    border:0;		
	    }
     tr
     {
        height:45px;
     }
     #div1{
	    pointer-events: none;
	  }
	</style>
      
</head>
<body>

	<div class="layui-form-item">
		<form class="layui-form" id="form1" action="<%=path%>/zhiyuanJilu.html" method="post">
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

		
		    <!-- 查老人 -->
		  
			<table class="layui-table" style="width:90%;margin:30px auto;">
			  <caption>
			          老人信息
			    <hr width="160">
			  </caption>
		    </table>
			<!-- 数据迭代区 -->
			<table class="layui-table" style="width:90%;margin-left:auto;margin-right:auto;margin-top:30px;margin-bottom:0px;" >
			  <thead>
			  <tr>
			    <td></td>
			    <td>编号</td>
			    <td>姓名</td>
			    <td>性别</td>
			    <td>兴趣</td>
			    <td>民族</td>
			    <td>出生日期</td>
			    <td>政治面貌</td>    
			    <td>床位</td>
			  </tr>
			  </thead>
			   <c:choose>
			     <c:when test="${rows!=null }">
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="ins" varStatus="vs">
			    	   	  <tr>
						    <td>${vs.count }</td>				    
						    <td>${ins.aab102 }</td>
						    <td>${ins.aab103  }</td>
						    <td>
							    <div id="div1">
								   <c:if test="${ins.aab104=='1'}">
										            男
								   </c:if>
								   <c:if test="${ins.aab104=='2'}">
										            女
								   </c:if>
								   <c:if test="${ins.aab104=='3'}">
										            不确定
								   </c:if>
							   </div>
						   </td>
						    <td>${ins.aab105 }</td>
						    <td> <div id="div1"><e:select name="aab107" readonly="true" value="汉族:01,壮族:02,满族:03,回族:04,苗族:05,
		                                                                                                 维吾尔族:06,土家族:07,彝族:08,蒙古族:09,藏族:10,
		                                                                                                 布依族:11,侗族:12,瑶族:13,朝鲜族:14,白族:15,
		                                                                                                 哈尼族:16,哈萨克族:17,黎族:18,傣族:19,畲族:20,
		                                                                                                 傈僳族:21,仡佬族:22,东乡族:23,高山族:24,拉祜族:25,
		                                                                                                 水族:26,佤族:27,纳西族:28,羌族:29,土族:30,
		                                                                                                 仫佬族:31,锡伯族:32,柯尔克孜族:33,达斡尔族:34,景颇族:35,
		                                                                                                 毛南族:36,撒拉族:37,布朗族:38,塔吉克族:39,阿昌族:40,
		                                                                                                 普米族:41,鄂温克族:42,怒族:43,京族:44,基诺族:45,
		                                                                                                 德昂族:46,保安族:47,俄罗斯族:48,裕固族:49,乌孜别克族:50,
		                                                                                                 门巴族:51,鄂伦春族:52,独龙族:53,塔塔尔族:54,赫哲族:55,
		                                                                                                 珞巴族:56" defval="${ins.aab107 }"/></div></td>
						    <td>${ins.aab108 }</td>
							<td>${ins.aab109 }</td>
							<td>${ins.aai102 }号楼${ins.aai103 }层${ins.aai104 }房${ins.aai105 }床</td>
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
			       <input class="layui-btn" type="submit" name="next" formaction="<%=path%>/chakanHuogng.html" value="返回">
		
			    </td>
			  </tr>
			</table>
			<e:hidden name="aau101" value="${param.aau101 }"/>
		    <e:hidden name="aan101" value="${param.aan101 }"/>
		    <e:hidden name="aaj101" value="${param.aaj101 }"/>
		    <e:hidden name="aao101" value="${param.aao101 }"/>
		</form>
	</div>
</body>
</html>