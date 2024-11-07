<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<title>購入依頼一覧</title>
</head>
<body>
	<h2>購入依頼一覧</h2>

	<form name="form" action="/sizaikanri/requestList/search" method="post">
	<div>
	   開始日付:<input type="date" name="knirForm.startDate" value="<s:property value="knirForm.startDate"/>" />
	   終了日付:<input type="date" name="knirForm.endDate" value="<s:property value="knirForm.endDate"/>" />
	   <input type="submit" value="検索"/>
	</div>
	</form>

	<s:if test="knirForm.sizaiList != null && knirForm.sizaiList.size !=0">

	<table class="outputtable">
	<tr>
		<th>資材ID</th>
		<th>資材名</th>
		<th>数量</th>
		<th>カテゴリ</th>
		<th>購入依頼者</th>
		<th>購入依頼部門</th>
		<th>状態</th>
		<th>依頼日</th>
		<th>撤回</th>

	</tr>
	<s:iterator value="knirForm.sizaiList">
	<tr>
		<td>
			<s:property value="id"/>
		</td>
		<td>
			<a href="/sizaikanri/requestDetail/init?form.id=<s:property value="id"/>"><s:property value="name"/></a>
		</td>
		<td>
			<s:property value="num"/>
		</td>
		<td>
			<s:property value="category_name"/>
		</td>
		<td>
			<s:property value="request_user_name"/>
		</td>
		<td>
			<s:property value="request_dept_name"/>
		</td>
		<td>
			<s:property value="status_name"/>
		</td>
		<td>
			<s:property value="request_date"/>
		</td>
		<td>
		   	<s:if test="status == 1 || status == 3">
		   	 <a href="/sizaikanri/requestList/delete?knirForm.deleteId=<s:property value="id"/>">撤回</a>
		   	</s:if>
		   	<s:else>
		   		<font color="red">撤回不可</font>
		   	</s:else>
		</td>

	</tr>
	</s:iterator>
	</table>
	</s:if>
	<br/>
	
	<a href="/sizaikanri/requestRegist/init">購入依頼登録</a>
	
</body>
</html>

