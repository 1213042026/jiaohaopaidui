<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head id="Head1">
    <%@ include file="/web/common/common.jsp" %>
<script type="text/javascript">
$(function () {
    $('#grid1').datagrid({
        title: '业务类型列表',
        nowrap: false,
        striped: true,
        fit: true,
        url: "<%=__APP__%>/User!getList?roletype=3",
        idField: 'id',
        pagination: true,
        rownumbers: true,
        pageSize: 10,
        pageNumber: 1,
        singleSelect: true,
        fitColumns: true,
        pageList: [10, 20, 50, 100, 200, 300, 500, 1000],
        sortName: 'id',
        sortOrder: 'desc',
        columns: [
            [
                //{field: 'ck', checkbox: true},
                {title: 'id', width: 100, field: 'id', sortable: true},
                {title: '名称', width: 100, field: 'username', sortable: true},
                /* {title: '电话', width: 100, field: 'tel', sortable: true},
                {title: '业务类型', width: 100, field: 'otitle', sortable: true},
                {title: '职位', width: 100, field: 'zhiwei', sortable: true}, */
                {title: '说明', width: 400, field: 'note',sortable: true}
            ]
        ], toolbar: [
            {
                text: '新增',
                id: "tooladd",
                disabled: false,
                iconCls: 'icon-add',
                handler: function () {
                    $("#action").val("add");
                    $("#managerDialog").dialog('open');
                    managForm.reset();
                }
            },
            '-',
            {
                text: '修改',
                id: 'tooledit',
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                    $("#action").val("edit");
                    var selected = $('#grid1').datagrid('getSelected');
                    if (selected) {
                        edit(selected);
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            },
            '-',
            {
                text: '图表',
                id: 'tooledit',
                disabled: false,
                iconCls: 'icon-edit',
                handler: function () {
                    var selected = $('#grid1').datagrid('getSelected');
                    showChart(selected);
                }
            },
            '-',
            {
                text: '删除',
                id: 'tooldel',
                disabled: false,
                iconCls: 'icon-remove',
                handler: function () {
                    var rows = $('#grid1').datagrid('getSelections');
                    if (rows.length) {
                        var ids = "";
                        for (var i = 0; i < rows.length; i++) {
                            ids += rows[i].id + ",";
                        }
                        ids = ids.substr(0, (ids.length - 1));
                        $.messager.confirm('提示', '确定要删除吗？', function (r) {
                            if (r) {
                                deleteItem(ids);
                            }
                        });
                    } else {
                        $.messager.alert("提示", "请选择一条记录进行操作");
                    }
                }
            }
        ]
    });

    document.onkeydown=function (e){
        e = e ? e : event;
        if(e.keyCode == 13){
            query();
        }
    }
    
    $("#oid").combobox({
        method:"get",
        url:'<%=__APP__%>/Obj!keshiList',
        valueField: 'id',
        textField: 'title'
    });

});

function save() {
	/* var otitle = $("#oid").combobox("getText");
	$("#otitle").val(otitle); */
    $('#managForm').form('submit', {
        url: "<%=__APP__%>/User!add",
        onSubmit: function () {
            return inputCheck();
        },
        success: function (data) {
            closeBackGround();
            $.messager.alert("提示", data, "info", function () {
                closeFlush();
            });
        }
    });
}

function edit(obj) {
	var id = obj.id;
    $("#id").val(id);
    $("#username").val(obj.username);
    $("#zhiwei").val(obj.zhiwei);
    $("#oid").combobox("setValue",obj.oid);
    $("#tel").val(obj.tel);

    $("#note").val(obj.note);
    $("#managerDialog").dialog('open');
}

function deleteItem(uuid) {
    openBackGround();
    $.post("<%=__APP__%>/User!deleteItem", {id: uuid}, function (data) {
        closeBackGround();
        closeFlush();
    });
}

function cancel() {
    $.messager.confirm('提示', '是否要关闭？', function (r) {
        if (r) {
            closeFlush();
        }
    });
}

function query() {
    $('#grid1').datagrid('load', serializeObject($('#searchForm')));
}


function closeFlush() {
    managForm.reset();
    $("#managerDialog").dialog('close');
    $("#grid1").datagrid("reload");
}

function inputCheck() {
    if (!($("#managForm").form("validate"))) {
        return false;
    }
    openBackGround();
    return true;
}



function setNull(){
    searchForm.reset();
}
function showChart(obj){
    if (obj == null) {
        alert("请选择要查看的业务类型记录");
        return;
    }
    $("#chartdialog").dialog('open');
    refreshChart(obj);
}

function refreshChart(obj){
    $.post(__APP__+"/User!getCount",{businessType:obj.username},function(data){
        var xarray = [];
        var yarray = [];
        xarray.push(obj.username);
        data = JSON.parse(data);
        yarray.push(data.count);
        var myChart = echarts.init(document.getElementById('mychat'));
        var option = {
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                //formatter: "{a} <br/>{b}: {c} ({d}%)",
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : xarray,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'预约叫号次数统计',
                    type:'bar',
                    barWidth: '60%',
                    data:yarray
                }
            ]
        };
        myChart.setOption(option);
    });
}

</script>
</head>
<body class="easyui-layout">
<div region="north" border="false" style="height:3px;overflow: hidden"></div>
<div region="west" border="false" style="width:3px;"></div>
<div region="east" border="false" style="width:3px;"></div>
<div region="south" border="false" style="height:3px;overflow: hidden"></div>
<div region="center" border="false">
    <div id="main" class="easyui-layout" fit="true" style="width:100%;height:100%;">
        <!-- <div region="north" id="" style="height:100%;" class="" title="查询条件">
            <form action="" id="searchForm" name="searchForm" method="post">
                <table cellpadding="5" cellspacing="0" class="tb_search">
                    <tr>
                        <td width="10%">
                            <label for="sname">标题：</label>
                            <input type="text" id="stitle" name="stitle" width="100%" maxlength="32"/>
                        </td>
                        <td width="10%">
                            <a href="#" onclick="query();" id="querylink" class="easyui-linkbutton"
                               iconCls="icon-search">查询</a>
                            <a href="#" onclick="setNull();" class="easyui-linkbutton" iconCls="icon-redo">重置</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div> -->
        <div region="center" border="false" style="padding:3px 0px 0px 0px;overflow:hidden">

            <table id="grid1"></table>

        </div>
    </div>
</div>




<div id="chartdialog" class="easyui-dialog" title="图表" style="width:850px;height:550px;" toolbar="#dlg-toolbar"
     resizable="true" modal="true" closed='true'>

    <div id="mychat" style="width: 800px;height:400px;"></div>
    <div id="mychat2" style="width: 800px;height:400px;"></div>
</div>
<script type="text/javascript" src="<%=__APP__ %>/web/public/js/echarts.min.js"></script>
<div id="managerDialog" class="easyui-dialog" title="业务类型管理" style="width:450px;height:350px;" toolbar="#dlg-toolbar"
     buttons="#dlg-buttons2" resizable="true" modal="true" closed='true'>
    <form id="managForm" name="managForm" method="post" enctype="multipart/form-data">
        <input type="hidden" id="action" name="action"/>
        <input type="hidden" id="id" name="id"/>
        <input type="hidden" id="roletype" name="user.roletype" value="3"/>
        <table cellpadding="1" cellspacing="1" class="tb_custom1">
            <tr>
                <th width="30%" align="right"><label>名称：</label></th>
                <td width="60%" colspan="1">
                    <input id="username" name="user.username" class="easyui-validatebox"
                           style="width:300px;word-wrap: break-word;word-break:break-all;" type="text" required="true"
                           validType="length[0,100]"/>
                </td>
            </tr>
            
            <tr>
                <th width="30%" align="right"><label>简介：</label></th>
                <td colspan="1" width="60%">
                    <textarea style="width:300px;height: 100px;" id="note" name="user.note"></textarea>
                </td>
            </tr>
        </table>
    </form>
    <div id="dlg-buttons2">
        <a href="#" class="easyui-linkbutton" onclick="save();">保存</a>
        <a href="#" class="easyui-linkbutton" onclick="cancel();">取消</a>
    </div>
</div>
</body>
</html>