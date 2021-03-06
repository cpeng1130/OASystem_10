<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <title>UserList</title>
    <%@ include file="/WEB-INF/jsp/public/common.jspf" %>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> User-Management
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">Login_name</td>
                <td width="100">Name</td>
                <td width="100">Department</td>
                <td width="200">Position</td>
                <td>Note</td>
                <td>Relative Operation</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">
        
        <s:iterator value="#userList"> 
            <tr class="TableDetail1 template">
                <td>${loginName}&nbsp;</td>
                <td>${name}&nbsp;</td>
                <td>${department.name}&nbsp;</td>
                <td>
                	<s:iterator value="roles">
                		${name}&nbsp;
                	</s:iterator>
                	&nbsp;
                </td>
                <td>${description}&nbsp;</td>
                <td>
                	<s:a action="userAction_delete?id=%{id}" onclick="return delConfirm()">delete</s:a>
                    <s:a action="userAction_editUI?id=%{id}">edit</s:a>
					<s:a action="userAction_initPassword?id=%{id}" onclick="return window.confirm('您确定要初始化密码为1234吗？')">password</s:a>
                </td>
            </tr>
        </s:iterator> 
            
        </tbody>
    </table>
    
    <!-- other hyperlink -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="userAction_addUI"><img src="${pageContext.request.contextPath}/style/images/createNew.png" /></s:a>
        </div>
    </div>
</div>

</body>
</html>
