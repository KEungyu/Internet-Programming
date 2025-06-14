<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    String search = request.getParameter("search");
    if (search == null) search = "";
    String searchLower = search.toLowerCase();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 검색 결과</title>
<style>
	body {
		background-color: #e6f0f5;
		padding: 30px;
	}
	
	h1 {
		text-align: center;
		margin-bottom: 30px;
	}
	
	table {
		width: 100%;
		border-collapse: collapse;
		background-color: white;
	}
	
	th, td {
		border: 1px solid #999;
		text-align: center;
		padding: 10px;
	}
	
	th {
		background-color: #d9edf7;
		font-weight: bold;
	}

	a {
		color: #007bff;
		text-decoration: none;
	}

	a:hover {
		text-decoration: underline;
	}

	.link {
		margin-top: 20px;
		text-align: right;
	}

	.link a {
		color: #007bff;
		font-weight: bold;
	}
</style>
</head>
<body>

	<h1>'<%= search %>' 검색 결과</h1>

	<table>
		<tr>
			<th>메모 번호</th>
			<th>메모 제목</th>
			<th>배경색</th>
			<th>수정 | 삭제</th>
			<th>중요 여부</th>
			<th>작성일</th>
		</tr>

		<%
			boolean found = false;
			if (memoArray != null && memoCount != null) {
				for (int i = 0; i < memoCount; i++) {
					if (memoArray[i] != null && memoArray[i][1] != null) {
						String title = memoArray[i][1];
						String content = memoArray[i][6] != null ? memoArray[i][6] : "";
						if (search.isEmpty() 
						    || title.toLowerCase().contains(searchLower) 
						    || content.toLowerCase().contains(searchLower)) {
							found = true;
		%>
		<tr>
			<td><%= memoArray[i][0] %></td>
			<td><a href="MemoView.jsp?memoId=<%= memoArray[i][0] %>"><%= title %></a></td>
			<td style="background-color: <%= memoArray[i][2] %>;"><%= memoArray[i][2] %></td>
			<td>
				<a href="MemoEdit.jsp?memoId=<%= memoArray[i][0] %>">수정</a> |
				<a href="MemoDelete.jsp?memoId=<%= memoArray[i][0] %>">삭제</a>
			</td>
			<td><%= memoArray[i][3] %></td>
			<td><%= memoArray[i][4] %></td>
		</tr>
		<%
						}
					}
				}
			}
			if (!found) {
		%>
		<tr>
			<td colspan="6" style="color: #888; text-align:center;">검색 결과가 없습니다.</td>
		</tr>
		<% } %>
	</table>

	<div class="link">
		<a href="MemoManage.jsp">메모 관리</a> | 
		<a href="index.jsp">메인 화면</a>
	</div>

</body>
</html>