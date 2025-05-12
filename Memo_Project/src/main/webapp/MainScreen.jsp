<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "UTF-8">
	<title>메모 관리 프로그램 메인 화면</title>
	<style>
		h1 {
			text-align: center;
			font-weight: bold;
			margin-top: 30px;
		}
		
		.search {
			display: flex;
			justify-content: center;
			margin-top: 20px;
			padding: 10px;
		}
		
		.search input {
			width: 60%;
			padding: 12px 20px;
			border: 2px solid #ccc;
			border-radius: 30px;
			font-size: 16px;	
		}
		
		.search button {
			background-color: #28a745;
			border: none;
			padding: 12px 25px;
			margin-left: 10px;
			border-radius: 30px;
			font-size: 16px;
			color: white;
		}
		
		.search button:hover {
			background-color: #218838;
		}
		
		.main_content {
			display: flex;
			padding: 20px;
			background-color: #fff;
			border-radius: 10px;
		}
		
		.category {
			width: 250px;
			padding: 20px;
			background-color: #f0f0f0;
			border-radius: 10px;
			margin-right: 20px;
			position: relative;
		}
		
		.category h3 {
			font-size: 22px;
			font-weight: bold;
			color: #333;
			margin-bottom: 20px;
		}
		
		.category ul li {
			margin-bottom: 10px;
		}
		
		 .category-footer {
		 	position: absolute;
            font-size: 12px;
            bottom: 10px;
            left: 10px;
        }
		
		.memo {
			background-color: #fffb8e;
			border-radius: 10px;
			padding: 15px;
			margin-bottom: 15px;
			position: relative;
		}
		
		.recent_memo {
			width: 100%;
			padding: 20px;
			background-color: #f0f0f0;
			border-radius: 10px;
			position: relative;
		}
		
		.memo_link {
			position: absolute;
			top: 20px;
			right: 20px; 
			font-size: 14px;
		}
	
		.memo .title {
			font-size: 18px;
			font-weight: bold;
			color: black;
		}
		
		.memo .memo_category {
			font-size: 12px;
			font-style: italic;
			color: #888;
			font-weight: lighter;
		}
		
		.memo .content {
			font-size: 14px;
			color: gray;
			margin-top: 8px;
		}
		
		.memo .date {
			position: absolute;
			top: 10px;
			right: 10px;
			font-size: 12px;
			color: #888;
			font-style: italic;
		}
	</style>
</head>

<body>
	<h1>메모 관리 프로그램 메인 화면</h1>
	<div class = "search"> 
		<input type = "text" placeholder = "검색어를 입력하세요."> 
		<button>검색</button>
	</div>
	
	<div class = "main_content">
		<div class = "category">
			<h3># 카테고리 목록</h3>
				<ul>
					<li><a href = "#"># 카테고리 1 (1)</a></li>
					<li><a href = "#"># 카테고리 2 (3)</a></li>
					<li><a href = "#"># 카테고리 3 (8)</a></li>
				<li><a href = "#"># 카테고리 4 (2)</a></li>
			</ul>
			
			<div class = "category-footer">
                <a href = "#category-management">카테고리 관리</a> 
            </div>
		</div>
		
		<div class = "recent_memo">
			<h2>최근 작성한 메모</h2>
			<div class = "memo_link">
				<a href = "#memo-manage">메모 관리</a>
			</div>
			<div class = "memo">
				<div class = "title">제목 1</div>
				<div class = "memo_category"># 카테고리 1</div>
				<div class = "content">메모 내용 1</div>
				<div class = "date">2025-03-30</div>
			</div>
			<div class = "memo">
				<div class = "title">제목 2</div>
				<div class = "memo_category"># 카테고리 1 # 카테고리 2</div>
				<div class = "content">메모 내용 2</div>
				<div class = "date">2025-03-29</div>
			</div>
			<div class = "memo">
				<div class = "title">제목 3</div>
				<div class = "memo_category"># 카테고리 3</div>
				<div class = "content">메모 내용 3</div>
				<div class = "date">2025-03-28</div>
			</div>
		</div>
	</div>	
</body>
</html>