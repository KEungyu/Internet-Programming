<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");
	
	// 세션에서 메모 배열과 메모 개수 가져오기
    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    String search = request.getParameter("search");
    
    if (search == null) 
    	search = "";
    
    String searchLower = search.toLowerCase(); // 대소문자 구분 없이 탐색하기 위한 코드
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
			boolean exists = false; // 검색 결과가 존재하는지 판단하기 위한 변수
		
			if (memoArray != null && memoCount != null) {
				for (int i = 0; i < memoCount; i++) {
					if (memoArray[i] != null && memoArray[i][1] != null) {
						String title = memoArray[i][1];
						String content = memoArray[i][6] != null ? memoArray[i][6] : "";
						
						// 해당 검색어를 포함하는지 여부를 확인하고 출력
						if (search.isEmpty() 
						    || title.toLowerCase().contains(searchLower) 
						    || content.toLowerCase().contains(searchLower)) {
							exists = true;
		%>
		<tr>
			<td><%= memoArray[i][0] %></td>
			<td><a href = "MemoView.jsp?memoId=<%= memoArray[i][0] %>"><%= title %></a></td>
			<td style = "background-color: <%= memoArray[i][2] %>;"><%= memoArray[i][2] %></td>
			<td>
				<a href = "MemoEdit.jsp?memoId=<%= memoArray[i][0] %>">수정</a> |
				<a href = "MemoDelete.jsp?memoId=<%= memoArray[i][0] %>">삭제</a>
			</td>
			<td><%= memoArray[i][3] %></td>
			<td><%= memoArray[i][4] %></td>
		</tr>
		<%
						}
					}
				}
			}
			
			// 일치하는 메모가 없는 경우
			if (!exists) {
		%>
		<tr>
			<td colspan = "6" style = "color: #888; text-align:center;">검색 결과가 없습니다.</td>
		</tr>
		<% } %>
	</table>

	<div class = "link">
		<a href = "MemoManage.jsp">메모 관리</a> | 
		<a href = "index.jsp">메인 화면</a>
	</div>

</body>
</html>