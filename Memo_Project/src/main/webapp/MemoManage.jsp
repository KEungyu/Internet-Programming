<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,
    java.text.SimpleDateFormat"%>

<%
    request.setCharacterEncoding("UTF-8");

	String[][] memoArray = (String[][])session.getAttribute("memoArray");
	Integer memoCount = (Integer) session.getAttribute("memoCount"); 

	if (memoArray == null) {
	    memoArray = new String[100][5];  
		session.setAttribute("memoArray", memoArray);
	}
	
    String title = request.getParameter("title");
    String color= request.getParameter("color");
    String important = request.getParameter("important") != null ? "★" : "X";
    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

    if (memoCount == null)
		memoCount = 0;
    
    if (title != null && memoCount < 100) {    	
    	if (memoArray[memoCount] == null) 
            memoArray[memoCount] = new String[5];
    	
    	memoArray[memoCount][0] = String.valueOf(memoCount + 1);
        memoArray[memoCount][1] = title;
        memoArray[memoCount][2] = color;
        memoArray[memoCount][3] = important;
        memoArray[memoCount][4] = date;
        memoCount++;

        session.setAttribute("memoArray", memoArray);
        session.setAttribute("memoCount", memoCount);
    
        response.sendRedirect("MemoManage.jsp");
        return;
    }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 관리</title>
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

	.write-new {
		margin-top: 20px;
		text-align: right;
	}

	.write-new a {
		color: #007bff;
		font-weight: bold;
	}
	
</style>
</head>
<body>

	<h1>메모 관리</h1>

	<table>
		<tr>
			<th>메모 번호</th>
			<th>메모 제목</th>
			<th>배경색</th>
			<th>수정 / 삭제</th>
			<th>중요 여부</th>
			<th>작성일</th>
		</tr>

		<% for (int i = 0; i < memoCount; i++) { 
			if (memoArray[i] != null && memoArray[i][0] != null) {
		%>
        <tr>
            <td><%= memoArray[i][0] %></td>
            <td><a href="ViewMemo.jsp?memoId=<%= memoArray[i][0] %>"><%= memoArray[i][1] %></a></td>
            <td style="background-color: <%= memoArray[i][2] %>;"><%= memoArray[i][2] %></td>
            <td>
                <a href="EditMemo.jsp?memoId=<%= memoArray[i][0] %>">수정</a> /
                <a href="DeleteMemo.jsp?memoId=<%= memoArray[i][0] %>">삭제</a>
            </td>
            <td><%= memoArray[i][3] %></td>
            <td><%= memoArray[i][4] %></td>
        </tr>
        <% } 
		} %>
	</table>

	<div class = "write-new">
		<a href = "WriteMemoScreen.jsp">➕ 새 메모 작성</a>
	</div>

</body>
</html>