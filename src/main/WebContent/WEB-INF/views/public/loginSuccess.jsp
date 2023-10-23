<!DOCTYPE html>
<html lang="en">
  <input
    type="hidden"
    id="contextPath"
    value="${pageContext.request.contextPath}"
  />
  <input type="hidden" id="userId" value="${userId}" />

  <script>
    var context = document.getElementById("contextPath").value;
    context += "/public/home";
    console.log(context);
    var url = new URL(context, window.location.href);

    var userId = document.getElementById("userId");
    url.searchParams.set("userId", userId.value);

    window.location.href = url.toString();
  </script>
</html>
