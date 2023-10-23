<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
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
                    <h1 class="mt-4">Danh sách đợt quyên góp</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            <button
                                    type="button"
                                    class="btn btn-success"
                                    data-bs-toggle="modal"
                                    data-bs-target="#donationAddModal"
                            >
                                Thêm mới
                            </button>
                            <!-- Modal Add-->
                            <div
                                    class="modal fade"
                                    id="donationAddModal"
                                    tabindex="-1"
                                    aria-labelledby="donationAddModalLabel"
                                    aria-hidden="true"
                            >
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="donationAddModalLabel">
                                                Thêm mới
                                            </h5>
                                            <button
                                                    type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close"
                                            ></button>
                                        </div>
                                        <div class="modal-body">
                                            <form:form
                                                    action="addDonation"
                                                    modelAttribute="donation"
                                                    method="POST"
                                            >
                                                
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label for="code" class="col-form-label"
                                                        >Mã đợt quyên góp:</label
                                                        >
                                                        <form:input
                                                                cssClass="form-control"
                                                                path="code"
                                                        />
                                                        <form:errors path="code"></form:errors>
                                                    </div>
                                                    <div class="col-6">
                                                        <label for="name" class="col-form-label"
                                                        >Tên đợt quyên góp:</label
                                                        >
                                                        <form:input
                                                                type="text"
                                                                cssClass="form-control"
                                                                path="name"
                                                        />
                                                        <form:errors path="name"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label for="startDate" class="col-form-label"
                                                        >Ngày bắt đầu:</label
                                                        >
                                                        <form:input
                                                                type="date"
                                                                cssClass="form-control"
                                                                id="startDate"
                                                                path="startDate"
                                                        />
                                                        <form:errors path="startDate"></form:errors>
                                                    </div>
                                                    <div class="col-6">
                                                        <label for="endDate" class="col-form-label"
                                                        >Ngày kết thúc:</label
                                                        >
                                                        <form:input
                                                                type="date"
                                                                cssClass="form-control"
                                                                id="endDate"
                                                                path="endDate"
                                                        />
                                                        <form:errors path="endDate"></form:errors>
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
                                                        />
                                                        <form:errors
                                                                path="organizationName"
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
                                                            
                                                        />
                                                        <form:errors path="phoneNumber"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label for="targetMoney" class="col-form-label"
                                                        >Mục tiêu quyên góp:</label
                                                        >
                                                        <form:input
                                                                type="number"
                                                                cssClass="form-control"
                                                                id="targetMoney"
                                                                path="targetMoney"
                                                                
                                                        />
                                                        <form:errors
                                                                path="organizationName"
                                                        ></form:errors>
                                                    </div>

                                                </div>
                                                <div class="col-12">
                                                    <label for="description" class="col-form-label"
                                                    >Nội dung:</label
                                                    >
                                                    <form:textarea
                                                            path="description"
                                                            cssClass="form-control"
                                                            cols="50"
                                                            rows="5"
                                                    ></form:textarea>
                                                </div>

                                                <div class="modal-footer">
                                                    <button
                                                            type="button"
                                                            class="btn btn-secondary"
                                                            data-bs-dismiss="modal"
                                                    >
                                                        Đóng
                                                    </button>
                                                    <button type="submit" class="btn btn-primary">
                                                        Thêm
                                                    </button>
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
                                    <select id="donationStatusSelect" style="width: fit-content">
                                        <option value="" selected disabled>
                                            <c:choose>
                                                <c:when test="${status==0}">Mới tạo</c:when>
                                                <c:when test="${status==1}">Đang quyên góp</c:when>
                                                <c:when test="${status==2}">Dừng quyên góp</c:when>
                                                <c:when test="${status==3}">Đã đóng</c:when>
                                                <c:otherwise>Tất cả</c:otherwise>
                                            </c:choose>
                                        </option>
                                        <option value="10">Tất cả</option>
                                        <option value="0">Mới tạo</option>
                                        <option value="1">Đang quyên góp</option>
                                        <option value="2">Dừng quyên góp</option>
                                        <option value="3">Đã đóng</option>
                                    </select>
                                </div>
                                <!-- Search section -->
                                <div class="col text-end">
                                    <form action="searchDonation">
                                        <c:if test="${stringQuery != null}">
                                            <input
                                                    id="txtSearch"
                                                    type="text"
                                                    name="keyword"
                                                    placeholder="${stringQuery}"
                                            />
                                        </c:if>
                                        <button type="submit">Search</button>
                                    </form>
                                </div>
                                <!-- Search section -->
                            </div>

                            <table id="resultTable" style="border: solid 1px black;" class="table table-striped">
                                <thead>
                                <tr style="background-color: rgb(190, 190, 190) !important;">
                                    <th class="text-center">Mã</th>
                                    <th class="text-center">Tên</th>
                                    <th class="text-center">Ngày bắt đầu</th>
                                    <th class="text-center">Ngày kết thúc</th>
                                    <th class="text-center">Tổ chức</th>
                                    <th class="text-center">Số điện thoại</th>
                                    <th class="text-center">Mục tiêu</th>
                                    <th class="text-center">Tổng tiền</th>
                                    <th class="text-center">Trạng thái</th>
                                    <th style="width: 220;">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="donation" items="${donationList}">
                                    <tr>
                                        <td>${donation.code}</td>
                                        <td>${donation.name}</td>
                                        <td>${donation.startDate}</td>
                                        <td>${donation.endDate}</td>
                                        <td>${donation.organizationName}</td>
                                        <td>${donation.phoneNumber}</td>
                                        <td>${donation.targetMoney}</td>
                                        <td>${donation.fund}</td>
                                        <td id="">
                                            <c:if test="${donation.status == 0}">
                                                <span class="text-black fs-6 fw-bold">Mới tạo</span>
                                            </c:if>
                                            <c:if test="${donation.status == 1}">
                                                <span class="text-success fs-6 fw-bold">Đang quyên góp</span>
                                            </c:if>
                                            <c:if test="${donation.status == 2}">
                                                <span class="text-warning fs-6 fw-bold">Dừng quyên góp</span>
                                            </c:if>
                                            <c:if test="${donation.status == 3}">
                                                <span class="text-danger fs-6 fw-bold">Đã đóng</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="row d-flex">
                                                <!-- Donation Info button -->
                                                <form action="detail" style="padding: 0; width: 100px;" class="my-1 me-1">
                                                    <input type="hidden" value="${donation.id}" name="donationId">
                                                    <button type="submit" style="width: 100px"
                                                        class="btn btn-info"                                                    
                                                        >Chi tiết
                                                     </button>
                                                </form>
                                                
                                                <!-- Donation Info button -->
                                                
                                                <!-- Donation update button -->

                                                <c:if test="${donation.status != 3}">
                                                    <button type="button" style="width: 100px"
                                                            class="btn btn-primary me-1 my-1"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#donationUpdateModal${donation.id}">Sửa
                                                    </button>
                                                </c:if>

                                                <div class="modal fade" id="donationUpdateModal${donation.id}"
                                                     tabindex="-1"
                                                     aria-labelledby="donationUpdateModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg ">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="donationUpdateModalLabel">
                                                                    Cập
                                                                    nhật</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>

                                                            <div class="modal-body">
                                                                <form:form action="updateDonation" method="post"
                                                                           modelAttribute="donation">

                                                                    <form:input type="hidden" path="id"
                                                                                value="${donation.id}"/>

                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <label for="updateCode"
                                                                                   class="col-form-label">Mã chiến
                                                                                dịch</label>
                                                                            <form:input type="text"
                                                                                        cssClass="form-control"
                                                                                        id="updateCode" path="code"
                                                                                        value="${donation.code}"
                                                                            />
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label for="updateName"
                                                                                   class="col-form-label">Tên chiến
                                                                                dịch:</label>
                                                                            <form:input type="text"
                                                                                        cssClass="form-control"
                                                                                        id="updateName" path="name"
                                                                                        value="${donation.name}"
                                                                            />
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-6">
                                                                            <label for="updateEndDate"
                                                                                   class="col-form-label">Ngày kết
                                                                                thúc:</label>
                                                                            <form:input type="date"
                                                                                        cssClass="form-control"
                                                                                        id="updateEndDate"
                                                                                        path="endDate"
                                                                            />
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label for="updateTargetMoney"
                                                                                   class="col-form-label">Mục tiêu quyên
                                                                                góp</label>
                                                                            <form:input type="text"
                                                                                        cssClass="form-control"
                                                                                        id="updateTargetMoney"
                                                                                        path="targetMoney"
                                                                                        value="${donation.targetMoney}"
                                                                            />
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">

                                                                        <div class="col-6">
                                                                            <label for="updateOrganization"
                                                                                   class="col-form-label">Tên tổ
                                                                                chức</label>
                                                                            <form:input type="text"
                                                                                        cssClass="form-control"
                                                                                        id="updateOrganization"
                                                                                        path="organizationName"
                                                                                        value="${donation.organizationName}"
                                                                            />
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <label for="updatePhoneNumber"
                                                                                   class="col-form-label">Số điện
                                                                                thoại:</label>
                                                                            <form:input type="text"
                                                                                        cssClass="form-control"
                                                                                        id="updatePhoneNumber"
                                                                                        path="phoneNumber"
                                                                                        value="${donation.phoneNumber}"
                                                                            />
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <label for="updateDescription"
                                                                                   class="col-form-label"
                                                                            >Nội dung:</label
                                                                            >
                                                                            <form:textarea
                                                                                    path="description"
                                                                                    cssClass="form-control"
                                                                                    cols="50"
                                                                                    rows="5"
                                                                                    id="updateDescription"
                                                                            ></form:textarea>
                                                                        </div>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-primary">
                                                                            Lưu
                                                                        </button>
                                                                    </div>
                                                                </form:form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Donation update button -->

                                                <!-- Donation delete button -->

                                                <c:if test="${donation.status == 0}">
                                                    <button type="button" style="width: 100px"
                                                            class="btn btn-danger me-1 my-1"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#donationDeleteModal${donation.id}">Xoá
                                                    </button>
                                                </c:if>

                                                <div class="modal fade" id="donationDeleteModal${donation.id}"
                                                     tabindex="-1"
                                                     aria-labelledby="donationDeleteModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="donationDeleteModalLabel">
                                                                    Bạn chắc
                                                                    chắn muốn xóa ?</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Chiến dịch : ${donation.name}</p>
                                                                <p>Mã chiến dịch: ${donation.code}</p>
                                                                <p>Trạng thái: <span class="fs-6">Mới tạo</span></p>

                                                                <form action="donationDelete" method="post">
                                                                    <input type="hidden" id="id" name="donationId"
                                                                           value="${donation.id}">
                                                                    <div class="modal-footer" style="margin-top: 20px">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-danger">Xóa
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Donation delete button -->


                                                <!-- Start donation button -->
                                                <c:if test="${donation.status == 0}">
                                                    <button type="button" style="width: 140px"
                                                            class="btn btn-success me-1 my-1" data-bs-toggle="modal"
                                                            data-bs-target="#donationActiveModal${donation.id}">Quyên
                                                        góp
                                                    </button>
                                                </c:if>

                                                <div class="modal fade" id="donationActiveModal${donation.id}"
                                                     tabindex="-1"
                                                     aria-labelledby="donationActiveModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="donationActiveModalLabel">
                                                                    Bắt đầu nhận quyên góp?</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Chiến dịch quyên góp: ${donation.name}</p>
                                                                <p>Mã chiến dịch: ${donation.code}</p>
                                                                <form action="donationActive" method="post">
                                                                    <input type="hidden" id="id" name="donationId"
                                                                           value="${donation.id}">
                                                                    <div class="modal-footer" style="margin-top: 20px">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-danger">Xác
                                                                            nhận
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--Start donation button-->

                                                <!--Stop donation button-->
                                                <c:if test="${donation.status == 1}">
                                                    <button type="button" style="width: 100px"
                                                            class="btn btn-warning me-1 my-1" data-bs-toggle="modal"
                                                            data-bs-target="#userUnlockModal${donation.id}">Kết thúc
                                                    </button>
                                                </c:if>

                                                <div class="modal fade" id="userUnlockModal${donation.id}" tabindex="-1"
                                                     aria-labelledby="userUnlockModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="userUnlockModalLabel">Kết
                                                                    thúc đợt quyên góp?</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Chiến dịch quyên góp: ${donation.name}</p>
                                                                <p>Mã chiến dịch: ${donation.code}</p>
                                                                <form action="donationStop" method="post">

                                                                    <input type="hidden" id="id" name="donationId"
                                                                           value="${donation.id}">
                                                                    <div class="modal-footer" style="margin-top: 20px">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-danger">Kết
                                                                            thúc
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Stop donation button-->

                                                <!-- Close Donation button -->
                                                <c:if test="${donation.status == 2}">
                                                    <button type="button" style="width: 100px"
                                                            class="btn btn-danger me-1 my-1" data-bs-toggle="modal"
                                                            data-bs-target="#userUnlockModal${donation.id}">Đóng
                                                    </button>
                                                </c:if>

                                                <div class="modal fade" id="userUnlockModal${donation.id}" tabindex="-1"
                                                     aria-labelledby="userUnlockModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="userUnlockModalLabel">Đóng
                                                                    đợt quyên góp?</h5>
                                                                <button type="button" class="btn-close"
                                                                        data-bs-dismiss="modal"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>Chiến dịch quyên góp: ${donation.name}</p>
                                                                <p>Mã chiến dịch: ${donation.code}</p>
                                                                <form action="donationClose" method="post">

                                                                    <input type="hidden" id="id" name="donationId"
                                                                           value="${donation.id}">
                                                                    <div class="modal-footer" style="margin-top: 20px">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-danger">
                                                                            Đóng
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Close Donation button-->
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                            <!-- Page index section -->
                            <div class="text-center">
                                <c:forEach var="page" begin="1" end="${pageIndex - 1}">
                                    <a href="${pageContext.request.contextPath}/admin/donation?display=${display}&page=${page}&status=${param.status}">${page}</a>
                                </c:forEach>
                                ${pageIndex}
                                <c:forEach var="page" begin="${pageIndex + 1}" end="${maxPageCount}">
                                    <a href="${pageContext.request.contextPath}/admin/donation?display=${display}&page=${page}&status=${param.status}">${page}</a>
                                </c:forEach>
                            </div>
                            <!-- Page index section -->

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
    select.addEventListener("change", function(){
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
    select.addEventListener("change", function(){
        var selected = this.value;
        //select the base url
        var url = new URL(window.location.href.toString());
        url.searchParams.set("status", selected);
        url.searchParams.set("page", 1)
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
