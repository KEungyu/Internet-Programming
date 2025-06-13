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

    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    String[] memo = null;

    if (memoArray != null && memoId > 0 && memoId <= memoCount) {
        memo = memoArray[memoId - 1];
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메모 상세 보기</title>
    <style>
        body {
            padding: 30px;
            font-family: Arial, sans-serif;
        }
        .memo-box {
            background-color: <%= (memo != null) ? memo[2] : "#fff" %>;
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
    <div class="memo-box">
        <h2>메모 제목: <%= memo[1] %></h2>
        <p>중요 여부: <%= memo[3] %></p>
        <p>작성일: <%= memo[4] %></p>
        <p>배경색: <%= memo[2] %></p>
    </div>
<% } else { %>
    <p>메모를 찾을 수 없습니다.</p>
<% } %>

<div class="back">
    <a href="MemoManage.jsp">← 메모 목록으로 돌아가기</a>
</div>

</body>
</html>