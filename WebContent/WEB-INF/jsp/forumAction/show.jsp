<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
<title>[$(forum.name)]-topic List</title>
<%@ include file="/WEB-INF/jsp/public/common.jspf"%>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/forum.css" />
<script type="text/javascript">
	function onSortByChange(selectedValue) {
		if (selectedValue == 0) {
			$("select[name=asc]").attr("disabled", "disabled");
		} else {
			$("select[name=asc]").removeAttr("disabled");
		}

	}
	$(function() {
		if ($("select[name=orderBy]").val() == 0) {
			$("select[name=asc]").attr("disabled", "disabled");
		}
	});
</script>
</head>
<body>

	<!-- display title -->
	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />[$(forum.name)]-topic
				List
			</div>
			<div id="Title_End"></div>
		</div>
	</div>



	<div id="MainArea">
		<div id="PageHead"></div>
		<center>
			<div class="ItemBlock_Title1" style="width: 98%;">
				<font class="MenuPoint"> &gt; </font>
				<s:a action="forumAction_list">Forum</s:a>
				<font class="MenuPoint"> &gt; </font> [$(forum.name)] <span
					style="margin-left: 30px;"> <s:a
						action="topicAction_addUI?forumId=%{#forum.id}">
						<img align="absmiddle"
							src="${pageContext.request.contextPath}/style/blue/images/button/publishNewTopic.png" />
					</s:a>
			</div>

			<div class="ForumPageTableBorder">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<!--表头-->
					<tr align="center" valign="middle">
						<td width="3" class="ForumPageTableTitleLeft"><img border="0"
							width="1" height="1"
							src="${pageContext.request.contextPath}/style/images/blank.gif" />
						</td>
						<td width="50" class="ForumPageTableTitle">
							<!--状态/图标-->&nbsp;
						</td>
						<td class="ForumPageTableTitle">Topic</td>
						<td width="130" class="ForumPageTableTitle">Author</td>
						<td width="100" class="ForumPageTableTitle">Count-of-Reply</td>
						<td width="130" class="ForumPageTableTitle">LastTime-Reply</td>
						<td width="3" class="ForumPageTableTitleRight"><img
							border="0" width="1" height="1"
							src="${pageContext.request.contextPath}/style/images/blank.gif" />
						</td>
					</tr>
					<tr height="1" class="ForumPageTableTitleLine">
						<td colspan="8"></td>
					</tr>
					<tr height=3>
						<td colspan=8></td>
					</tr>

					<!--主题列表-->
					<tbody class="dataContainer" datakey="topicList">
						<s:iterator value="recordList">
							<tr height="35" id="d0" class="template">
								<td></td>
								<td class="ForumTopicPageDataLine" align="center"><img
									src="${pageContext.request.contextPath}/style/images/topicType_${type}.gif" /></td>

								<td class="Topic"><s:a cssClass="Default"
										action="topicAction_show?id=%{id}">
						${title}
						</s:a></td>
								<td class="ForumTopicPageDataLine">
									<ul class="ForumPageTopicUl">
										<li class="Author">${author.name}</li>
										<li class="CreateTime"><s:date name="postTime"
												format="yyyy-MM-dd HH:mm:ss" /></li>
									</ul>
								</td>
								<td class="ForumTopicPageDataLine Reply" align="center"><b>${replyCount}</b></td>
								<td class="ForumTopicPageDataLine">
									<ul class="ForumPageTopicUl">
										<li class="Author">${lastReply.author.name }</li>
										<li class="CreateTime"><s:date name="lastReply.postTime"
												format="yyyy-MM-dd HH:mm:ss" /></li>
									</ul>
								</td>
								<td></td>
							</tr>
						</s:iterator>
					</tbody>
					<!--Topic list end-->

					<tr height="3">
						<td colspan="9"></td>
					</tr>

				</table>

				<!--其他操作-->
				<div id="TableTail">
					<div id="TableTail_inside">
						<table border="0" cellspacing="0" cellpadding="0" height="100%"
							align="left">
							<tr valign=bottom>
								<td></td>
								<td><select name="viewType">
										<option value="0">ALL TOPIC</option>
										<option value="1">ALL TOP TOPIC</option>

								</select> <select name="orderBy">
										<option value="0">默认排序（按最后更新时间排序，但所有置顶帖都在前面）</option>
										<option value="1">按最后更新时间排序</option>
										<option value="2">按主题发表时间排序</option>
										<option value="3">按回复数量排序</option>
								</select> <select name="reverse">
										<option value="true">Descending Sort</option>
										<option value="false">Ascending Sort</option>
								</select> <input type="IMAGE"
									src="${pageContext.request.contextPath}/style/blue/images/button/submit.PNG"
									align="ABSMIDDLE" /></td>
							</tr>
						</table>
					</div>
				</div>

			</div>
		</center>
	</div>

	<!--分页信息-->
	<div id=PageSelectorBar>
		<div id=PageSelectorMemo>Page：7/13页 &nbsp; 每页显示：30条 &nbsp;
			总记录数：385条</div>
		<div id=PageSelectorSelectorArea>
			<!--
		<IMG SRC="${pageContext.request.contextPath}/style/blue/images/pageSelector/firstPage2.png"/>
		-->
			<a href="javascript:void(0)" title="首页" style="cursor: hand;"> <img
				src="${pageContext.request.contextPath}/style/blue/images/pageSelector/firstPage.png" /></a>

			<span class="PageSelectorNum" style="cursor: hand;"
				onClick="gotoPageNum(2);">3</span> <span class="PageSelectorNum"
				style="cursor: hand;" onClick="gotoPageNum(2);">4</span> <span
				class="PageSelectorNum" style="cursor: hand;"
				onClick="gotoPageNum(2);">5</span> <span class="PageSelectorNum"
				style="cursor: hand;" onClick="gotoPageNum(2);">6</span> <span
				class="PageSelectorNum PageSelectorSelected">7</span> <span
				class="PageSelectorNum" style="cursor: hand;"
				onClick="gotoPageNum(2);">8</span> <span class="PageSelectorNum"
				style="cursor: hand;" onClick="gotoPageNum(2);">9</span> <span
				class="PageSelectorNum" style="cursor: hand;"
				onClick="gotoPageNum(2);">10</span> <span class="PageSelectorNum"
				style="cursor: hand;" onClick="gotoPageNum(2);">11</span> <span
				class="PageSelectorNum" style="cursor: hand;"
				onClick="gotoPageNum(2);">12</span>

			<!--
		<IMG SRC="${pageContext.request.contextPath}/style/blue/images/pageSelector/lastPage2.png"/>
		-->
			<a href="#" title="尾页" style="cursor: hand;"> <img
				src="${pageContext.request.contextPath}/style/blue/images/pageSelector/lastPage.png" /></a>

			转到： <input onFocus="this.select();" maxlength="2" class="inputStyle"
				type="text" value="1" name="currPage" tabindex="0" /> <input
				type="submit" name="goBtn" value="Go" class="MiddleButtonStyle" />
		</div>
	</div>

	<div class="Description">
		Hint：<br /> 1，主题默认按最后更新的时间降序排列。最后更新时间是指主题最后回复的时间，如果没有回复，就是主题发表的时间。<br />
		2，帖子有普通、置顶、精华之分。置顶贴始终显示在最上面，精华贴用不同的图标标示。<br />
	</div>

</body>
</html>
