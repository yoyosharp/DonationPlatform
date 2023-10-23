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
        <!-- Navbar Brand-->

        <!-- Navbar Search-->
        <form
          class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
        ></form>
        <!-- Navbar Search-->

        <!-- Navbar-->
        <ul class="navbar-nav me-3 me-lg-4">
          <li class="nav-item">
            <a
              class="nav-link active"
              aria-current="page"
              href="${pageContext.request.contextPath}/public/logout"
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
          <div class="container-fluid px-4">
            <h1 class="mt-4">Thêm chiến dịch mới</h1>
            <div class="card mb-4">
              <div class="card-header"></div>
              <div class="card-body">
                <div class="row">
                  <form:form
                    action="updateDonation"
                    modelAttribute="donation"
                    method="POST"
                  >
                    <form:input
                      type="hidden"
                      path="id"
                      value="${donation.id}"
                    />
                    <div class="row">
                      <div class="col-6">
                        <label for="code" class="col-form-label"
                          >Mã đợt quyên góp:</label
                        >
                        <form:input
                          cssClass="form-control"
                          path="code"
                          value="${donation.code}"
                        />
                        <form:errors
                          path="code"
                          cssClass="text-danger"
                        ></form:errors>
                      </div>
                      <div class="col-6">
                        <label for="name" class="col-form-label"
                          >Tên đợt quyên góp:</label
                        >
                        <form:input
                          type="text"
                          cssClass="form-control"
                          path="name"
                          value="${donation.name}"
                        />
                        <form:errors
                          path="name"
                          cssClass="text-danger"
                        ></form:errors>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <label for="endDate" class="col-form-label"
                          >Ngày kết thúc:</label
                        >
                        <form:input
                          type="date"
                          cssClass="form-control"
                          id="endDate"
                          path="endDate"
                          value="${donation.endDate}"
                        />
                        <form:errors
                          path="endDate"
                          cssClass="text-danger"
                        ></form:errors>
                      </div>

                      <div class="col-6">
                        <label for="targetMoney" class="col-form-label"
                          >Mục tiêu quyên góp:</label
                        >
                        <form:input
                          type="number"
                          cssClass="form-control"
                          id="targetMoney"
                          path="targetMoney"
                          value="${donation.targetMoney}"
                        />
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-6">
                        <label for="organization" class="col-form-label"
                          >Tổ chức:</label
                        >
                        <form:input
                          type="text"
                          cssClass="form-control"
                          id="organization"
                          path="organizationName"
                          value="${donation.organizationName}"
                        />
                        <form:errors
                          path="organizationName"
                          cssClass="text-danger"
                        ></form:errors>
                      </div>
                      <div class="col-6">
                        <label for="phoneNumber" class="col-form-label"
                          >Số điện thoại:</label
                        >
                        <form:input
                          type="number"
                          cssClass="form-control"
                          id="phoneNumber"
                          path="phoneNumber"
                          value="${donation.phoneNumber}"
                        />
                        <form:errors
                          path="phoneNumber"
                          cssClass="text-danger"
                        ></form:errors>
                      </div>
                    </div>
                    <div class="row"></div>
                    <div class="col-12">
                      <label for="description" class="col-form-label"
                        >Nội dung:</label
                      >
                      <form:textarea
                        path="description"
                        cssClass="form-control"
                        cols="50"
                        rows="5"
                        value="${donation.description}"
                      ></form:textarea>
                    </div>

                    <div class="mx-auto my-3">
                      <a
                        type="button"
                        class="btn btn-secondary"
                        href="${pageContext.request.contextPath}/admin/donation"
                      >
                        Trở lại
                      </a>
                      <button type="submit" class="btn btn-primary">
                        Thêm
                      </button>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4"></div>
        </footer>
      </div>
    </div>

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
