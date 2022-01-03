<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<%@include file="DBconn.jsp" %>
<br><h2 class=h3>학사정보 목록</h2>
<table border=1 id="tab2">
<tr>
<th>no</th>
<th>도서코드</th>
<th>저자</th>
<th>도서명</th>
<th>관리</th>
</tr>
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;
try{
	  String sql="select * from bookinfo1229";
	  pstmt=conn.prepareStatement(sql);
	  rs=pstmt.executeQuery();
	  while(rs.next()){
		  int bookno=rs.getInt("bookno");
		  String author=rs.getString("author");
		  String bookname=rs.getString("bookname");
		  no++;
		  System.out.println("테이블 조회 성공");
		  
%>
<tr>
      <td><%=no %></td>
      <td><a href="bookUpdate.jsp?bookno=<%=bookno%>" id="c1"><%=bookno %></a></td>
      <td><%=author %></td>
      <td><%=bookname %></td>
      <td><a href="bookDelete.jsp?bookno=<%=bookno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;" id="c1">삭제</a></td>
      </tr>
 <%}
}catch(SQLException e){
	 System.out.println("데이터 조회 실패");
	 e.printStackTrace();
}
%>
</table>
<div class="btn_group">
<button id="btn1" type="button" onclick="location.href='bookInsert.jsp'">도서 정보 추가</button>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>