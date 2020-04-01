<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String title=request.getParameter("title");
String content=request.getParameter("content");

//dbconnect
String sql="insert into notices values("
+"(select max(to_number(seq))+1 from notices),"
+"?,'cj',?,sysdate,0)";
//db connect
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);

//결과
pstmt.executeUpdate();//insert 실행

//목록으로 이동
response.sendRedirect("notice.jsp");

%>
<%
pstmt.close();
con.close();
%>
