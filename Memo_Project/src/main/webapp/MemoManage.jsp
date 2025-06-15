<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,
    java.text.SimpleDateFormat, java.io.*, 
    jakarta.servlet.http.Part"%>

<%
    request.setCharacterEncoding("UTF-8");
	
	Part part = null;
	String fileName = "";
	
	try {
    	part = request.getPart("filename");
	} catch (Exception e) {
		part = null;
	}

	if (part != null) {
    	fileName = part.getSubmittedFileName();
    	
    	if (fileName != null && !fileName.equals("")) {
        	String uploadPath = application.getRealPath("upload");
        	File dir = new File(uploadPath);
        	
        	if (!dir.exists()) 
            	dir.mkdir();
        	
        	part.write(uploadPath + File.separator + fileName);	
    	}
	}

	String[][] memoArray = (String[][])session.getAttribute("memoArray");
	Integer memoCount = (Integer) session.getAttribute("memoCount"); 

	if (memoArray == null) {
	    memoArray = new String[100][8];  
		session.setAttribute("memoArray", memoArray);
	}
	
    String title = request.getParameter("title");
    String color= request.getParameter("color");
    String important = request.getParameter("important") != null ? "★" : "X";
    String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    String category = request.getParameter("category");
    String content = request.getParameter("content");
    
    if (memoCount == null)
		memoCount = 0;
    
    if (title != null && memoCount < 100) {    	
    	if (memoArray[memoCount] == null) 
            memoArray[memoCount] = new String[8];
    	
    	memoArray[memoCount][0] = String.valueOf(memoCount + 1);
        memoArray[memoCount][1] = title;
        memoArray[memoCount][2] = color;
        memoArray[memoCount][3] = important;
        memoArray[memoCount][4] = date;
        memoArray[memoCount][5] = category;
        memoArray[memoCount][6] = content;
        memoArray[memoCount][7] = fileName;
        
        memoCount++;

        session.setAttribute("memoArray", memoArray);
        session.setAttribute("memoCount", memoCount);
   
        String[] categoryArray = (String[]) session.getAttribute("categoryArray");
        Integer categoryCount = (Integer) session.getAttribute("categoryCount");

        if (categoryArray == null) {
            categoryArray = new String[100]; 
            categoryCount = 0;
        }

        if (category != null && !category.equals("")) {
            boolean exists = false;
            for (int i = 0; i < categoryCount; i++) {
                if (category.equals(categoryArray[i])) {
                    exists = true;
                    break;
                }
            }

            if (!exists) {
                categoryArray[categoryCount] = category;
                categoryCount++;
            }
        }

        session.setAttribute("categoryArray", categoryArray);
        session.setAttribute("categoryCount", categoryCount);
        
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

	<h1>메모 관리</h1>

	<table>
		<tr>
			<th>메모 번호</th>
			<th>메모 제목</th>
			<th>배경색</th>
			<th>수정 | 삭제</th>
			<th>중요 여부</th>
			<th>작성일</th>
		</tr>

		<% for (int i = 0; i < memoCount; i++) { 
			if (memoArray[i] != null && memoArray[i][0] != null) {
		%>
        <tr>
            <td><%= memoArray[i][0] %></td>
            <td><a href="MemoView.jsp?memoId=<%= memoArray[i][0] %>"><%= memoArray[i][1] %></a></td>
            <td style="background-color: <%= memoArray[i][2] %>;"><%= memoArray[i][2] %></td>
            <td>
                <a href="MemoEdit.jsp?memoId=<%= memoArray[i][0] %>">수정</a> |
                <a href="MemoDelete.jsp?memoId=<%= memoArray[i][0] %>">삭제</a>
            </td>
            <td><%= memoArray[i][3] %></td>
            <td><%= memoArray[i][4] %></td>
        </tr>
        <% } 
		} %>
	</table>

	<div class = "link">
		<a href = "MemoWrite.jsp">새 메모 작성하기</a>
		|
		<a href = "index.jsp">메인 화면</a>
	</div>

</body>
</html>