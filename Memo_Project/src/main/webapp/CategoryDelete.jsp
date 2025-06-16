<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

	// 카테고리 배열, 개수 가져오기
    String categoryToDelete = request.getParameter("category");
    String[] categoryArray = (String[]) session.getAttribute("categoryArray");
    Integer categoryCount = (Integer) session.getAttribute("categoryCount");
	
    // 메모 배열, 개수 가져오기
    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    if (categoryArray == null) {
        categoryArray = new String[100];
        categoryCount = 0;
    }

    if (memoArray == null) {
        memoArray = new String[100][7]; 
        memoCount = 0;
    }

    if (categoryToDelete != null && categoryCount > 0) {
        int categoryIndex = -1;

        // 삭제할 카테고리 탐색
        for (int i = 0; i < categoryCount; i++) {
            if (categoryArray[i].equals(categoryToDelete)) {
                categoryIndex = i;
                break;
            }
        }

        if (categoryIndex != -1) {
            // 삭제를 위해 앞으로 한 칸 씩 당기기
            for (int i = categoryIndex; i < categoryCount - 1; i++) 
                categoryArray[i] = categoryArray[i + 1];
            
            categoryArray[categoryCount - 1] = null;
            categoryCount--;

            // 해당 카테고리의 메모 모두 삭제
            for (int i = 0; i < memoCount; ) {
                if (memoArray[i] != null && categoryToDelete.equals(memoArray[i][5])) {
                    // 뒤쪽 메모들을 앞으로 한 칸씩 당기기
                    
                    for (int j = i; j < memoCount - 1; j++) {
                        memoArray[j] = memoArray[j + 1];
                        memoArray[j][0] = String.valueOf(j + 1); // 메모 번호 재조정
                    }
                    
                    memoArray[memoCount - 1] = null;
                    memoCount--;
                } 
                
                else 
                    i++;
            }

            // 세션에 카테고리, 메모 저장
            session.setAttribute("categoryArray", categoryArray);
            session.setAttribute("categoryCount", categoryCount);
            session.setAttribute("memoArray", memoArray);
            session.setAttribute("memoCount", memoCount);
        }
    }

    response.sendRedirect("CategoryManage.jsp");
%>