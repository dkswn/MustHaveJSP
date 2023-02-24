<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF_8");

try{
	Connection conn = Util.getConnection();
	String sql = "INSERT INTO tbl_resv_202108 VALUES(?,?,?,?)";
	preparedStatment pstmt = conn.prepareStatment(sql);
}
catch(Exception e){
	
}
%>