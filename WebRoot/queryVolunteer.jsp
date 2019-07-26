<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<style>
        input {
            height: 33px;
            line-height: 33px;
            padding: 0 7px;
            padding-left: 5px;
            border: 1px solid #ccc;
            border-radius: 2px;
            margin-bottom: -2px;
            outline: none;
        }

        input:focus {
            border-color: #009E94;
        }
        .layui-icon .layui-tree-102 .layui-tree-leaf:before {
		    content: "\e621";
		}
        
        .layui-btn:not(.layui-btn-lg ):not(.layui-btn-sm):not(.layui-btn-xs) {
		    height: 34px;
		    line-height: 34px;
		    padding: 0 8px;
		}
		
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>־Ը����˹���</legend>
            <table class="layui-table" style="width:75%;align:center;">
			<tr>
				<td>ʱ�䷶Χ</td><td align="center">
				<input type="text" name="baao102" id="date" lay-verify="date" class="layui-input" style="width:120px;padding-left: 5px;">		  
			    </td><td align="center">
			    <input type="text" name="eaao102" id="date1" lay-verify="date1" class="layui-input" style="width:120px;padding-left: 5px;">	  
                </td><td>״̬ </td><td>
				<e:select value="δ���:1,ͨ��:2,δͨ��:3" name="aao103"/>
                </td><td align="center">
			    <input type="text" name="aan106"  id="aan106" placeholder="��������"  class="layui-input" style="width:120px;padding-left: 5px;">
			    </td><td>
			    <button class="layui-btn layui-icon" id="searchBtn">��ѯ</button>
				</td>
			</tr>
			</table>
        </fieldset>
    </div>
<table class="layui-hide" id="test" lay-filter="test">
	
</table>
 
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="reject">�ܾ�</button>
    <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="verify">���</button>
</script>
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">�༭</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">ɾ��</a>
</script>
 
<script>
layui.use('table', function(){
  var table = layui.table;

  var $ = layui.$, active = {
  	reload:function(){
  		var aao103 =$("#aao103").val();
  		var aan106 =$("#aan106").val();
  		var baao102 =$("#date").val();
  		var eaao102 =$("#date1").val();
  		if(1){
  			console.log(aao103);
  			table.reload('test',
  			{page:
  				{
  					curr:1//���´ӵ�1ҳ��ʼ
  				}
  				,where:{
  					aao103:aao103,
  					aan106:aan106,
  					baao102:baao102,
  					eaao102:eaao102}//���ﴫ���̨
  				,url:'<%=path%>/queryVolunteer.htm'
  				,method:'get'
  			});
  	}
  	}
  };
  $('#searchBtn').on('click', function(){
  	var type = 'reload';
  	active[type] ? active[type].call(this) : '';
  });
  
  table.render({
    elem: '#test'
    ,url:'<%=path%>/volunteer/queryVolunteer.htm'
    ,toolbar: '#toolbarDemo'
    ,cellMinWidth:50
    ,title: '֧����˱�'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'aao102', title:'����', fixed: 'left', unresize: true, sort: true}
      ,{field:'aan102', title:'����'}
      ,{field:'cnaan103', title:'�Ա�'}
      ,{field:'aan104', title:'��������'}
      ,{field:'aan105', title:'�绰'}
      ,{field:'aan106', title:'����'}
      ,{field:'cnaao103', title:'���'}
      ,{field:'aan108', title:'����'}
    ]]
    ,page: true
  });
  
  
  //ͷ�������¼�
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    var data = checkStatus.data;
    data = JSON.stringify(data);
    data = JSON.parse(data);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('ѡ���ˣ�'+ data.length + ' ��');
      break;
      case 'verify':
        return verify(data);
      case 'reject':
          return reject(data);
      break;
    };
  });
  
  
  function verify(data){
	  var aak101 = '<%=session.getAttribute("aak101") %>';
	  console.log(aak101);
	  var arr=[];
	  for(var i=0;i<eval(data).length;i++){ 
		  arr.push(data[i].aan101);
		}
	  layer.open({
		  	content:"��ȷ��ͬ��������",
			btn:['ȷ��', 'ȡ��'],
			yes:function(index, layero){
				$.ajax({
					type:"post",
					traditional: true,
					url:"<%=path%>/verifyVolunteer.htm",
					data:{'idlist': JSON.stringify(arr), 'aak101': aak101},
					success:function(data){
						if(JSON.parse(data).msg == '1'){
							layer.alert("��˳ɹ�������", {icon:1},function(index){
								layer.close(index);
								location.reload();
							});
						}
						else{
							layer.alert("���ʧ�ܣ�����", {icon:5});
						}
					},
					error:function(){
						layer.alert("���ʧ�ܣ�����", {icon:5})
					}
				});
			}
	  });
  }
  
  function reject(data){
	  var aak101 = '<%=session.getAttribute("aak101") %>';
	  var arr=[];
	  for(var i=0;i<eval(data).length;i++){ 
		  arr.push(data[i].aan101);
		}
	  layer.open({
		  	content:"��ȷ���ܾ���������",
			btn:['ȷ��', 'ȡ��'],
			yes:function(index, layero){
				$.ajax({
					type:"post",
					traditional: true,
					url:"<%=path%>/rejectVolunteer.htm",
					data:{'idlist': JSON.stringify(arr), 'aak101': aak101},
					success:function(data){
						if(JSON.parse(data).msg == '1'){
							layer.alert("�ɹ�������", {icon:1},function(index){
								layer.close(index);
								location.reload();
							});
						}
						else{
							layer.alert("ʧ�ܣ�����", {icon:5});
						}
					},
					error:function(){
						layer.alert("ʧ�ܣ�����", {icon:5})
					}
				});
			}
	  });
  }
  
  //�����й����¼�
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('���ɾ����ô', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.prompt({
        formType: 2
        ,value: data.email
      }, function(value, index){
        obj.update({
          email: value
        });
        layer.close(index);
      });
    }
  });
});


</script>
    
</body>
</html>