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
String bookno=request.getParameter("bookno");
String author=request.getParameter("author");
String bookname=request.getParameter("bookname");
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String sql="update bookinfo1229 set author=?,bookname=? where bookno=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(3, bookno);
	pstmt.setString(1, author);
	pstmt.setString(2, bookname);
	pstmt.executeUpdate();
	System.out.println("데이터 수정 성공");
	%>
	<script>
	alert("수정완료");
	location.href="bookSelect.jsp";
	</script>
<%
}catch(SQLException e){
	System.out.println("저장 실패");
	e.printStackTrace();
}
%>

<section>
</section>
<%@include file="footer.jsp" %>
</body>
</html>