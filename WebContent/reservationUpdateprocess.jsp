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
ResultSet rs=null;
try{
	String sql="update reservation1229 set custname=?,bookno=?,outdate=?,indate=?,status=?,Class=? where lentno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(7, lentno);
	pstmt.setString(1, custname);
	pstmt.setString(2, bookno);
	pstmt.setString(3, outdate);
	pstmt.setString(4, indate);
	pstmt.setString(5, status);
	pstmt.setString(6, Class);
    pstmt.executeUpdate();
    System.out.println("수정 완료");
 %>
   <script>
   alert("수정 완료되었습니다.");
   location.href="reservationSelect.jsp";
   </script>
 <%
 
}catch(SQLException e){
	System.out.println("수정 실패");
	e.printStackTrace();
}
%>
</body>
</html>