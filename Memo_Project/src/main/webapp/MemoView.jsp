<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String memoIdStr = request.getParameter("memoId");
    int memoId = -1;

    if (memoIdStr != null) {
        try {
            memoId = Integer.parseInt(memoIdStr);
        } catch (NumberFormatException e) {
            memoId = -1;
        }
    }
	
    // 세션에 저장된 메모 배열과 개수 가져오기
    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    String[] memo = null;

    if (memoArray != null && memoId > 0 && memoId <= memoCount) 
        memo = memoArray[memoId - 1];
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메모 상세 보기</title>
    <style>
        body {
            padding: 30px;
        }
        
        .memo-box {
            background-color: <%=memo[2]%>;
            padding: 20px;
            border-radius: 10px;
            color: #333;
        }
        
        h2 {
            margin-top: 0;
        }
        
        .back {
            margin-top: 20px;
        }
        
    </style>
</head>
<body>

<% if (memo != null) { %>
	<!-- 저장된 메모 구성 요소들 출력 -->
    <div class = "memo-box">
        <h2>메모 제목: <%= memo[1] %></h2>
        <p>메모 번호: <%= memoId %></p>
        <p>배경색: <%= memo[2] %></p>
        <p>중요 여부: <%= memo[3] %></p>
        <p>작성일: <%= memo[4] %></p>
        <p>내용: <%= memo[6] %></p>
        
        <% if (memo[7] != null && !memo[7].equals("")) { %>
    		<p>첨부 이미지:</p>
    		<img src = "upload/<%= memo[7] %>" alt = "첨부 이미지" style = "max-width: 300px;">
	 <% } %>
    </div>
<% } %>

<div class = "back">
    <a href = "MemoManage.jsp">메모 목록</a>
</div>

</body>
</html>