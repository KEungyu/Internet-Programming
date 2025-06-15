<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String memoIdStr = request.getParameter("memoId");
    int memoId = -1;

    if (memoIdStr != null) {
        try {
            memoId = Integer.parseInt(memoIdStr);
        } 
        
        catch (NumberFormatException e) {
            memoId = -1;
        }
    }

    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    if (memoArray != null && memoCount != null && memoId > 0 && memoId <= memoCount) {
      	int index = memoId - 1;
      	
    	for (int i = index; i < memoCount - 1; i++) {
            memoArray[i] = memoArray[i + 1];
            memoArray[i][0] = String.valueOf(i + 1); 
        }

        memoArray[memoCount - 1] = null;
        memoCount--;

        session.setAttribute("memoArray", memoArray);
        session.setAttribute("memoCount", memoCount);
    }

    response.sendRedirect("MemoManage.jsp");
%>
