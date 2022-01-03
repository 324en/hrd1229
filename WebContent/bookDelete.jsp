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
 String bookno=request.getParameter("bookno");
 PreparedStatement pstmt=null;
 ResultSet rs=null;
 try{
	  String sql="delete from bookinfo1229 where bookno=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, bookno);
	  pstmt.executeQuery();
 
%>
<script>
alert("삭제 완료");
location.href="bookSelect.jsp";

</script>
<%
 }catch(SQLException e){
	 System.out.println("삭제 실패");
	 e.printStackTrace();
 }
%>
</body>
</html>