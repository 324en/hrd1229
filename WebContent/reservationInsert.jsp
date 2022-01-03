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
		form.action="reservationInsertprocess.jsp";
	}
function changesubmit(){
	document.form.submit();

}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<%@include file="DBconn.jsp" %>
<%
 int no=0;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	 String sql="select lent_seq.nextval from dual";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();
	 if(rs.next()){
		 no=rs.getInt(1);
	 }else{
		 no=0;
	 }
   }catch(SQLException e){
	   System.out.println("sequence조회 오류");
   }
String bookno=request.getParameter("bookno");
String custname=request.getParameter("custname");
String indate=request.getParameter("indate");
String outdate=request.getParameter("outdate");
String t_bookno="",t_bookname="";
int sel=0;

if(bookno==null){
	bookno="";
	custname="";
	indate="";
	outdate="";
}else{
try{
String sql="select bookno,bookname from bookinfo1229 where bookno=?";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1, bookno);
rs=pstmt.executeQuery();
if(rs.next()){
	t_bookno=rs.getString(1);
	t_bookname=rs.getString(2);
	
}else{
	%>
	<script>
	alert("등록되지 않은 도서코드입니다.");
	</script>
	<%
}
}catch(SQLException e){
	System.out.println("bookinfo 테이블 오류");
	e.printStackTrace();
   }
 }
%>
<br><h2 class=h3>도서 대출 예약 정보 등록 화면</h2>
<form name=form method="post" action="reservationInsert.jsp">
<table border="1" id="tab2">
<tr>
     <th width="30%">대출번호</th>
     <td><input id="in2" type="text" name="lentno" value="<%=no%>"></td>
      <th width="30%">고객성명</th>
      <td><input id="in2" type="text" name="custname" value="<%=custname%>"></td>
      </tr>
 <tr>
      <th width="30%">도서코드</th>
      <td><input id="in2" type="text" name="bookno" value="<%=t_bookno %>" onchange="changesubmit();"></td>
      <th width="30%">도서이름</th>
      <td><input id="in2" type="text" name="bookname" value="<%=t_bookname %>"></td>
      </tr>
<tr>
       <th width="30%">대출일자</th>
       <td><input id="in2" type="text" name="outdate" value="<%=outdate %>"></td>
       <th width="30%">반납일자</th>
       <td><input id="in2" type="text" name="indate" value="<%=indate %>" onchange="changesubmit();"
       <%if(indate==""){sel=1;}else{sel=0;} %>></td>
</tr>
<tr>
      <th width="30%">대출상태</th>
      <td>
      <input type="radio" name="status" value="1" <%if(sel==1){%>checked<%}%>>대출
      <input type="radio" name="status" value="2" <%if(sel==0){%>checked<%}%>>반납
      <th width="30%">등급</th>
      <td>
      <select id="in2" name="Class">
      <option value="1" selected>S</option>
      <option value="2">A</option>
      <option value="3">B</option>
      <option value="4">C</option>
      </select>
      </td>
      </tr>
<tr>
       <td colspan=4 align=center>
       <input id="btn1" type="submit" value="저장" onclick="check();">
       <input id="btn1" type="reset" value="취소">
</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>