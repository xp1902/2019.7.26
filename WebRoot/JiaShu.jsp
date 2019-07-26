<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">

.layui-btn {
background-color:#393D49;
}


</style>

<script type="text/javascript">

</script>
   <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="js/layer-v3.1.1/layer/layer.js"></script>
   <link rel="stylesheet" href="layui/css/layui.css">
   <script src="layui/layui.js"></script>
   <script src="layui/uselayui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>¼ÒÊôÖ÷Ò³</title>

<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item layui-this"><a href="<%=path%>/JiashuHome.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">**ÒÃÑøÖÐÐÄ</a></li>
  <li class="layui-nav-item"><a href="<%=path%>/FindByIdRuyuan.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">Èë×¡·þÎñ</a></li>
  <li class="layui-nav-item" style="float:right;margin-right:50px;">
    <a href="javascript:;">ÎÒ</a>
    <dl class="layui-nav-child"> <!-- ¶þ¼¶²Ëµ¥ -->
      <dd>
        <a href="<%=path%>/FindByIdJiashu.html?aad101=${empty ins.aad101?param.aad101:ins.aad101 }&&aau101=${empty ins.aau101?param.aau101:ins.aau101 }">¸öÈËÐÅÏ¢</a>
      </dd>
      <dd>
        <a href="<%=path%>/userLogin.jsp">ÍË³öµÇÂ¼</a>
      </dd>
    </dl>
  </li>
</ul>
 
<script>
//×¢Òâ£ºµ¼º½ ÒÀÀµ element Ä£¿é£¬·ñÔòÎÞ·¨½øÐÐ¹¦ÄÜÐÔ²Ù×÷
layui.use('element', function(){
  var element = layui.element;
  
  //¡­
});
</script>


</head>
<body>
<form method="post">

<section>
  <div style="width:80%;margin:0px auto;z-index:1;">
    <img src="./images/home.jpg" style="width:100%;height:500px">
    <div>
    </div>
  </div>
</section>
<fieldset class="layui-elem-field" style="width:60%;margin:10px auto;padding:5px 10px;">
  <legend style="font-size: 40px;line-height: 1.2;color: #204479;margin-bottom: 0.5em;">**ÒÃÑøÖÐÐÄ</legend>
  <div class="layui-field-box" style="font-size: 18px;line-height: 1.5;color: #7d7d7d;margin: 0;">
     **ÒÃÑøÖÐÐÄ»ùÓÚÖÐ¹úÑøÀÏ·þÎñÐÐÒµ³õ²½·¢Õ¹¡¢¾Þ´óÑøÀÏÐèÇóØ½´ý½â¾öµÄÏÖ×´£¬**ÒÃÑøÖÐÐÄ·ÅÑÛ³¤ÆÚÎÈ½¡·¢Õ¹£¬»ý¼«Ì½Ë÷¼ÈÊÊºÏÖÐ¹ú¹úÇé¡¢ÓÖÓëÅ·ÖÞ±ê×¼½Ó¹ìµÄ³¤ÆÚÕÕ»¤ÑøÀÏ·þÎñÄ£Ê½¡£
  </div>
</fieldset>

<input type="hidden" name="aad101" value="${empty ins.aad101?param.aad101:ins.aad101 }">
<input type="hidden" name="aau101" value="${sessionScope.aau101 }"/>
</form>
</body>
</html>