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
<br><h2 class=h3>도서 예약정보 조회</h2>
<table border=1 id="tab2">
<tr>
    <th>no</th>
    <th>대출번호</th>
    <th>고객성명</th>
    <th>도서코드</th>
    <th>도서명</th>
    <th>대출일자</th>
    <th>반납일자</th>
    <th>대출상태</th>
    <th>등급</th>
    <th>관리</th>
    </tr>
    
<%
request.setCharacterEncoding("utf-8");
PreparedStatement pstmt=null;
ResultSet rs=null;
int no=0;

try{
	 String sql="select lentno,custname,a.bookno,bookname,to_char(outdate,'yyyy-mm-dd'),to_char(indate,'yyyy-mm-dd'),status,class from bookinfo1229 b,reservation1229 a where a.bookno=b.bookno";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 while(rs.next()){
		 String lentno=rs.getString("lentno");
		 String custname=rs.getString("custname");
		 String bookno=rs.getString("bookno");
		 String bookname=rs.getString("bookname");
		 String outdate=rs.getString(5);
		 String indate=rs.getString(6);
		 String status=rs.getString("status");
		 String Class=rs.getString("Class");
		 no++;
		 System.out.println("테이블 조회 성공");
%>
<tr>
       <td><%=no %></td>
       <td><a href="reservationUpdate.jsp?lentno=<%=lentno%>" id="c1"><%=lentno %></a></td>
       <td><%=custname %></td>
       <td><%=bookno %></td>
       <td><%=bookname %></td>
       <td><%=outdate %></td>
       <td><%=indate %></td>
       <td><%=status %></td>
       <td><%=Class %></td>
       <td><a href="reservationDelete.jsp?lentno=<%=lentno %>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;" id="c1">삭제</a></td>
       </tr>
<%}
	 
}catch(SQLException e){
	System.out.println("데이터 조회 실패");
	e.printStackTrace();
}

%>
</table>
<div class="btn_group">
<button id="btn1" type="button" onclick="location.href='reservationInsert.jsp'">도서 정보 추가</button>
</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>