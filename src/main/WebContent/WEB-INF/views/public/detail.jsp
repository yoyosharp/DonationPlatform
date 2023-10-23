<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Donation website &mdash; Website Donation</title>
    <meta charset="utf-8" />
    <meta
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
      name="viewport"
    />

    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/custom-bs.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/jquery.fancybox.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/bootstrap-select.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/icomoon/style.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/fonts/line-icons/style.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/owl.carousel.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/animate.min.css"
      rel="stylesheet"
    />

    <!-- MAIN CSS -->
    <link
      href="${pageContext.request.contextPath}/resources/static/user/assets/css/style.css"
      rel="stylesheet"
    />

    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/stickyfill.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.easing.1.3.js"></script>

    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/jquery.animateNumber.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/user/assets/js/custom.js"></script>

    <script
      crossorigin="anonymous"
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
    ></script>
    <script
      crossorigin="anonymous"
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    ></script>
  </head>
  <body id="top">
    <div class="site-wrap">
      <!-- NAVBAR -->
      <header class="site-navbar mt-3">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-end">
            <div class="site-logo col-6">
              <div class="site-logo col-6">
                <c:if test="${userId != null}">
                  <a
                    href="${pageContext.request.contextPath}/public/home?userId=${userId}"
                    >Website Quyên Góp</a
                  >
                </c:if>
                <c:if test="${userId == null}">
                  <a href="">Website Quyên Góp</a>
                </c:if>
              </div>
            </div>

            <div class="col-6">
              <p style="text-align: right">
                <c:choose>
                  <c:when test="${userId != null}">
                    <a
                      class="nav-link active"
                      href="${pageContext.request.contextPath}/public/logout"
                      >Logout</a
                    >
                  </c:when>

                  <c:otherwise>
                    <a
                      class="nav-link active"
                      href="${pageContext.request.contextPath}/public/login"
                      >Login</a
                    >
                  </c:otherwise>
                </c:choose>
              </p>
            </div>
          </div>
        </div>
      </header>

      <!-- HOME -->
      <section class="section-hero overlay inner-page bg-image">
        <div class="container">
          <div class="row">
            <div class="col-md-7">
              <h1 class="text-white font-weight-bold">
                Chi tiết đợt quyên góp
              </h1>
              <div class="custom-breadcrumbs"></div>
            </div>
          </div>
        </div>
      </section>

      <section class="site-section">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="mb-5">
                <h3 class="h5 d-flex align-items-center mb-4 text-primary">
                  <span class="icon-align-left mr-3"></span>Nội dung của đợt
                  quyên góp
                </h3>
                <span>${donation.description}</span>
              </div>

              <div class="pt-5">
                <h5 class="mb-5 text-primary">Lượt quyên góp gần nhất</h5>
                <ul class="comment-list">
                  <c:forEach var="userDonation" items="${userDonations}">
                    <li class="comment">
                      <div class="comment-body">
                        <h5>${userDonation.name}</h5>
                        <p>Thời gian: <span>${userDonation.createAt}</span></p>
                        <p>Số tiền: <span>${userDonation.money}</span></p>
                      </div>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>

            <div class="col-lg-6">
              <div class="bg-light p-3 border rounded mb-4">
                <h3 class="text-primary mt-3 h5 pl-3 mb-3">Thông tin</h3>
                <ul class="list-unstyled pl-3 mb-0">
                  <li class="mb-2">
                    <strong class="text-black">Mã đợt quyên góp: </strong>
                    <span>${donation.code}</span>
                  </li>
                  <li class="mb-2">
                    <strong class="text-black">Tên đợt quyên góp: </strong>
                    <span>${donation.name}</span>
                  </li>
                  <li class="mb-2">
                    <strong class="text-black">Ngày bắt đầu: </strong>
                    <span>${donation.startDate}</span>
                  </li>
                  <li class="mb-2">
                    <strong class="text-black">Ngày kết thúc: </strong>
                    <span>${donation.endDate}</span>
                  </li>
                  <li class="mb-2">
                    <strong class="text-black">Cá nhân/Tổ chức: </strong>
                    <span>${donation.organizationName}</span>
                  </li>
                  <li class="mb-2">
                    <strong class="text-black">Số điện thoại: </strong>
                    <span>${donation.phoneNumber}</span>
                  </li>

                  <c:if test="${donation.targetMoney != null}">
                    <li class="mb-2">
                      <strong class="text-black">Mục tiêu quyên góp: </strong>
                      <span>${donation.targetMoney}</span>
                    </li>
                  </c:if>

                  <li class="mb-2">
                    <strong class="text-black"
                      >Tổng tiền quyên góp nhận được:
                    </strong>
                    <span>${donation.fund}</span>
                  </li>

                  <li class="mb-2">
                    <strong class="text-black">Trạng thái: </strong>
                    <c:choose>
                      <c:when test="${donation.status == 0}"
                        ><span>Mới tạo</span></c:when
                      >
                      <c:when test="${donation.status == 1}"
                        ><span>Đang quyên góp</span></c:when
                      >
                      <c:when test="${donation.status == 2}"
                        ><span>Dừng quyên góp</span></c:when
                      >
                      <c:when test="${donation.status == 3}"
                        ><span>Đã đóng</span></c:when
                      >
                    </c:choose>
                  </li>
                </ul>
              </div>

              <c:if test="${donation.status == 1}">
                <div class="bg-light p-3 border rounded">
                  <button
                    class="btn btn-block btn-primary btn-md"
                    data-target="#donateModal"
                    data-toggle="modal"
                    style="color: white"
                    type="button"
                  >
                    Quyên góp
                  </button>
                </div>
              </c:if>
            </div>
          </div>
        </div>
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div
          aria-hidden="true"
          aria-labelledby="exampleModalLabel"
          class="modal fade"
          id="donateModal"
          role="dialog"
          tabindex="-1"
        >
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Quyên góp</h5>
                <button
                  aria-label="Close"
                  class="close"
                  data-dismiss="modal"
                  type="button"
                >
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form:form
                action="detail/userDonate"
                method="post"
                modelAttribute="userDonation"
              >
                <div class="modal-body">
                  <div class="row">
                    <div class="col-12">
                      <label for="addname" class="col-form-label"
                        >Họ tên:</label
                      >
                      <form:input
                        path="name"
                        cssClass="form-control"
                      ></form:input>
                      <label for="addname" class="col-form-label"
                        >Số tiền quyên góp:</label
                      >
                      <form:input
                        path="money"
                        cssClass="form-control"
                        type="number"
                        required="true"
                      ></form:input>

                      <form:input
                        path="user.id"
                        hidden="true"
                        value="${userId}"
                      ></form:input>
                      <form:input
                        path="donation.id"
                        hidden="true"
                        value="${donation.id}"
                      ></form:input>

                      <label for="addname" class="col-form-label"
                        >Lời nhắn:</label
                      >
                      <form:textarea
                        rows="10"
                        cols="3"
                        cssClass="form-control"
                        path="text"
                      ></form:textarea>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      class="btn btn-secondary"
                      data-dismiss="modal"
                      type="button"
                    >
                      Đóng
                    </button>
                    <button
                      class="btn btn-primary"
                      type="submit"
                      id="userDonationConfirm"
                    >
                      Quyên góp
                    </button>
                  </div>
                </div>
              </form:form>
            </div>
          </div>
        </div>
      </section>

      <footer></footer>
    </div>

    <script>
      var selected = document.getElementById("userDonationConfirm");
      selected.addEventListener("click", function () {
        alert("Ghi lại thành công, chờ xác nhận quyên góp");
      });
    </script>
  </body>
</html>
