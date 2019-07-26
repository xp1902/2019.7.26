//一般直接写在一个js文件中

layui
		.use(
				[ 'form', 'layedit', 'laydate', 'table', 'layer', 'element',
						'laypage' ],
				function() {
					var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
					// 日期
					laydate.render({
						elem : '#date'
					});
					laydate.render({
						elem : '#date1'

					});

					var laypage = layui.laypage, layer = layui.layer;

					var element = layui.element;
					// 总页数大于页码总数
					laypage.render({
						elem : 'demo1',
						count : 70 // 数据总数
						,
						jump : function(obj) {
							console.log(obj);
						}
					});

				});