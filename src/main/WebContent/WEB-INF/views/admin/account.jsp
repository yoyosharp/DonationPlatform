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
        <!-- Create home link-->
        <c:url var="adminHomeLink" value="/admin/home">
          <c:param name="currentUserId" value="${currentUser.id}"></c:param>
        </c:url>
        <a class="navbar-brand ps-3" href="${adminHomeLink}">QUẢN TRỊ</a>
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

          <li style="color: white" class="nav-item navbar-text">
            <c:if test="${currentUser != null}">
              Welcome ${currentUser.fullName}!
            </c:if>
          </li>

          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="logout"
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
              <c:url var="accountLink" value="/admin/account">
                <c:param
                  name="currentUserId"
                  value="${currentUser.id}"
                ></c:param>
              </c:url>
              <a class="nav-link" href="${accountLink}">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Quản lý người dùng
              </a>
              <c:url var="donationLink" value="/admin/donation">
                <c:param
                  name="currentUserId"
                  value="${currentUser.id}"
                ></c:param>
              </c:url>
              <a class="nav-link" href="${donationLink}">
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
                <div class="modal fade" id="userAddModal" tabindex="-1" aria-labelledby="userAddModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="userAddModalLabel">Thêm mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form action="addUser" method="post">
                          <div class="row">
                            <div class="col-6">
                              <label for="addName"
                                     class="col-form-label">Name:</label>
                              <input type="text" class="form-control"
                                     id="addName" name="fullName" required>
                            </div>
                            <div class="col-6">
                              <label for="addEmail"
                                     class="col-form-label">Email:</label>
                              <input type="email" class="form-control"
                                     id="addEmail" name="email" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addPhone"
                                     class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control"
                                     id="addPhone" name="phoneNumber" required>
                            </div>
                            <div class="col-6">
                              <label for="addAddress"
                                     class="col-form-label">Địa chỉ:</label>
                              <input type="text" class="form-control"
                                     id="addAddress" name="address" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addUserName"
                                     class="col-form-label">Tài khoản:</label>
                              <input type="text" class="form-control"
                                     id="addUserName" name="userName" required>
                            </div>
                            <div class="col-6">
                              <label for="addPassword"
                                     class="col-form-label">Mật khẩu:</label>
                              <input type="password" class="form-control"
                                     id="addPassword" name="password" required>
                            </div>
                            <div class="col-6">
                              <label for="addRole" class="col-form-label">Vai trò:</label>
                              <select class="form-control" id="addRole" name="roleId" required>
                                <option value="" selected>Chọn loại vai trò</option>
                                <option value="1">Admin</option>
                                <option value="10">User</option>
                              </select>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Thêm </button>
                          </div>
                        </form>
                      </div>
    
                    </div>
                  </div>
                </div>
                <!-- Modal Add-->
              </div>
              <div class="card-body">
                <!-- Search section -->
                <form:form action="searchUser">
                    <div class="row my-2" >
                        <div class="col col-6">
                            <select name="maxDisplayedResult" style="width: fit-content;">
                                <option value="${displayedResult}">${displayedResult}</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                            </select>
                            <span style="width: fit-content;">entries per page</span>
                        </div>
    
                        <div class="col col-6 text-end">
                            <input type="text" name="stringQuery" />
                            <button type="submit">Search</button>
                        </div>
                    </div>
                </form:form>
                <!-- Search section -->
                <table style="border: solid 1px black;" class="table table-striped">
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
                        <tr>
                            <td>Họ tên</td>
                            <td>Email</td>
                            <td>Số điện thoại</td>
                            <td>Tài Khoản</td>
                            <td>Vai Trò</td>
                            <td>Trạng Thái</td>
                            <td>
                              <div class="row d-flex">
                                  <!-- User Info button -->
                                <button type="button" style="width: 80px" class="btn btn-info me-1 my-1" data-bs-toggle="modal"
                                data-bs-target="#userInfoModal">Chi tiết</button>

                                <div class="modal fade" id="userInfoModal" tabindex="-1" aria-labelledby="userInfoModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="userInfoModalLabel">Chi tiết : <span>UserName</span></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>

                                      <div class="modal-body">
                                        <div class="row">
                                          <div class="col-6">
                                            <h5>Họ tên :</h5> <p th:text="${user.fullName}" ></p>
                                            <h5>Email:</h5> <p th:text="${user.email}" ></p>
                                            <h5>Số điện thoại:</h5> <p th:text="${user.phoneNumber}" ></p>
                                            <h5>Tài khoản:</h5> <p th:text="${user.userName}" ></p>
                                          </div>
                                          <div class="col-6">  
                                            <h5>Địa chỉ :</h5> <p th:text="${user.address}" ></p>
                                            <h5>Vai trò:</h5> <p th:text="${user.role.roleName}" ></p>
                                            <h5>Lần đăng nhập gần nhất:</h5> <p th:text="${user.createdAt}" ></p>
                                            <h5>Note:</h5> <p th:text="${user.note}" ></p>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!-- User info button -->

                                <!-- User update button -->
                                <button type="button" style="width: 80px" class="btn btn-primary me-1 my-1" data-bs-toggle="modal"
                                data-bs-target="#userUpdateModal">Sửa</button>

                                <div class="modal fade" id="userUpdateModal" tabindex="-1" aria-labelledby="userUpdateModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg ">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="userUpdateModalLabel">Cập nhật</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>

                                      <div class="modal-body">
                                      <form action="updateUser" method="post">
                                        <input type="hidden" name="id">
                                        <div class="row">
                                          <div class="col-6">
                                            <label for="updateName" class="col-form-label">Họ và tên:</label>
                                            <input type="text" class="form-control" id="updateName" name="fullName" required>
                                          </div>
                                          <div class="col-6">
                                            <label for="updateEmail" class="col-form-label">Email:</label>
                                            <input type="email" class="form-control" id="updateEmail" name="email" placeholder="Email" disabled>
                                          </div>
                                        </div>

                                        <div class="row">
                                          <div class="col-6">
                                            <label for="updatePhone" class="col-form-label">Số điện thoại</label>
                                            <input type="number" class="form-control" id="updatePhone" name="phoneNumber" required>
                                          </div>
                                          <div class="col-6">
                                            <label for="updateAddress" class="col-form-label">Địa chỉ:</label>
                                            <input type="text" class="form-control" id="updateAddress" name="address" required>
                                          </div>
                                        </div>
                        
                                        <div class="row">
                                          <div class="col-6">
                                            <label for="updateUsername" class="col-form-label">Tài khoản:</label>
                                            <input readonly type="text" class="form-control" id="updateUsername" name="userName" disabled>
                                          </div>
                                          <div class="col-6">
                                            <label for="updateRole" class="col-form-label">Vai trò:</label>
                                            <select class="form-control" id="updateRole" name="idRole" required>
                                              <option selected>Chọn vai trò</option>
                                              <option value="1">Admin</option>
                                              <option value="10">User</option>            
                                            </select>
                                          </div>
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                          <button type="submit" class="btn btn-primary">Lưu </button>
                                        </div>
                                      </form>
                                      </div>    
                                    </div>
                                  </div>
                                </div>
                                <!-- User update button -->

                                <!-- User delete button -->
                                <button type="button" style="width: 80px" class="btn btn-danger me-1 my-1" data-bs-toggle="modal"
                                data-bs-target="#userDeleteModal">Xoá</button>

                                <div class="modal fade" id="userDeleteModal" tabindex="-1" aria-labelledby="userDeleteModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="userDeleteModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <p>Người dùng : </p>
                                        <form action="userDelete" method="post">
                                          <input type="hidden" class="form-control" id="id" name="userId" >Hidden ID</input>
                                          <div class="modal-footer" style="margin-top: 20px">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!-- User delete button -->

                                <!--User lock button-->
                                <c:if test="true">
                                  <button type="button" style="width: 80px" class="btn btn-danger me-1 my-1" data-bs-toggle="modal"
                                  data-bs-target="#userLockModal">Khoá</button>
                                </c:if>
                                
                                <div class="modal fade" id="userLockModal" tabindex="-1" aria-labelledby="userLockModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="userLockModalLabel">Bạn chắc chắn muốn khoá ?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <p>Người dùng : </p>
                                        <form action="userDelete" method="post">
                                          <input type="hidden" class="form-control" id="id" name="userId" >Hidden ID</input>
                                          <div class="modal-footer" style="margin-top: 20px">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-danger">Khoá</button>
                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!--User lock button-->
                                
                                <!--User unlock button-->
                                <c:if test="true">
                                  <button type="button" style="width: 80px" class="btn btn-success me-1 my-1" data-bs-toggle="modal"
                                  data-bs-target="#userUnlockModal">Mở</button>
                                </c:if>

                                <div class="modal fade" id="userUnlockModal" tabindex="-1" aria-labelledby="userUnlockModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="userUnlockModalLabel">Bạn chắc chắn muốn mở khóa ?</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                      </div>
                                      <div class="modal-body">
                                        <p>Người dùng : </p>
                                        <form action="userUnlock" method="post">
                                          <input type="hidden" class="form-control" id="id" name="userId" >Hidden ID</input>
                                          <div class="modal-footer" style="margin-top: 20px">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-danger">Mở khoá</button>
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
                    </tbody>
                </table>

                
              </div>
            </div>
          </div>
    
        </main>
    
        <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">
    
        </footer>
      </div>
    </div>
    
    
    
    
    
    
    <script>
      $("#exampleModalView1").on("hidden.bs.modal", function (e) {
        $("#exampleModalView1 iframe").attr(
          "src",
          $("#exampleModalView1 iframe").attr("src")
        );
      });
    </script>
    <script>
      $(document).ready(function () {
        $("#autoWidth,#autoWidth2").lightSlider({
          autoWidth: true,
          loop: true,
          onSliderLoad: function () {
            $("#autoWidth,#autoWidth2").removeClass("cS-hidden");
          },
        });
      });
    </script>
    
    <script>
      ClassicEditor.create(document.querySelector("#editor"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
        });
    </script>
    <script>
      ClassicEditor.create(document.querySelector("#editor1"))
        .then((eidt) => {
          console.log("da" + eidt);
        })
        .catch((error) => {
          console.error(error);
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
