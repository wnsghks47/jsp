<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
//데이터베이스에서 seq로 select 조건이 필요
String seq=request.getParameter("c");
NoticeDao dao=new NoticeDao();
Notice n=dao.getNotice(seq);

%>


<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDetail.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h2>noticeDetail.jsp</h2>
<table class="twidth">
	<colgroup>
		<col width="15%" />
		<col width="35%" />
		<col width="15%" />
		<col width="35%" />	
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">글번호</th>
			<td><%=n.getSeq() %></td>
			<th class="left">조회수</th>
			<td><%=n.getHit() %></td>	
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td><%=n.getWriter() %></td>
			<th class="left">작성시간</th>
			<td><%=n.getRegdate() %></td>	
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3">
			<%=n.getTitle() %>
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<%=n.getContent() %>
			</td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">
			첨부
			</td>
		</tr>
	</tbody>
</table>
<div>
<a href="noticeEdit.jsp?c=<%=n.getSeq() %>">수정</a>
<a href="noticeDelProc.jsp?c=<%=n.getSeq() %>">삭제</a>
<a href="notice.jsp">목록</a>
</div>

</body>
</html>

