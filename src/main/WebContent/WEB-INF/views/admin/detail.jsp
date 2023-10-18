<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Quản trị</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css"
    />

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <nav
        th:fragment="html_nav"
        class="sb-topnav navbar navbar-expand navbar-dark bg-dark"
      >
        <!-- Navbar Brand-->
        <a
          class="navbar-brand ps-3"
          href="${pageContext.request.contextPath}/admin/home"
          >QUẢN TRỊ</a
        >
        <!-- Sidebar Toggle-->
        <button
          class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
          id="sidebarToggle"
          href="#!"
        >
          <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar-->
        <ul class="navbar-nav me-3 me-lg-4">
          <li class="nav-item">
            <a
              class="nav-link active"
              aria-current="page"
              href="${pageContext.request.contextPath}/logout"
              >Logout</a
            >
          </li>
        </ul>
      </nav>
    </nav>

    <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/admin/account"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Quản lý người dùng
              </a>
              <a
                class="nav-link"
                href="${pageContext.request.contextPath}/admin/donation"
              >
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Quản lý đợt quyên góp
              </a>
            </div>
          </div>
        </nav>
      </div>

      <div id="layoutSidenav_content">
        <main>
          <main>
            <div class="container-fluid px-4">
              <h1 class="mt-4">Chi tiết đợt quyên góp:</h1>
              <div class="card">
                <div class="card-body">
                  <form action="">
                    <div class="row">
                      <div class="col col-6">
                        <h5 class="mt-4">Mã đợt quyên góp:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.code}"
                          readonly
                        />
                        <h5 class="mt-4">Ngày bắt đầu:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.startDate}"
                          readonly
                        />
                        <h5 class="mt-4">Tổ chức từ thiện:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.organizationName}"
                          readonly
                        />
                        <h5 class="mt-4">Mục tiêu quyên góp:</h5>
                        <input
                          class="form-control"
                          type="text"
                          class="form-control"
                          value="${donation.targetMoney}"
                          readonly
                        />
                        <h5 class="mt-4">Trạng thái quyên góp:</h5>
                        <c:choose>
                          <c:when test="${donation.status == 0}">
                            <input
                              class="form-control"
                              type="text"
                              value="Mới tạo"
                              readonly
                            />
                          </c:when>
                          <c:when test="${donation.status == 1}">
                            <input
                              class="form-control"
                              type="text"
                              value="Đang quyên góp"
                              readonly
                            />
                          </c:when>
                          <c:when test="${donation.status == 2}">
                            <input
                              class="form-control"
                              type="text"
                              value="Dừng quyên góp"
                              readonly
                            />
                          </c:when>
                          <c:when test="${donation.status == 3}">
                            <input
                              class="form-control"
                              type="text"
                              value="Đóng quyên góp"
                              readonly
                            />
                          </c:when>
                        </c:choose>
                      </div>

                      <div class="col col-6">
                        <h5 class="mt-4">Tên đợt quyên góp:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.name}"
                          readonly
                        />
                        <h5 class="mt-4">Ngày kết thúc:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.endDate}"
                          readonly
                        />
                        <h5 class="mt-4">Số điện thoại liên lạc:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.phoneNumber}"
                          readonly
                        />
                        <h5 class="mt-4">Số tiền đã quyên góp:</h5>
                        <input
                          type="text"
                          class="form-control"
                          value="${donation.fund}"
                          readonly
                        />
                      </div>
                    </div>
                    <div class="row">
                      <div class="col col-12">
                        <h5 class="mt-4">Nội dung:</h5>
                        <textarea class="form-control" rows="3" readonly>
${donation.description}
                        </textarea>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </main>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4"></div>
        </footer>
      </div>
    </div>

    <script>
      var select = document.getElementById("pageSizeSelect");
      select.addEventListener("change", function () {
        var selected = this.value;
        //select the base url
        var url = new URL(window.location.href.toString());
        url.searchParams.set("display", selected);
        url.searchParams.set("page", 1);
        window.location.href = url.toString();
      });
    </script>

    <script>
      var select = document.getElementById("donationStatusSelect");
      select.addEventListener("change", function () {
        var selected = this.value;
        //select the base url
        var url = new URL(window.location.href.toString());
        url.searchParams.set("status", selected);
        window.location.href = url.toString();
      });
    </script>

    <script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/JQuery3.3.1.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
  </body>
</html>
