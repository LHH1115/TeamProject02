<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${re == 1 }">
		추가요청사항 등록 완료.
	</c:if>
	<c:if test="${re !=1 }">
		추가요청사항 등록 실패.
	</c:if>
	<hr>
</body>
</html>