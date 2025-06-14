<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String categoryToDelete = request.getParameter("category");
    String[] categoryArray = (String[]) session.getAttribute("categoryArray");
    Integer categoryCount = (Integer) session.getAttribute("categoryCount");

    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    if (categoryArray == null) {
        categoryArray = new String[100];
        categoryCount = 0;
    }

    if (memoArray == null) {
        memoArray = new String[100][7];  // 메모 배열 크기 확인
        memoCount = 0;
    }

    if (categoryToDelete != null && categoryCount > 0) {
        int categoryIndex = -1;

        // 1) 카테고리 배열에서 삭제할 카테고리 찾기
        for (int i = 0; i < categoryCount; i++) {
            if (categoryArray[i].equals(categoryToDelete)) {
                categoryIndex = i;
                break;
            }
        }

        if (categoryIndex != -1) {
            // 2) 카테고리 배열에서 삭제 (뒤쪽 요소 한 칸씩 당기기)
            for (int i = categoryIndex; i < categoryCount - 1; i++) {
                categoryArray[i] = categoryArray[i + 1];
            }
            categoryArray[categoryCount - 1] = null;
            categoryCount--;

            // 3) 메모 배열에서 해당 카테고리 메모 모두 삭제
            for (int i = 0; i < memoCount; ) {
                if (memoArray[i] != null && categoryToDelete.equals(memoArray[i][5])) {
                    // 메모 삭제: 뒤쪽 메모들을 한 칸씩 당기기
                    for (int j = i; j < memoCount - 1; j++) {
                        memoArray[j] = memoArray[j + 1];
                        memoArray[j][0] = String.valueOf(j + 1); // 메모 번호 재조정
                    }
                    memoArray[memoCount - 1] = null;
                    memoCount--;
                    // i를 증가시키지 않고 다음 인덱스부터 검사 (한 칸 당겨졌기 때문)
                } else {
                    i++;
                }
            }

            // 세션 저장
            session.setAttribute("categoryArray", categoryArray);
            session.setAttribute("categoryCount", categoryCount);
            session.setAttribute("memoArray", memoArray);
            session.setAttribute("memoCount", memoCount);
        }
    }

    response.sendRedirect("CategoryManage.jsp");
%>