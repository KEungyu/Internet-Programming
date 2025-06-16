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
    
    String newCategory = request.getParameter("newCategory");
    if (newCategory != null && !newCategory.equals("")) {
        boolean exists = false;
        
        // 존재하는 카테고리인지 판단
        for (int i = 0; i < categoryCount; i++) {
            if (categoryArray[i].equals(newCategory)) {
                exists = true;
                break;
            }
        }
        
        // 존재하지 않는 카테고리인 경우
        if (!exists && categoryCount < 100) {
            categoryArray[categoryCount] = newCategory;
            categoryCount++;
            
            // 세션에 저장
            session.setAttribute("categoryArray", categoryArray);
            session.setAttribute("categoryCount", categoryCount);
        }
        
        response.sendRedirect("CategoryManage.jsp"); 
        return;   
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>카테고리 목록</title>
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
            width: 60%;
            margin: 0 auto 20px auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .category {
            margin-bottom: 15px;
        }

        .category a {
            font-size: 18px;
            text-decoration: none;
            color: #007bff;
        }

        .category a:hover {
            text-decoration: underline;
        }

        .count {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

    <h1>카테고리 관리</h1>

    <div class = "category-box">
    <!-- 모든 카테고리를 출력 -->
    <% for (int i = 0; i < categoryCount; i++) {
        String category = categoryArray[i];
        int count = 0;

        for (int j = 0; j < memoCount; j++)
            if (memoArray[j] != null && memoArray[j][5] != null && memoArray[j][5].equals(category)) 
                count++;
    %>
        <div class = "category">
            <a href = "CategoryMemoList.jsp?category=<%= category %>"><%= category %></a>
            <span class = "count">(메모 <%= count %>개)</span>
            (<a href = "CategoryEdit.jsp?category=<%= category %>"> 수정</a> |
            <!-- 삭제 여부 확인 -->
            <a href = "CategoryDelete.jsp?category=<%= category %>"
       			onclick = "return confirm('카테고리와 해당 카테고리의 모든 메모가 삭제됩니다. 정말 삭제하시겠습니까?');">
       			삭제
       		</a>)
        </div>
 <% } %>
	</div>

    <div style = "text-align: center; margin-top: 30px;">
    	<a href = "CategoryAdd.jsp">카테고리 등록하기</a> |
    	<a href = "index.jsp">메인 화면으로 돌아가기</a>
	</div>
</body>
</html>