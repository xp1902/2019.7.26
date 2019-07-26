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
${sessionScope.aak101 }
	<jsp:include page="header.jsp"></jsp:include>
    <div class="t_title">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>������</legend>
            <table class="layui-table" style="width:75%;align:center;">
			<tr>
				<td>ʱ�䷶Χ</td><td align="center">
				<input type="text" name="baar102" id="date" lay-verify="date" class="layui-input" style="width:120px;padding-left: 5px;">		  
			    </td><td align="center">
			    <input type="text" name="eaar102" id="date1" lay-verify="date" class="layui-input" style="width:120px;padding-left: 5px;">	  
                </td><td>״̬ </td><td>
				<select name="city" lay-verify="" class="layui-select" name="aar103" id="aar103">
				  <option value="1">δ����</option>
				  <option value="2">ͨ��</option>
				  <option value="3">δͨ��</option>
				</select> 
                </td><td align="center">
			    <input type="text" name="aaj103"  id="aaj103" placeholder="��������"  class="layui-input" style="width:120px;padding-left: 5px;">
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
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">��ȡѡ��������</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">��ȡѡ����Ŀ</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">��֤�Ƿ�ȫѡ</button>
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
  		var aar103= $("#aar103").val();
  		var aaj103 =$("#aaj103").val();
  		var baar102 =$("#date").val();
  		var eaar102 =$("#date1").val();
  		if(1){
  			console.log(baar102);
  			table.reload('test',
  			{page:
  				{
  					curr:1//���´ӵ�1ҳ��ʼ
  				}
  				,where:{aaj103:aaj103,
  					aar103:aar103,
  					baar102:baar102,
  					eaar102:eaar102}//���ﴫ���̨
  				
  				,url:'<%=path%>/outs/queryOuts.htm'
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
    ,url:'<%=path%>/outs/queryOuts.htm'
//     ,toolbar: '#toolbarDemo'
    ,cellMinWidth:100
    ,title: '֧����˱�'
    ,cols: [[
      {type: 'numbers', fixed: 'left'}
      ,{field:'aar102', title:'�ύ����', fixed: 'left', unresize: true, sort: true}
      ,{field:'cnaar103', title:'״̬'}
      ,{field:'aaj103', title:'����'}
      ,{field:'aar104', title:'�������'}
      ,{field:'aar105', title:'��ע', edit: 'text'}
      ,{align:'center', title:'�鿴'
      	,templet:function(d){
      		if(d.aar103 == '2'){
      			var queryBtn = '<a class="layui-btn layui-btn-xs" lay-event="query">�鿴</a>';
      		}else{
      			var queryBtn = '<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="verify">���</a>';
      		}
      		return queryBtn;
      	}	
      }
    ]]
    ,page: true
  });
  
  
  //ͷ�������¼�
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('ѡ���ˣ�'+ data.length + ' ��');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? 'ȫѡ': 'δȫѡ');
      break;
    };
  });
  
  function verify(pObj){
	  var aar101 = pObj.aar101;
	  var aak101 = ${sessionScope.aak101};
		layer.open({
			type: 2, //Layer�ṩ��5�ֲ����͡��ɴ����ֵ�У�0����Ϣ��Ĭ�ϣ�1��ҳ��㣩2��iframe�㣩3�����ز㣩4��tips�㣩,
			shade:0.8, //���ֲ�͸����
			area:['400px','500px'], //��������
			title:'���ⵥ��Ϣ',
			content: ['<%=path%>/findByIdOuts.html?aar101=' + aar101,'no'],
			btn:['���', '��ͨ��','����'],
			yes:function(index, layero){
				layer.close(index);
				var newsFrom = layer.getChildFrame('#myform', index);
				//ajax�ύ
				var params = newsFrom.serializeArray(); // http request parameters. 
/* 				params = encodeURI(params);
				params = JSON.stringify(params); */
				
				//ת��Ϊ����
				var aap101 = [];
				var aas102 = [];
				
				for(var i = 0; i < params.length; i ++){
					if(params[i].name == 'aap101'){
						aap101.push(params[i].value);
					}else{
						aas102.push(params[i].value);
					}
				}
				$.ajax({
					type: "POST",
					dataType: "json",
					traditional: true,
					url: '<%=path%>/verifyOuts.htm',
					data: {aap101: JSON.stringify(aap101), aas102: JSON.stringify(aas102), aak101:aak101, check:'true', aar101:aar101},
					success: function(data) {
						if(data.msg == '1'){
							layer.msg('����ɹ�',{offset:['50%'],time: 500},function(){location.reload();});
						}
						else
							layer.msg('����ʧ�ܣ�');
					},
					error: function() {
						layer.msg("����ʧ�ܣ�");
					}
				});
				
			},
			btn2:function(index, layero){
				layer.close(index);
				$.ajax({
					type:'post',
					url:'verifyOuts.htm',
					data:{'aak101':'1', 'aar101':aar101},
					success:function(data){
						if(data.msg == '0'){
							layer.msg('����ʧ�ܣ�');
						}
						else{
							layer.msg('����ɹ�',{offset:['50%'],time: 500},function(){location.reload();});
						}
					}
				});
			}
		});
  }
  
  
  function query(pObj){
	  var aar101 = pObj.aar101;
		layer.open({
			type: 2, //Layer�ṩ��5�ֲ����͡��ɴ����ֵ�У�0����Ϣ��Ĭ�ϣ�1��ҳ��㣩2��iframe�㣩3�����ز㣩4��tips�㣩,
			shade:0.8, //���ֲ�͸����
			area:['400px','500px'], //��������
			title:'���ⵥ��Ϣ',
			content: ['<%=path%>/findByIdOuts.html?aar101=' + aar101,'no'],
			btn:['����']
		});
  }
  
  //�����й����¼�
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'query'){
      return query(data);
    } else if(obj.event === 'verify'){
      return verify(data);
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