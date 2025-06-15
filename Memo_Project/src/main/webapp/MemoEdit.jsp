<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.text.SimpleDateFormat,
	 jakarta.servlet.http.Part, java.io.File" %>
<%
    request.setCharacterEncoding("UTF-8");

    String[][] memoArray = (String[][]) session.getAttribute("memoArray");
    Integer memoCount = (Integer) session.getAttribute("memoCount");

    if (memoArray == null || memoCount == null) {
        response.sendRedirect("MemoManage.jsp");
        return;
    }

    String memoIdStr = request.getParameter("memoId");
    int memoId = -1;

    if (memoIdStr != null) {
        memoId = Integer.parseInt(memoIdStr) - 1;
        if (memoId < 0 || memoId >= memoCount || memoArray[memoId] == null) {
            response.sendRedirect("MemoManage.jsp");
            return;
        }
    } else {
        response.sendRedirect("MemoManage.jsp");
        return;
    }
    
    String title = request.getParameter("title");
    String color = request.getParameter("color");
    String important = request.getParameter("important") != null ? "★" : "X";
    String category = request.getParameter("category");
    String content = request.getParameter("content");  
    String date = memoArray[memoId][4];  

    Part part = null;
    String fileName = memoArray[memoId][7]; // 기존에 저장된 파일명 유지

    try {
        part = request.getPart("filename");
    } catch (Exception e) {
        part = null;
    }

    if (part != null) {
        String newFileName = part.getSubmittedFileName();
        if (newFileName != null && !newFileName.equals("")) {
            String uploadPath = application.getRealPath("upload");
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdir();
            }
            part.write(uploadPath + File.separator + newFileName);
            fileName = newFileName;  // 새 파일명으로 업데이트
        }
    }


    if (title != null && !title.trim().equals("")) {
        memoArray[memoId][1] = title;
        memoArray[memoId][2] = color;
        memoArray[memoId][3] = important;
        memoArray[memoId][5] = category;
        memoArray[memoId][6] = content;
        memoArray[memoId][7] = fileName;

        session.setAttribute("memoArray", memoArray);

        response.sendRedirect("MemoManage.jsp");
        return;
    }

    String existingTitle = memoArray[memoId][1];
    String existingColor = memoArray[memoId][2];
    String existingImportant = memoArray[memoId][3];
    String existingCategory = memoArray[memoId][5];
    String existingContent = memoArray[memoId][6];
    String existingFileName = memoArray[memoId][7];
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <title>메모 수정</title>
    <style>
        h1 {
            text-align: center;
            font-weight: bold;
            margin-top: 30px;
        }
        
        .tica input {
            width: 98%; 
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px; 
            margin-left: 5px; 
            margin-right: 5px;
        }
        
        .content input {
            width: 98%; 
            padding: 12px;
            height: 180px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px; 
            margin-left: 5px; 
            margin-right: 5px;
            text-align: left;
        }
        
        button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
        }
        
        button:hover {
            background-color: #218838;
        }    

        .options {
            display: flex;
        }

        .color, .file_image, .important {
            display: inline-block;
        }
        
        .color {
            margin-right: 250px;
        }
        
        .important {
            margin-left: 150px;
        }
        
        .options button {
            display: inline-block;
            width: 100px;       
            font-size: 16px;
            margin-left: 20px;  
        }
        
        .buttonlink {
  			position: fixed;
 			bottom: 20px;
  			right: 5px;
 			width: 220px;
		}
	
    </style>

    <script>
        function validateForm() {
            var title = document.getElementById("title").value();
            var content = document.getElementById("content").value();

            if (title === "") {
                alert("제목을 입력해주세요.");
                return false;
            }
            
            if (content === "") {
                alert("내용을 입력해주세요.");
                return false;
            }
            
            alert("수정되었습니다.");
            return true;
        }
    </script>
</head>
<body>
<form action = "MemoEdit.jsp?memoId=<%= memoId + 1 %>" method = "post" enctype = "multipart/form-data" onsubmit = "return validateForm()">
    <div class = "memo">
        <h1>메모 수정</h1>
        <div class = "tica">
            <h2>제목</h2>
            <input type = "text" id = "title" name = "title" value = "<%= existingTitle %>">
        </div>

        <div class = "tica">
            <h2>카테고리</h2>
            <input type = "text" id = "category" name = "category" value = "<%= existingCategory %>" readonly>
        </div>

        <div class = "content">
            <h2>내용</h2>
            <input type = "text" id = "content" name = "content" value = "<%= existingContent%>">
        </div>

        <div class = "options">
            <div class = "color">
                <h2>배경색 선택하기</h2>
                <select name = "color">
                    <option value = "red" <%= "red".equals(existingColor) ? "selected" : "" %>>빨간색</option>
                    <option value = "orange" <%= "orange".equals(existingColor) ? "selected" : "" %>>주황색</option>
                    <option value = "yellow" <%= "yellow".equals(existingColor) ? "selected" : "" %>>노란색</option>
                    <option value = "green" <%= "green".equals(existingColor) ? "selected" : "" %>>초록색</option>
                    <option value = "blue" <%= "blue".equals(existingColor) ? "selected" : "" %>>파란색</option>
                    <option value = "purple" <%= "purple".equals(existingColor) ? "selected" : "" %>>보라색</option>
                    <option value = "gray" <%= "gray".equals(existingColor) ? "selected" : "" %>>회색</option>
                </select>
            </div>

            <div class = "file_image">
                <h2>첨부 파일</h2>
                <input type = "file" name = "filename" accept = "image/jpg, image/gif">
            	<% if (existingFileName != null && !existingFileName.equals("")) { %>
        			<p>현재 파일: <%= existingFileName %></p>
    			<% } else { %>
        		<p>현재 파일: 없음</p>
    			<% } %>
            </div>

            <div class = "important">
                <h2>중요 여부</h2>
                <input type = "checkbox" name = "important" value = "checked" <%= "★".equals(existingImportant) ? "checked" : "" %>> 중요 메모로 설정
            </div>
        </div>
			
		<div class = "buttonlink">
			<a href = "index.jsp">메인 화면</a>
			<button type = "submit">수정</button>
		</div>	
    </div>
</form>
</body>
</html>