<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>User Lock</title>
  </head>
  <body>
    <script>
      // Display an alert with a "successful" message
      alert("Người dùng đã bị khoá, trở lại trang chủ");

      // Redirect to another page after the user clicks "OK"
      window.location.href = "${pageContext.request.contextPath}/public/home";
    </script>
  </body>
</html>
