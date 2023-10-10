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
                        data-bs-target="#exampleModalAdd">
                  Thêm mới
                </button>
                <!-- Modal Add-->
                <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form method="post" enctype="multipart/form-data">
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Name:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="fullName" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Email:</label>
                              <input type="email" class="form-control"
                                     id="addcost" name="email" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control"
                                     id="addname" name="phoneNumber" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Địa chỉ:</label>
                              <input type="text" class="form-control"
                                     id="addcost" name="address" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname"
                                     class="col-form-label">Tài khoản:</label>
                              <input type="text" class="form-control"
                                     id="addname" name="userName" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost"
                                     class="col-form-label">Mật khẩu:</label>
                              <input type="password" class="form-control"
                                     id="addcost" name="password" required>
                            </div>
                            <div class="col-6">
                              <label for="ct_id" class="col-form-label">Vai trò:</label>
                              <select class="form-control" id="ct_id" name="idRole" required>
                                <option value="" selected>Chọn loại vai trò</option>
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


                <table id="datatablesSimple">
                  <thead>
                  <tr style="background-color: gray !important;">
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>

                    <th>Tài khoản</th>
                    <th>Vai trò</th>
                    <th >Trạng thái</th>
                    <th >Hành động</th>
                  </tr>
                  </thead>
                  <tfoot>
                  <tr>
    
                  </tr>
                  </tfoot>
                  <tbody>
                  <input type="hidden" th:value="${list.size()}" id="dodai" />
                  <th:block th:each="user : ${list}">
                    <tr>
                      <td>Minh Khương</td>
                      <td>khuongtran1410@gmail.com</td>
                      <td>0337792891</td>
                      <td>KhuongTM</td>
                      <td>Admin</td>
                      <td style="color: #1c7430;font-weight: bold">Hoạt động</td>
                      <td style="color: red;font-weight: bold">Đã khóa</td>
                      <td style="width : 270px">
                        <button type="button" style="width: 80px" class="btn btn-success" data-bs-toggle="modal"
                                th:data-bs-target="'#idModelMail'+${user.id}">
                          Gửi
                        </button>
                        <button type="button" style="width: 80px" class="btn btn-primary" data-bs-toggle="modal"
                                th:data-bs-target="'#exampleModal'+${user.id}">
                          Sửa
                        </button>
                        <button type="button" style="width: 80px" class="btn btn-warning" data-bs-toggle="modal"
                                th:data-bs-target="'#idModelDetail'+${user.id}">
                          Chi tiết
                        </button>
                        <button type="button" style="width: 80px" class="btn btn-danger mt-1" data-bs-toggle="modal"
                                th:data-bs-target="'#idModelDel'+${user.id}" >
                          Xóa
                        </button>
                        <form th:if="${user.status == 1}"  th:action="@{/ql-user/lock}" method="post" style="margin-left: 85px;margin-top: -38px">
                          <input type="hidden" class="form-control" id="id" name="idUser" th:value="${user.id}">
                          <button type="submit" style="width: 80px" class="btn btn-danger" >
                            Khóa
                          </button>
                        </form>
    
                        <form th:if="${user.status == 0}"  th:action="@{/ql-user/un-lock}" method="post">
                          <input type="hidden" class="form-control" id="id" name="idUser" th:value="${user.id}">
                          <button type="submit" style="width: 80px" class="btn btn-success" >
                            Mở
                          </button>
                        </form>
                        <div class="modal fade" th:id="'idModelDel' + ${user.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                Người dùng : <span th:text="${user.fullName}"></span>
                                <form th:action="@{/ql-user/delete}" method="post">
                                  <input type="hidden" class="form-control" id="id" name="idUser" th:value="${user.id}">
                                  <div class="modal-footer" style="margin-top: 20px">
                                    <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">
                                      Close
                                    </button>
                                    <button type="submit" class="btn btn-danger">Xóa</button>
    
                                  </div>
                                </form>
                              </div>
    
                            </div>
                          </div>
                        </div>
                        <div class="modal fade" th:id="'idModelMail' + ${user.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Gửi đến: <span th:text="${user.email}"></span></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <form th:action="@{/ql-user/send-mail}" method="post">
                                  <input type="hidden" class="form-control" id="id" name="idUser" th:value="${user.id}">
                                  <label for="addname"
                                         class="col-form-label">Nội dung:</label>
                                  <textarea rows="10"  class="form-control"
                                            id="addname" name="note" ></textarea>
                                  <div class="modal-footer" style="margin-top: 20px">
                                    <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">
                                      Đóng
                                    </button>
                                    <button type="submit" class="btn btn-success">Gửi</button>
    
                                  </div>
                                </form>
    
                              </div>
    
                            </div>
                          </div>
                        </div>
                        <div class="modal fade" th:id="'idModelDetail' + ${user.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Chi tiết : <span th:text="${user.fullName}"></span></h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col-6"> <h5>Họ tên :</h5> <p th:text="${user.fullName}" ></p>
                                    <h5>Email:</h5> <p th:text="${user.email}" ></p>
                                    <h5>Số điện thoại:</h5> <p th:text="${user.phoneNumber}" ></p>
                                    <h5>Tài khoản:</h5> <p th:text="${user.userName}" ></p></div>
                                  <div class="col-6">   <h5>Địa chỉ :</h5> <p th:text="${user.address}" ></p>
                                    <h5>Vai trò:</h5> <p th:text="${user.role.roleName}" ></p>
                                    <h5>Lần đăng nhập gần nhất:</h5> <p th:text="${user.createdAt}" ></p>
                                    <h5>Note:</h5> <p th:text="${user.note}" ></p></div>
    
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                    <!-- Modal Update-->
                    <div class="modal fade" th:id="'exampleModal'+${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg ">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form enctype="multipart/form-data" th:action="@{/ql-user/update}" method="post">
                              <input type="hidden" name="id">
                              <div class="row">
                                <div class="col-6">
                                  <label for="addname"
                                         class="col-form-label">Họ và tên:</label>
                                  <input type="text" class="form-control"
                                         id="addname" name="fullName" required>
                                </div>
                                <div class="col-6">
                                  <label for="addcost"
                                         class="col-form-label">Email:</label>
                                  <input readonly type="email" class="form-control"
                                         id="addcost" name="email" required>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-6">
                                  <label for="addname"
                                         class="col-form-label">Số điện thoại:</label>
                                  <input type="number" class="form-control"
                                         id="addname" name="phoneNumber" required>
                                </div>
                                <div class="col-6">
                                  <label for="addcost"
                                         class="col-form-label">Địa chỉ:</label>
                                  <input type="text" class="form-control"
                                         id="addcost" name="address" required>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-6">
                                  <label for="addname"
                                         class="col-form-label">Tài khoản:</label>
                                  <input readonly type="text" class="form-control"
                                         id="addname" name="userName" required>
                                  <input readonly type="hidden" class="form-control"
                                         id="addname" name="idUser" required>
                                  <input readonly type="hidden" class="form-control"
                                         id="addname" name="password" required>
                                  <input readonly type="hidden" class="form-control"
                                         id="addname" name="status" required>
                                </div>
                                <div class="col-6">
                                  <label for="ct_id" class="col-form-label">Vai trò:</label>
                                  <select class="form-control" id="ct_id" name="idRole" required>
                                    <option th:value="${user.role.id}" th:text="${user.role.roleName}" selected>Chọn loại vai trò</option>
                                    <th:block th:each="role : ${roleList}">
                                      <option th:value="${role.id}" ><span th:text="${role.roleName}"></span></option>
                                    </th:block>
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
                    <!-- Modal Update-->
    
                  </th:block>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
    
        </main>
    
        <script>
    
          ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
            console.log("da" + eidt);
          })
                  .catch(error => {
                    console.error(error);
                  });
    
        </script>
        <script>
    
          var dodai = document.getElementById("dodai").value;
          var a = parseInt(dodai);
          for(var i = 1;i<=a+10;i++){
            var name = "#editor"  + i
            ClassicEditor.create(document.querySelector(name)).then(eidt => {
              console.log("da" + eidt);
            })
                    .catch(error => {
                      console.error(error);
                    });
          }
    
    
        </script>
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
