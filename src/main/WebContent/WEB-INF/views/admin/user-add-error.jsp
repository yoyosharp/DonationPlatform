<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>
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
        <!-- Create home link-->

        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/home">QUẢN TRỊ</a>
        <!-- Sidebar Toggle-->
        <button
                class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
                id="sidebarToggle"
                href="#!"
        >
            <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <form
                class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
        ></form>

        <!-- Navbar-->
        <ul class="navbar-nav me-3 me-lg-4">
            <!-- User identity-->

            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/public/logout"
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/account">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-tachometer-alt"></i>
                        </div>
                        Quản lý người dùng
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/admin/donation">
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
                <h1 class="mt-4">Thêm người dùng mới</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        
                    </div>
                    <div class="card-body">
                            <div class="row">
                                <form:form action="addUser" modelAttribute="user" method="POST">
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="fullName" class="col-form-label">Họ tên:</label>
                                                    <form:input cssClass="form-control" path="fullName" />
                                                    <form:errors path="fullName" cssClass="text-danger"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addEmail"
                                                           class="col-form-label">Email:</label>
                                                    <form:input type="email" cssClass="form-control"
                                                           id="addEmail" path="email" />
                                                           <form:errors path="email" cssClass="text-danger"></form:errors>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="addPhone"
                                                           class="col-form-label">Số điện thoại:</label>
                                                    <form:input type="number" cssClass="form-control"
                                                           id="addPhone" path="phoneNumber" />
                                                           <form:errors path="phoneNumber" cssClass="text-danger"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addAddress"
                                                           class="col-form-label">Địa chỉ:</label>
                                                    <form:input type="text" cssClass="form-control"
                                                           id="addAddress" path="address" />
                                                           <form:errors path="address" cssClass="text-danger"></form:errors>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="addUserName"
                                                           class="col-form-label">Tài khoản:</label>
                                                    <form:input type="text" cssClass="form-control"
                                                           id="addUserName" path="userName"  />
                                                           <form:errors path="userName" cssClass="text-danger"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addPassword"
                                                           class="col-form-label">Mật khẩu:</label>
                                                    <form:input type="password" cssClass="form-control"
                                                           id="addPassword" path="password" />
                                                           <form:errors path="password" cssClass="text-danger"></form:errors>
                                                </div>
                                            </div>
                                            <div class="col-6 mb-2">
                                                <label for="role_id" class="col-form-label">Vai trò:</label>
                                                <form:select cssClass="form-control" id="role_id" path="roleId.id" >                                                    
                                                    <c:forEach var="role" items="${roleList}">
                                                        <c:if test="{role.id == user.roleId.id}">
                                                            <form:option value="${role.id}" selected="true">${role.roleName}</form:option>
                                                        </c:if>
                                                        <form:option value="${role.id}">${role.roleName}</form:option>
                                                    </c:forEach>                                                      
                                                </form:select>
                                            </div>

                                            <div class= "mx-auto my-3">
                                                <a type="button" class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/account">
                                                    Trở lại
                                                </a>
                                                <button type="submit" class="btn btn-primary">Thêm</button>
                                            </div>
                                </form:form>                                
                            </div>
                    </div>
                </div>
            </div>
        </main>

    </div>
</div>


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
