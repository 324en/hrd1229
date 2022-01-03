<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.lentno.value==""){
		alert("대출번호가 입력되지 않았습니다.");
		document.form.lentno.focus();
	}else if(document.form.custname.value==""){
		alert("고객성명이 입력되지 않았습니다.");
		document.form.custname.focus();
	}else if(document.form.bookno.value==""){
		alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();
	}else if(document.form.bookname.value==""){
		alert("도서이름이 입력되지 않았습니다.");
		document.form.bookname.focus();
	}else if(document.form.outdate.value==""){
		alert("대출일자가 입력되지 않았습니다.");
		document.form.outdate.focus();
	}else if(document.form.indate.value==""){
		alert("반납일자가 입력되지 않았습니다.");
		document.form.indate.focus();
	}else 
		document.form.submit();
	   System.out.println("수정완료 ");
	}

</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<%@include file="DBconn.jsp" %>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
String lentno=request.getParameter("lentno");
try{
	 String sql="select lentno,custname,a.bookno,bookname,to_char(outdate,'yyyy-mm-dd'),to_char(indate,'yyyy-mm-dd'),status,class from bookinfo1229 b,reservation1229 a where a.bookno=b.bookno and lentno=?";
	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1, lentno);
	 rs=pstmt.executeQuery();
	 if(rs.next()){
		 String custname=rs.getString("custname");
		 String bookno=rs.getString("bookno");
		 String bookname=rs.getString("bookname");
		 String outdate=rs.getString(5);
		 String indate=rs.getString(6);
		 String status=rs.getString("status");
		 String Class=rs.getString("Class");
		 if(Class==null){
			 Class="";
		 }
		 
%>
<br><h2 class=h3>도서 대출 예약 정보 등록 화면</h2>
<form name=form method="post" action="reservationUpdateprocess.jsp">
<table border="1" id="tab2">
<tr>
     <th width="30%">대출번호</th>
     <td><input id="in2" type="text" name="lentno" value="<%=lentno%>"></td>
      <th width="30%">고객성명</th>
      <td><input id="in2" type="text" name="custname" value="<%=custname%>"></td>
      </tr>
 <tr>
      <th width="30%">도서코드</th>
      <td><input id="in2" type="text" name="bookno" value="<%=bookno %>"></td>
      <th width="30%">도서이름</th>
      <td><input id="in2" type="text" name="bookname" value="<%=bookname %>"></td>
      </tr>
<tr>
       <th width="30%">대출일자</th>
       <td><input id="in2" type="text" name="outdate" value="<%=outdate %>"></td>
       <th width="30%">반납일자</th>
       <td><input id="in2" type="text" name="indate" value="<%=indate %>"></td>
</tr>
<tr>
      <th width="30%">대출상태</th>
      <td>
      <input type="radio" name="status" value="1" <%=status.equals("1")?"checked":"" %>>대출
      <input type="radio" name="status" value="2" <%=status.equals("2")?"checked":"" %>>반납
      <th width="30%">등급</th>
      <td>
      <select id="in2" name="Class">
      <option value="" <%if(Class==null){%>selected<%} %>>S</option>
      <option value="1" <%if(Class.equals("S")){%>selected<%} %>>S</option>
      <option value="2" <%if(Class.equals("A")){%>selected<%} %>>A</option>
      <option value="3" <%if(Class.equals("B")){%>selected<%} %>>B</option>
      <option value="4" <%if(Class.equals("C")){%>selected<%} %>>C</option>
      </select>
      </td>
      </tr>
<tr>
       <td colspan=4 align=center>
       <input id="btn1" type="submit" value="저장" onclick="check();">
       <input id="btn1" type="reset" value="취소">
</table>
</form>

<%
	 }
}catch(SQLException e){
	   System.out.println("조회 오류");
	   e.printStackTrace();
}
%>
</section>
<%@include file="footer.jsp" %>
</body>
</html>