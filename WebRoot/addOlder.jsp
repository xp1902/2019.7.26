<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>添加/修改入住人信息</title>

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

<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>

<script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
</head>
<body>
<p ${empty param.aab101?'style':'hidden' }>未提交申请</p>
<p ${param.aac104 eq 1?'style':'hidden' }>申请已提交，待审批</p>
<p ${param.aac104 eq 3?'style':'hidden' }>申请已提交，审批失败</p>
<form action="<%=path%>/addOlder.html" method="post" class="layui-form">
<ul class="layui-nav layui-nav-tree" lay-filter="test" style="position:fixed;margin-top:50px;">
  <div ${ins.aac104 eq 2?'hidden':'style' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            预约入住
   </a>
  </li>
  </div>
  <div ${ins.aac104 eq 2?'style':'hidden' }>
  <li class="layui-nav-item">
   <a href="<%=path%>/FindByIdAxx01.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            查看预约情况
   </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/FindByIdOlderHealthy.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人健康状况
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/addOlderChufang.jsp?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人处方添加
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryChufang.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             处方查询
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderDaily.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人日常信息
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderPeriodCon.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             入住人近况
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryOlderOut.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
             外出事项记录
     </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/OutOlder.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            申请外出
    </a>
  </li>
  </div>
  <li class="layui-nav-item">
    <a href="<%=path%>/FankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            反馈意见
    </a>
  </li>
  <li class="layui-nav-item">
    <a href="<%=path%>/QueryFankuiJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aab101=${empty ins.aab101?param.aab101:ins.aab101 }&&aac104=${empty ins.aac104?param.aac104:ins.aac104 }&&aau101=${sessionScope.aau101 }">
            反馈记录
    </a>
  </li>
</ul>
${msg}
<table class="layui-table" style="width:50%;margin:30px auto;">
    <caption>
       入住人信息${empty param.aab101?'添加':'修改' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">入住人信息</td>
   </tr>
   <c:if test="${!empty ins.aab101 }">
	   <tr>
	     <td>编号</td>
	     <td>
	       <e:text name="aab102"  readonly="true" defval="${ins.aab102 }"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="aab103" required="true" defval="${ins.aab103 }"/> 
     </td>
   </tr>
   <tr>
     <td>性别</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:radio name="aab104" value="男:1,女:2,不确定:3" defval="${empty param.aab101?'1':ins.aab104 }"/>
     </td>
   </tr>
   <tr>
     <td>兴趣</td>
     <td>
       <e:text name="aab105"   defval="${ins.aab105 }"/>
     </td>
   </tr>
   <tr>
     <td>户籍</td>
     <td>
        <e:text name="aab106"  required="true" defval="${ins.aab106 }"/> 
     </td>
   </tr>
   <tr>
     <td>民族</td>
     <td>
       <e:select name="aab107" value="汉族:1,蒙古族:2,回族:3,藏族:4,维吾尔族:5,
                                                                                                   苗族:6,彝族:7,壮族:8,布依族:9,朝鲜族:10,
                                                                                                   满族:11,侗族:12,瑶族:13,白族:14,土家族:15,
                                                                                                   哈尼族:16,哈萨克族:17,傣族:18,黎族:19,傈僳族:20,
                                                                                                   佤族:21,畲族:22,高山族:23,拉祜族:24,水族:25,
                                                                                                   东乡族:26,纳西族:27,景颇族:28,柯尔克孜族:29,土族:30,
                                                                                                   达斡尔族:31,仫佬族:32,羌族:33,布朗族:34,撒拉族:35,
                                                                                                   毛难族:36,仡佬族:37,锡伯族:38,阿昌族:39,普米族:40,
                                                                                                   塔吉克族:41,怒族:42,乌孜别克族:43,俄罗斯族:44,鄂温克族:45,
                                                                                                   崩龙族:46,保安族:47,裕固族:48,京族:49,塔塔尔族:50,
                                                                                                   独龙族:51,鄂伦春族:52,赫哲族:53,门巴族:54,珞巴族:55,
                                                                                                   基诺族:56,其他:57" defval="${ins.aab107 }" />
     </td>
   </tr>
   <tr>
     <td>出生日期</td>
     <td>
       <e:date name="aab108"  required="true" defval="${ins.aab108 }"/>
     </td>
   </tr>
   <tr>
     <td>政治面貌</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:select name="aab109" value="中共党员:1,中共预备党员:2,共青团员:3,民革党员:4,民盟盟员:5,
                                                                                                     民建会员:6,民进会员:7,农工党党员:8,致公党党员:9,九三学社社员:10,
                                                                                                     台盟盟员:11,无党派人士:12,群众:13" defval="${ins.aab109 }" />
     </td>
   </tr>
   <tr>
     <td>紧急联系人手机号</td>
     <td>
       <e:text name="aab110"  required="true" defval="${ins.aab110 }"/>
     </td>
   </tr>
   <tr>
     <td>身份证号</td>
     <td>
        <e:text name="aab112" required="true" defval="${ins.aab112 }"/>
     </td>
   </tr>
   <tr>
     <td>医疗保险</td>
     <td>
       <e:text name="aab113"  defval="${ins.aab113 }"/>
     </td>
   </tr>
   <tr>
     <td>护理级别</td>
     <td>
       <e:select name="aab114" value="特级:1,一级:2,二级:3,三级:4,普通:5" defval="${ins.aab114 }" />
     </td>
   </tr>
   <tr>
     <td></td>
     <td>
     <textarea rows="8" cols="75" readonly>
普通护理：个人生活基本自理，护工负责一日三餐。
三级护理：个人生活基本能自理，但身体素质差，脑瘫且神志不清者。
二级护理：个人生活能力部分依赖他人的老人，半身不遂，但饮食及大小便能够自理。
一级护理：体质差，行动困难或双目失明，痴呆，神志不清的，但大小便基本能自理。
特级护理：生活完全不能自理，长期卧床，大小便失禁或有精神障碍的老人，在生活方面要求给予特殊照顾者。
     </textarea>
     </td>
   </tr>
   <tr>
     <td>申请入院日期</td>
     <td>
       <e:date name="aac103"  required="true" defval="${ins.aac103 }"/>
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aab101?'预约入住':'预约修改' }"  class="layui-btn layui-btn-sm"
              formaction="<%=path%>/${empty param.aab101?'addOlder':'modifyOlderYuyue' }.html">
       <input type="submit" name="next" value="返回"   class="layui-btn layui-btn-sm"
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