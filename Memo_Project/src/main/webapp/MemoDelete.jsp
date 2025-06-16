<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String memoIdStr = request.getParameter("memoId");
    int memoId = -1;
	
    // memoId를 정수로 변환
    if (memoIdStr != null) {
        try {
            memoId = Integer.parseInt(memoIdStr);
        } 
        
        // 예외 처리
        catch (NumberFormatException e) {
            memoId = -1;
        }
    }
	
    // 세션에서 메모 배열과 개수 가져오기
    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");
	
    if (memoArray != null && memoCount != null && memoId > 0 && memoId <= memoCount) {
      	int index = memoId - 1;
    	
      	// 삭제를 위해 배열 요소들을 앞으로 한 칸씩 당기기
    	for (int i = index; i < memoCount - 1; i++) {
            memoArray[i] = memoArray[i + 1];
            memoArray[i][0] = String.valueOf(i + 1); // 인덱스를 문자열로 변환하는 과정
        }
		
        memoArray[memoCount - 1] = null;
        memoCount--;
		
        // 삭제된 배열 세션에 다시 저장
        session.setAttribute("memoArray", memoArray);
        session.setAttribute("memoCount", memoCount);
    }

    response.sendRedirect("MemoManage.jsp");
%>
