<DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang = "en">
    <head>
    <title>TEST</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${currentUser != null}">
                <p>Welcome, Admin!</p>
                <p>${currentUser.fullName}</p>
            </c:when>
            <c:otherwise>
                <p>Welcome, Guest!</p>
            </c:otherwise>
        </c:choose>
    </body>

</html>