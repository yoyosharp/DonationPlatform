<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible"/>
    <meta
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            name="viewport"
    />
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <title>Quản trị</title>
    <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
            rel="stylesheet"
    />

    <link
            href="${pageContext.request.contextPath}/resources/static/admin1/assets/css/styles.css"
            rel="stylesheet"
    />

    <script
            crossorigin="anonymous"
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
    ></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <nav
            class="sb-topnav navbar navbar-expand navbar-dark bg-dark"
            th:fragment="html_nav"
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
                href="#!"
                id="sidebarToggle"
        >
            <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar-->
        <ul class="navbar-nav me-3 me-lg-4">
            <li class="nav-item">
                <a
                        aria-current="page"
                        class="nav-link active"
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
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Chi tiết đợt quyên góp:</h1>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <form action="">
                                    <div class="row">
                                        <div class="col col-6">
                                            <h5 class="mt-4">Mã đợt quyên góp:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.code}"
                                            />
                                            <h5 class="mt-4">Ngày bắt đầu:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.startDate}"
                                            />
                                            <h5 class="mt-4">Tổ chức từ thiện:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.organizationName}"
                                            />
                                            <h5 class="mt-4">Mục tiêu quyên góp:</h5>
                                            <input
                                                    class="form-control"
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.targetMoney}"
                                            />
                                            <h5 class="mt-4">Trạng thái quyên góp:</h5>
                                            <c:choose>
                                                <c:when test="${donation.status == 0}">
                                                    <input
                                                            class="form-control"
                                                            readonly
                                                            type="text"
                                                            value="Mới tạo"
                                                    />
                                                </c:when>
                                                <c:when test="${donation.status == 1}">
                                                    <input
                                                            class="form-control"
                                                            readonly
                                                            type="text"
                                                            value="Đang quyên góp"
                                                    />
                                                </c:when>
                                                <c:when test="${donation.status == 2}">
                                                    <input
                                                            class="form-control"
                                                            readonly
                                                            type="text"
                                                            value="Dừng quyên góp"
                                                    />
                                                </c:when>
                                                <c:when test="${donation.status == 3}">
                                                    <input
                                                            class="form-control"
                                                            readonly
                                                            type="text"
                                                            value="Đóng quyên góp"
                                                    />
                                                </c:when>
                                            </c:choose>
                                        </div>

                                        <div class="col col-6">
                                            <h5 class="mt-4">Tên đợt quyên góp:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.name}"
                                            />
                                            <h5 class="mt-4">Ngày kết thúc:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.endDate}"
                                            />
                                            <h5 class="mt-4">Số điện thoại liên lạc:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.phoneNumber}"
                                            />
                                            <h5 class="mt-4">Số tiền đã quyên góp:</h5>
                                            <input
                                                    class="form-control"
                                                    readonly
                                                    type="text"
                                                    value="${donation.fund}"
                                            />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col col-12">
                                            <h5 class="mt-4">Nội dung:</h5>
                                            <textarea class="form-control" readonly rows="3">
                            ${donation.description}
                          </textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="row mt-4 mx-2">
                                <div class="row my-2">
                                    <div class="col">
                                        <select id="pageSizeSelect" style="width: fit-content">
                                            <option value="" selected disabled>
                                                ${display}
                                            </option>
                                            <option value="5">5</option>
                                            <option value="10">10</option>
                                        </select>
                                        <span style="width: fit-content">entries per page</span>
                                    </div>
                                    <!-- page size section -->
    
                                    <!-- Donation status select section -->
                                    <div class="col text-end">
                                        <span>Trạng thái: </span>
                                        <select id="userDonationStatusSelect" style="width: fit-content">
                                            <option value="" selected disabled>
                                                <c:choose>
                                                    <c:when test="${status==0}">Chờ xác nhận</c:when>
                                                    <c:when test="${status==1}">Đã xác nhận</c:when>
                                                    <c:when test="${status==-1}">Đã từ chối</c:when>                                                   
                                                    <c:otherwise>Tất cả</c:otherwise>
                                                </c:choose>
                                            </option>
                                            <option value="10">Tất cả</option>
                                            <option value="0">Chờ xác nhận</option>
                                            <option value="1">Đã xác nhận</option>
                                            <option value="-1">Đã từ chối</option>                                            
                                        </select>
                                    </div>
                                </div>

                              <h3>Danh sách quyên góp</h3>
                                <table
                                    class="table table-striped"

                                >
                                    <thead>
                                    <tr>
                                        <th>Họ tên</th>
                                        <th>Tiền quyên góp</th>
                                        <th>Ngày quyên góp</th>
                                        <th>Nội dung</th>
                                        <th>Trạng thái</th>
                                        <th style="width: 240px;">Hành động</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach
                                            items="${userDonationList}"
                                            var="userDonation"
                                    >
                                        <tr>
                                            <td>${userDonation.name}</td>
                                            <td>${userDonation.money}</td>
                                            <td>${userDonation.createAt}</td>
                                            <td>${userDonation.text}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${userDonation.status == 0}"><span class="text-warning">Chờ xác nhận</span></c:when>
                                                    <c:when test="${userDonation.status == 1}"><span class="text-success">Đã xác nhận</span></c:when>
                                                    <c:when test="${userDonation.status == -1}"><span class="text-danger">Đã từ chối</span></c:when>
                                                </c:choose>                      
                                            </td>

                                            <td>
                                                <c:if test="${userDonation.status == 0}">
                                                    <button class="btn btn-success me-1 my-1" data-bs-target="#userDonationConfirm${userDonation.id}"
                                                            data-bs-toggle="modal"
                                                            style="width: 100px"
                                                            type="button">Xác nhận
                                                    </button>

                                                    <button class="btn btn-danger me-1 my-1" data-bs-target="#userDonationReject${userDonation.id}"
                                                            data-bs-toggle="modal"
                                                            style="width: 100px"
                                                            type="button">Từ chối
                                                    </button>
                                                </c:if>

                                                <div aria-hidden="true" aria-labelledby="userDonationConfirmLabel"
                                                     class="modal fade"
                                                     id="userDonationConfirm${userDonation.id}" tabindex="-1">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="userDonationConfirmLabel">
                                                                    Chấp nhận quyên góp?</h5>
                                                                <button aria-label="Close" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        type="button"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="userDonationConfirm" method="post">
                                                                    <input id="id" name="userDonationId" type="hidden" value="${userDonation.id}">
                                                                    <input type="hidden" name="donationId" value="${donation.id}">
                                                                    <div class="modal-footer" style="margin-top: 20px">
                                                                        <button class="btn btn-secondary" data-bs-dismiss="modal"
                                                                                type="button">Đóng
                                                                        </button>
                                                                        <button class="btn btn-danger" type="submit">Xác
                                                                            nhận
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div aria-hidden="true" aria-labelledby="userDonationRejectLabel"
                                                     class="modal fade"
                                                     id="userDonationReject${userDonation.id}" tabindex="-1">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="userDonationRejectLabel">
                                                                    Từ chối quyên góp??</h5>
                                                                <button aria-label="Close" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        type="button"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form action="userDonationReject" method="post">
                                                                    <input id="id" name="userDonationId" type="hidden"
                                                                           value="${userDonation.id}">                                                                           
                                                                           <input type="hidden" name="donationId" value="${donation.id}">
                                                                           <div class="modal-footer" style="margin-top: 20px">
                                                                        <button class="btn btn-secondary" data-bs-dismiss="modal"
                                                                                type="button">Đóng
                                                                        </button>
                                                                        <button class="btn btn-danger" type="submit">Từ
                                                                            chối
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Page index section -->
                            <div class="text-center">
                                <c:forEach var="page" begin="1" end="${pageIndex - 1}">
                                    <a href="${pageContext.request.contextPath}/admin/detail?donationId=${donationId}&display=${display}&page=${page}&status=${param.status}">${page}</a>
                                </c:forEach>
                                ${pageIndex}
                                <c:forEach var="page" begin="${pageIndex + 1}" end="${maxPageCount}">
                                    <a href="${pageContext.request.contextPath}/admin/detail?donationId=${donationId}&display=${display}&page=${page}&status=${param.status}">${page}</a>
                                </c:forEach>
                            </div>
                            <!-- Page index section -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <input type="hidden" id="donationId" value="${donationId}" />
            </div>
        </footer>
    </div>
</div>

<script>
    var select = document.getElementById("pageSizeSelect");
    select.addEventListener("change", function () {
      var donationId = document.getElementById("donationId").value;
      var selected = this.value;
      //select the base url
      var url = new URL(window.location.href.toString());
      url.searchParams.set("donationId", donationId);
      url.searchParams.set("display", selected);
      url.searchParams.set("page", 1);
      window.location.href = url.toString();
    });
</script>

<script>
    var select = document.getElementById("userDonationStatusSelect");
    select.addEventListener("change", function () {
      var selected = this.value;
      var donationId = document.getElementById("donationId").value;
      //select the base url
      var url = new URL(window.location.href.toString());
      url.searchParams.set("donationId", donationId);
      url.searchParams.set("status", selected);
      url.searchParams.set("page", 1);
      window.location.href = url.toString();
    });
</script>

<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/JQuery3.3.1.js"></script>
<script
        crossorigin="anonymous"
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/scripts.js"></script>
<script
        crossorigin="anonymous"
        src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
></script>
<script src="${pageContext.request.contextPath}/resources/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>
</html>
