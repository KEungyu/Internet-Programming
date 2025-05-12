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
			height: 200px;
			border: 1px solid #ccc;
			border-radius: 8px;
			font-size: 16px; 
			margin-left: 5px; 
			margin-right: 5px;
			text-align: left;
		}
		
		button {
			position: absolute;
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
	</style>
</head>

<body>
	<div class = "memo">
		<h1>메모 작성</h1>
		<div class = "tica">
			<h2>제목</h2>
			<input type = "text" placeholder = "메모 제목을 입력하세요.">
		</div>
		
		<div class = "tica">
			<h2>카테고리</h2>
			<input type = "text" placeholder = "카테고리를 입력하세요.">
		</div>
		
		<div class = "content">
			<h2>내용</h2>
			<input type = "text" placeholder = "메모 내용을 입력하세요.">
		</div>
		
		<div class = "options">
			<div class = "color">
				<h2>배경색 선택하기</h2>
				<select name = "color">
					<option value = "red">빨간색</option>
					<option value = "orange">주황색</option>
					<option value = "yellow">노란색</option>
					<option value = "green">초록색</option>
					<option value = "blue">파란색</option>
					<option value = "purple">보라색</option>
					<option value = "gray">회색</option>
				</select>
			</div>
		</div>
		
		<div class = "file_image">
			<h2>첨부 파일</h2>
			<input type = "file" accept = "image/jpg, image/gif">
		</div>
		
		<button>등록</button>
	</div>
</body>
</html>