<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--파일명 : PassMessage.jsp --%>

<%--
	mode가 edit라면 위 value값 주소로 가고 아니면(otherwise) 밑에 value값으로 간다!
	패스워드 검증을 마친 후 결과에 따라 alert() 메세지를 띄워주고
	mode값에 따라 수정 혹은 삭제 페이지로 이동한다.
		- edit : 수정페이지로 이동한다.
		- delete : 삭제는 이미지 앞에서 패스워드 검증이 끝났으므로
				추가적인 확인없이 즉시 삭제처리 한다.
--%>
<c:choose>
	<c:when test="${param.mode=='edit' }">
		<c:set var="moveUrl" value="/DataRoom/DataEdit?idx=${param.idx }&nowPage=${nowPage }" />
	</c:when>
	<c:otherwise>
		<c:set var="moveUrl" value="/DataRoom/DataDelete?idx=${param.idx }&nowPage=${nowPage }" />
	</c:otherwise>
</c:choose>

<script>
<c:choose>
	<c:when test="${PASS_CORRECT }">
		alert("패스워드 검증완료");
		location.href="<c:url value='${moveUrl}' />";
	</c:when>
	<c:otherwise>
		alert("패스워드 검증실패. 뒤로 이동합니다");
		history.back();
	</c:otherwise>
</c:choose>
</script>