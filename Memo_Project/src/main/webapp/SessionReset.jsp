<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // 세션 완전 삭제
    response.sendRedirect("MemoManage.jsp"); // 다시 메모 관리 페이지로 이동
    return;
%>