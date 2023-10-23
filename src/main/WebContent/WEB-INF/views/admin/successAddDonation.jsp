<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Success Page</title>
  </head>
  <body>
    <script>
      // Display an alert with a "successful" message
      alert("Thêm thành công");

      // Redirect to another page after the user clicks "OK"
      window.location.href = "${pageContext.request.contextPath}/admin/donation";
    </script>
  </body>
</html>
