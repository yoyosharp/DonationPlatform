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
        
        <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/home">QUẢN TRỊ</a>
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
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/logout"
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
                <h1 class="mt-4">Danh sách người dùng</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#userAddModal">
                            Thêm mới
                        </button>
                        <!-- Modal Add-->
                        <div class="modal fade" id="userAddModal" tabindex="-1" aria-labelledby="userAddModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="userAddModalLabel">Thêm mới</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form:form action="addUser" modelAttribute="user" method="POST">
                                          <form:hidden path="id" />                                      
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="fullName" class="col-form-label">Họ tên:</label>
                                                    <form:input cssClass="form-control" path="fullName" />
                                                    <form:errors path="fullName"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addEmail"
                                                           class="col-form-label">Email:</label>
                                                    <form:input type="email" cssClass="form-control"
                                                           id="addEmail" path="email" />
                                                           <form:errors path="email"></form:errors>       
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="addPhone"
                                                           class="col-form-label">Số điện thoại:</label>
                                                    <form:input type="number" cssClass="form-control"
                                                           id="addPhone" path="phoneNumber" />
                                                           <form:errors path="phoneNumber"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addAddress"
                                                           class="col-form-label">Địa chỉ:</label>
                                                    <form:input type="text" cssClass="form-control"
                                                           id="addAddress" path="address" />
                                                           <form:errors path="address"></form:errors>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <label for="addUserName"
                                                           class="col-form-label">Tài khoản:</label>
                                                    <form:input type="text" cssClass="form-control"
                                                           id="addUserName" path="userName"  />
                                                           <form:errors path="userName"></form:errors>
                                                </div>
                                                <div class="col-6">
                                                    <label for="addPassword"
                                                           class="col-form-label">Mật khẩu:</label>
                                                    <form:input type="password" cssClass="form-control"
                                                           id="addPassword" path="password" />
                                                           <form:errors path="password"></form:errors>
                                                </div>
                                            </div>
                                            
                                                <div class="col-6 mb-2">
                                                    <label for="role_id" class="col-form-label">Vai trò:</label>
                                                    <form:select cssClass="form-control" id="role_id" path="roleId.id" >
                                                        <c:forEach var="role" items="${roleList}">
                                                            <form:option value="${role.id}">${role.roleName}</form:option>
                                                        </c:forEach>                                                      
                                                    </form:select>
                                                </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Đóng
                                                </button>
                                                <button type="submit" class="btn btn-primary">Thêm</button>
                                            </div>
                                        </form:form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Modal Add-->
                    </div>
                    <div class="card-body">
                                                
                        <div class="row my-2">
                            <!-- page size section -->
                            <div class="col col-6">
                                <select id="pageSizeSelect" style="width: fit-content;">
                                    <option value="" selected disabled>${param.display}</option>
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                </select>
                                <span style="width: fit-content;">entries per page</span>
                            </div>
                            <!-- page size section -->
                            
                            <!-- Search section -->     
                            <div class="col col-6 text-end">
                                <form action="searchUser"> 
                                    <c:if test="${stringQuery != null}">
                                        <input id="txtSearch" type="text" name="keyword" placeholder="${stringQuery}"/>
                                    </c:if>
                                 <button type="submit">Search</button>
                            </form>
                            </div>
                            <!-- Search section -->
                        </div>                        
                        
                        
                        <table id="resultTable" style="border: solid 1px black;" class="table table-striped">
                            <thead>
                            <tr style="background-color: rgb(190, 190, 190) !important;">
                                <th>Họ tên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Tài Khoản</th>
                                <th>Vai Trò</th>
                                <th>Trạng Thái</th>
                                <th style="width: 270px;">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td>${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phoneNumber}</td>
                                    <td>${user.userName}</td>
                                    <td>${user.roleId.roleName}</td>
                                    <td id="">
                                        <c:if test="${user.status == 0}">
                                            <span class="text-danger fs-6 fw-bold">Đã khoá</span>
                                        </c:if>
                                        <c:if test="${user.status == 1}">
                                            <span class="text-success fs-6 fw-bold">Hoạt động</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="row d-flex">
                                            <!-- User Info button -->
                                            <button type="button" style="width: 80px" class="btn btn-info me-1 my-1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#userInfoModal${user.id}">Chi tiết
                                            </button>

                                            <div class="modal fade" id="userInfoModal${user.id}" tabindex="-1"
                                                 aria-labelledby="userInfoModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="userInfoModalLabel">Chi tiết :
                                                                <span></span></h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <h5>Họ tên :</h5>
                                                                    <p>${user.fullName}</p>
                                                                    <h5>Email:</h5>
                                                                    <p>${user.email}</p>
                                                                    <h5>Số điện thoại:</h5>
                                                                    <p>${user.phoneNumber}</p>
                                                                    <h5>Tài khoản:</h5>
                                                                    <p>${user.userName}</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <h5>Địa chỉ :</h5>
                                                                    <p>${user.address}</p>
                                                                    <h5>Vai trò:</h5>
                                                                    <p>${user.roleId.roleName}</p>
                                                                    <h5>Khởi tạo:</h5>
                                                                    <p>${user.createdAt}</p>
                                                                    <h5>Note:</h5>
                                                                    <p>${user.note}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- User info button -->

                                            <!-- User update button -->
                                            <button type="button" style="width: 80px" class="btn btn-primary me-1 my-1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#userUpdateModal${user.id}">Sửa
                                            </button>

                                            <div class="modal fade" id="userUpdateModal${user.id}" tabindex="-1"
                                                 aria-labelledby="userUpdateModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg ">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="userUpdateModalLabel">Cập
                                                                nhật</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                            <form:form action="updateUser" method="post" modelAttribute="user">
                                                                
                                                                <form:input type="hidden" path="id" value="${user.id}"/>
                                                                <form:input type="hidden" path="password" value="${user.password}"></form:input>
                                                                
                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="updateName" class="col-form-label">Họ
                                                                            và tên:</label>
                                                                        <form:input type="text" cssClass="form-control"
                                                                               id="updateName" path="fullName"
                                                                               value="${user.fullName}"
                                                                               />
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="updateEmail" class="col-form-label">Email:</label>
                                                                        <form:input type="email" cssClass="form-control"
                                                                               id="updateEmail" path="email"
                                                                               value="${user.email}"
                                                                            readonly="true" />
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="updatePhone" class="col-form-label">Số
                                                                            điện thoại</label>
                                                                        <form:input type="text" cssClass="form-control"
                                                                               id="updatePhone" path="phoneNumber"
                                                                               value="${user.phoneNumber}"
                                                                               />
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <label for="updateAddress"
                                                                               class="col-form-label">Địa chỉ:</label>
                                                                        <form:input type="text" cssClass="form-control"
                                                                               id="updateAddress" path="address"
                                                                               value="${user.address}"
                                                                               />
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-6">
                                                                        <label for="updateUsername"
                                                                               class="col-form-label">Tài khoản:</label>
                                                                        <form:input type="text" cssClass="form-control"
                                                                               id="updateUsername" path="userName"
                                                                               value="${user.userName}" 
                                                                               readonly="true"/>
                                                                    </div>

                                                                    <div class="col-6 mb-2">
                                                                        <label for="role_id" class="col-form-label">Vai trò:</label>
                                                                        <form:select cssClass="form-control" id="role_id" path="roleId.id" >
                                                                            <form:option value="${user.roleId.id}">${user.roleId.roleName}</form:option>
                                                                            <c:forEach var="role" items="${roleList}">
                                                                                <form:option value="${role.id}">${role.roleName}</form:option>
                                                                            </c:forEach>                                                      
                                                                        </form:select>
                                                                    </div>
                                                                                                       
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Đóng
                                                                    </button>
                                                                    <button type="submit" class="btn btn-primary">Lưu
                                                                    </button>
                                                                </div>
                                                            </form:form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- User update button -->

                                            <!-- User delete button -->
                                            <button type="button" style="width: 80px" class="btn btn-danger me-1 my-1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#userDeleteModal${user.id}">Xoá
                                            </button>

                                            <div class="modal fade" id="userDeleteModal${user.id}" tabindex="-1"
                                                 aria-labelledby="userDeleteModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="userDeleteModalLabel">Bạn chắc
                                                                chắn muốn xóa ?</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Người dùng : ${user.fullName}</p>
                                                            <p>User name : ${user.userName}</p>
                                                            <p>Trạng thái:
                                                                <c:if test="${user.status == 0}">
                                                                    <span class="text-danger fs-6 fw-bold">Đã khoá</span>
                                                                </c:if>
                                                                <c:if test="${user.status == 1}">
                                                                    <span class="text-success fs-6 fw-bold">Hoạt động</span>
                                                                </c:if>
                                                            </p>
                                                            <form action="userDelete" method="post">
                                                                                                                            
                                                              <input type="hidden" id="id" name="userId" value="${user.id}">                                                                
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Close
                                                                    </button>
                                                                    <button type="submit" class="btn btn-danger">Xóa
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- User delete button -->


                                            <!-- User lock button -->
                                            <c:if test="${user.status == 1}">
                                                <button type="button" style="width: 80px"
                                                        class="btn btn-warning me-1 my-1" data-bs-toggle="modal"
                                                        data-bs-target="#userLockModal${user.id}">Khoá
                                                </button>
                                            </c:if>


                                            <div class="modal fade" id="userLockModal${user.id}" tabindex="-1"
                                                 aria-labelledby="userLockModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="userLockModalLabel">Bạn chắc
                                                                chắn muốn khoá ?</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Người dùng : ${user.userName}</p>
                                                            <form action="userLock" method="post">                                                               
                                                              <input type="hidden" id="id" name="userId" value="${user.id}">                                                               
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Close
                                                                    </button>
                                                                    <button type="submit" class="btn btn-danger">Khoá
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--User lock button-->

                                            <!--User unlock button-->
                                            <c:if test="${user.status == 0}">
                                                <button type="button" style="width: 80px"
                                                        class="btn btn-success me-1 my-1" data-bs-toggle="modal"
                                                        data-bs-target="#userUnlockModal${user.id}">Mở
                                                </button>
                                            </c:if>

                                            <div class="modal fade" id="userUnlockModal${user.id}" tabindex="-1"
                                                 aria-labelledby="userUnlockModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="userUnlockModalLabel">Bạn chắc
                                                                chắn muốn mở khóa ?</h5>
                                                            <button type="button" class="btn-close"
                                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Người dùng : ${user.userName}</p>
                                                            <form action="userUnlock" method="post">
                                                                                                                           
                                                              <input type="hidden" id="id" name="userId" value="${user.id}"> 
                                                                <div class="modal-footer" style="margin-top: 20px">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-bs-dismiss="modal">Close
                                                                    </button>
                                                                    <button type="submit" class="btn btn-danger">Mở
                                                                        khoá
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--User unlock button-->
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>

                        <!-- Page index section -->
                        <div class="text-center">                            
                            <c:forEach var="page" begin="1" end="${pageIndex - 1}">
                                <a href="${pageContext.request.contextPath}/admin/account?display=${display}&page=${page}">${page}</a>
                            </c:forEach>
                            ${pageIndex}
                            <c:forEach var="page" begin="${pageIndex + 1}" end="${maxPageCount}">
                                <a href="${pageContext.request.contextPath}/admin/account?display=${display}&page=${page}">${page}</a>
                            </c:forEach>                     
                        </div>
                        <!-- Page index section -->
                    </div>
                </div>
            </div>

        </main>

        <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

        </footer>
    </div>
</div>

<script>
    var select = document.getElementById("pageSizeSelect");
    select.addEventListener("change", function(){
        var selected = this.value;
        //select the base url
        var url = new URL(window.location.href.toString());
        url.searchParams.set("display", selected);
        url.searchParams.set("page", 1);
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
