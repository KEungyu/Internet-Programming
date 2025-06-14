<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String[] categoryArray = (String[]) session.getAttribute("categoryArray");
    Integer categoryCount = (Integer) session.getAttribute("categoryCount");

    if (categoryArray == null) {
        categoryArray = new String[100];
        categoryCount = 0;
    }

    String newCategory = request.getParameter("newCategory");
    String message = "";

    if (newCategory != null && !newCategory.equals("")) {
        boolean exists = false;
        for (int i = 0; i < categoryCount; i++) {
            if (categoryArray[i].equals(newCategory)) {
                exists = true;
                break;
            }
        }

        if (exists) {
            message = "이미 존재하는 카테고리 이름입니다.";
        } else {
            if (categoryCount < 100) {
                categoryArray[categoryCount] = newCategory;
                categoryCount++;
                session.setAttribute("categoryArray", categoryArray);
                session.setAttribute("categoryCount", categoryCount);
                response.sendRedirect("CategoryManage.jsp");
                return;
            } else {
                message = "더 이상 카테고리를 추가할 수 없습니다.";
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카테고리 등록</title>
    <style>
        body {
            padding: 30px;
            background-color: #f0f0f0;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .category-box {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 40%;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
            font-size: 16px;
        }
        input[type="text"] {
            width: 100%;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 8px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #007bff;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h1>카테고리 등록</h1>

    <div class="category-box">
        <% if (!message.equals("")) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <form action="CategoryAdd.jsp" method="post">
            <label for="newCategory">카테고리명</label><br>
            <input type="text" id="newCategory" name="newCategory" required>
            <br>
            <button type="submit">등록하기</button>
        </form>

        <div class="back-link">
            <a href="CategoryManage.jsp">카테고리 목록으로 돌아가기</a>
        </div>
    </div>

</body>
</html>