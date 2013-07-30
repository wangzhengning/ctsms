<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>需方管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#value").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    if (element.is(":checkbox")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/coal/demand/">需方列表</a></li>
    <li class="active"><a href="${ctx}/coal/demand/form?id=${demand.demandId}">需方<shiro:hasPermission name="coal:demand:edit">${not empty demand.demandId?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:demand:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>
<form:form id="inputForm" modelAttribute="demand" action="${ctx}/coal/demand/save" method="post" class="form-horizontal">
    <div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
    <form:hidden path="demandId"/>
    <div class="control-group">
        <label class="control-label">需方名称:</label>
        <div class="controls">
            <form:input path="demandName" htmlEscape="false" maxlength="200" class="required"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注:</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" maxlength="255"/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="coal:demand:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
