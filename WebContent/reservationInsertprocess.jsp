<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBconn.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String lentno=request.getParameter("lentno");
String custname=request.getParameter("custname");
String bookno=request.getParameter("bookno");
String outdate=request.getParameter("outdate");
String indate=request.getParameter("indate");
String status=request.getParameter("status");
String Class=request.getParameter("Class");

PreparedStatement pstmt=null;

try{
	String sql="insert into reservation1229 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, lentno);
	pstmt.setString(2, custname);
	pstmt.setString(3, bookno);
	pstmt.setString(4, outdate);
	pstmt.setString(5, indate);
	pstmt.setString(6, status);
	pstmt.setString(7, Class);
    pstmt.executeUpdate();
    System.out.println("저장 성공");

}catch(SQLException e){
	System.out.println("저장 실패");
	e.printStackTrace();
}
%>
</body>
</html>