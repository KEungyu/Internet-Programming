<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "UTF-8">
	<title>메모 작성</title>
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
			height: 100px;
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

		.color, .file_image, .important, .memoNumber {
			display: inline-block;
			width: 48%; 
			margin-right: 10px;
		}

		.color, .file_image {
			margin-bottom: 50px;
		}
	
	</style>
</head>

<body>
<form action = "OutputScreen.jsp" method = "post">
	<div class = "memo">
		<h1>메모 작성</h1>
		<div class = "tica">
			<h2>제목</h2>
			<input type = "text" id = "title" name = "title" placeholder = "메모 제목을 입력하세요.">
		</div>
		
		<div class = "tica">
			<h2>카테고리</h2>
			<input type = "text" id ="category" name = "category" placeholder = "카테고리를 입력하세요.">
		</div>
		
		<div class = "content">
			<h2>내용</h2>
			<input type = "text" id = "content" name = "content" placeholder = "메모 내용을 입력하세요.">
		</div>
		
		<div class = "options">
			<div class = "color">
				<h2>배경색 선택하기</h2>
				<select id ="color" name = "color">
					<option value = "red">빨간색</option>
					<option value = "orange">주황색</option>
					<option value = "yellow">노란색</option>
					<option value = "green">초록색</option>
					<option value = "blue">파란색</option>
					<option value = "purple">보라색</option>
					<option value = "gray">회색</option>
				</select>
			</div>
		
			<div class = "file_image">
				<h2>첨부 파일</h2>
				<input type = "file" id = "file" accept = "image/jpg, image/gif">
			</div>
		
			<div class = "important">
				<h2>중요 여부</h2>
				<input type = "checkbox" id = "important" name = "important" value = "checked"> 중요 메모로 설정
			</div>
		
			<div class = "memoNumber">
				<h2>메모 번호</h2>
				<input type = "text" id = "memoNumber" name = "memoNumber" placeholder = "메모 번호를 입력하세요.">
			</div>
		
			<button type = "submit">등록</button>
		</div>
	</div>
</form>
</body>
</html>