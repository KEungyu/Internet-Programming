<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
	
	// 카테고리 배열
    String[] categoryArray = (String[]) session.getAttribute("categoryArray");
    Integer categoryCount = (Integer) session.getAttribute("categoryCount");

    // 메모 배열
    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    if (categoryArray == null) {
        categoryArray = new String[100];
        categoryCount = 0;
    }
    
    if (memoArray == null) {
        memoArray = new String[100][6];
        memoCount = 0;
    }
	
    // 기존 카테고리와 새 카테고리 
    String oldCategory = request.getParameter("category");
    String newCategory = request.getParameter("newCategory");
    String message = "";

    if (newCategory != null && !newCategory.equals("")) {
        boolean exists = false;
        
        // 새 카테고리가 존재하는지 검사
        for (int i = 0; i < categoryCount; i++) {
            if (categoryArray[i].equals(newCategory)) {
                exists = true;
                break;
            }
        }

        if (exists) 
            message = "이미 존재하는 카테고리 이름입니다.";
         
        else {
            // 존재하지 않는 경우 기존 카테고리 탐색
            for (int i = 0; i < categoryCount; i++) {
                if (categoryArray[i].equals(oldCategory)) {
                    categoryArray[i] = newCategory;
                    break;
                }
            }

            // 새 카테고리로 수정
            for (int j = 0; j < memoCount; j++) 
                if (memoArray[j] != null && memoArray[j][5] != null && memoArray[j][5].equals(oldCategory)) 
                    memoArray[j][5] = newCategory;

            session.setAttribute("categoryArray", categoryArray);
            session.setAttribute("memoArray", memoArray);

            message = "카테고리 이름이 수정되었습니다.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카테고리 수정</title>
</head>
<body>
    <h1>카테고리 수정</h1>

    <% if (!message.equals("")) { %>
        <p style = "color: red;"><%= message %></p>
    <% } %>

    <form action = "CategoryEdit.jsp" method = "post">
        <input type = "hidden" name = "category" value = "<%= oldCategory %>">

        <label>기존 카테고리명: <b><%= oldCategory %></b></label><br><br>
        <label>새 카테고리명: </label>
        <input type = "text" name = "newCategory" required>
        <button type = "submit">수정하기</button>
    </form>

    <p><a href = "CategoryManage.jsp">카테고리 목록으로 돌아가기</a></p>
</body>
</html>
