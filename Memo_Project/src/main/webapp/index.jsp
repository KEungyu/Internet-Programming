<%@ page contentType="text/html; charset=UTF-8"%>
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
		
		#searchForm {
			display: flex;
			justify-content: center;
			width: 100%;
		}
		
		#searchInput {
			width: 60%;
			padding: 12px 20px;
			border: 2px solid #ccc;
			border-radius: 30px;
			font-size: 16px;	
		}
		
		#searchButton {
			background-color: #28a745;
			border: none;
			padding: 12px 25px;
			margin-left: 10px;
			border-radius: 30px;
			font-size: 16px;
			color: white;
		}
		
		#searchButton:hover {
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
			color: black;
		}
		
		.memo .content {
			font-size: 14px;
			color: black;
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
		
		.memo_number {
   			position: absolute;  
   			bottom: 10px;        
    		right: 10px;         
    		font-size: 12px;     
    		color: #888;         
    		font-style: italic;
		}	
	</style>
</head>

<body>
	<h1>메모 관리 프로그램 메인 화면</h1>
	<!-- 검색창 -->
	<div class = "search"> 
		<form id = "searchForm" action="MemoSearch.jsp" method="get" >
			<input id = "searchInput" name = "search" type = "text" placeholder = "검색어를 입력하세요."> 
			<button id = "searchButton" type = "submit">검색</button>
		</form>
	</div>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 메모 배열과 개수 가져오기
	String[][] memoArray = (String[][]) session.getAttribute("memoArray");
	Integer memoCount = (Integer) session.getAttribute("memoCount");

	// 카테고리를 저장할 배열
	String[] categoryArray = new String[100];  
	int[] categoryCountArray = new int[100];
	int categoryIndex = 0;

	if (memoArray != null && memoCount != null) {
		for (int i = 0; i < memoCount; i++) {
			if (memoArray[i] != null && memoArray[i][5] != null) {
				String categories = memoArray[i][5];
				
				String currentCat = categories;
				boolean exists = false;
				
				// 동일한 카테고리가 존재할 경우 카테고리수 + 1
				for (int k = 0; k < categoryIndex; k++) {
					if (categoryArray[k].equals(currentCat)) {
						categoryCountArray[k]++;
						exists = true;
						break;
					}
				}
					
				// 동일한 카테고리가 존재하지 않을 경우 새로 추가
				if (!exists) {
					categoryArray[categoryIndex] = currentCat;
					categoryCountArray[categoryIndex] = 1;
					categoryIndex++;
				}
			}			
		}
	}
%>
	
	<div class = "main_content">
		<div class = "category">
			<h3># 카테고리 목록</h3>
				<ul>
					<%
					// 저장된 카테고리 출력
                	for (int i = 0; i < categoryIndex; i++) {
            		%>
               		<li><%= categoryArray[i] %> (<%= categoryCountArray[i] %>)</li>
            		<%
                	}
            	%>
			</ul>
			
			<div class = "category-footer">
                <a href = "CategoryManage.jsp">카테고리 관리</a> 
            </div>
		</div>

		<div class = "recent_memo">
			<h2>최근 작성한 메모</h2>
			<div class = "memo_link">
				<a href = "MemoManage.jsp">메모 관리</a>
			</div>
			<%
				int shown = 0;
				
				// 최근 작성된 3개의 메모를 간략하게 출력
				if (memoArray != null && memoCount != null) {
					for (int i = memoCount - 1; i >= 0 && shown < 3; i--) {
						if (memoArray[i] != null) {
							String number = memoArray[i][0];
							String title = memoArray[i][1];
							String isImportant = memoArray[i][3];
							String date = memoArray[i][4];
							String category = memoArray[i][5];
							String content = memoArray[i][6];
			%>
							<div class = "memo">
								<div class = "title"><%= title %> <%= "★".equals(isImportant) ? "★" : "" %></div>
								<div class = "memo_category"># <%= category %></div>
								<div class = "content"><%= content %></div>
								<div class = "date"><%= date %></div>
								<div class = "memo_number"><%= number %></div>
							</div>
			<%
							shown++;
						}
					}
				}
			%>
		</div>
	</div>	
</body>
</html>