<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>Set</title>
	<%@ include file="/WEB-INF/jsp/public/common.jspf" %>
	
	<!-- %{id==null? 'add' : 'edit'} -->
</head>
<body>

<!-- Title --> 
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title">
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> Information
        </div>
        <div id="Title_End"></div>
    </div>
</div>


<!--Content-->
<div id=MainArea>

    <s:form action="departmentAction_add">
    	<s:hidden name="id"></s:hidden>
        
        <div class="ItemBlock_Title1"><!--<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> information </DIV>  -->
        </div>
        
       
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td width="100">Supervision</td>
             
                         <td>
                         <s:select name="parentId" class="SelectStyle"
                         list="#departmentList" listKey="id" listValue="name"
                         headerKey="" headerValue="Option"/>
                       
                        </td>
                    </tr>
                    <tr><td>Name</td>
                        <td><s:textfield name="name" cssClass="InputStyle"/> *</td>
                    </tr>
                    <tr><td>description</td>
                        <td><s:textarea name="description" cssClass="TextareaStyle"></s:textarea></td>
                    </tr>
                </table>
            </div>
        </div>
        
        
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
    </s:form>
</div>

<div class="Description">
	Hint<br />
	1，The sturture of department is tree-type<br/>
</div>

</body>
</html>