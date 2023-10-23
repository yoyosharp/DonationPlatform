<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
      <section
        class="section-hero overlay inner-page bg-image"
        id="home-section"
      >
        <div class="container">
          <div class="row">
            <div class="col-md-7">
              <h1 class="text-white font-weight-bold">
                Danh sách các đợt quyên góp
              </h1>
            </div>
          </div>
        </div>
      </section>
      <section class="site-section">
        <div class="container">
          <div class="row mb-5 justify-content-center">
            <div class="col-md-7 text-center">
              <h2 class="section-title mb-2">Các đợt quyên góp</h2>
            </div>
          </div>
          
          <div class="row mb-3 justify-content-between">
            <div class="row">
              Số kết quả hiển thị mỗi trang:  <span>
                <select id="pageSizeSelect" class="form-select" style="width: fit-content;">
                  <option value="" disabled selected>${display}</option>
                  <option value="5">5</option>
                  <option value="10">10</option>
                </select>
              </span>
            </div>
            <div class="row">
              Trạng thái quyên góp:  <span>
                <select id="donationStatusSelect" class="form-select">
                  <option value="" disabled selected>
                    <c:choose>
                      <c:when test="${status == 0}">Mới mở</c:when>
                      <c:when test="${status == 1}">Đang quyên góp</c:when>
                      <c:when test="${status == 2}">Dừng quyên góp</c:when>
                      <c:when test="${status == 3}">Đã đóng</c:when>
                      <c:otherwise>Tất cả</c:otherwise>
                    </c:choose>
                  </option>
                  <option value="10">Tất cả</option>
                  <option value="0">Mới mở</option>
                  <option value="1">Đang quyên góp</option>
                  <option value="2">Dừng quyên góp</option>
                  <option value="3">Đã đóng</option>
                </select>
              </span>  
            </div>
          </div>
                     
            <ul class="job-listings mb-5">
            <c:forEach var="donation" items="${donations}">
              <li
                class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"
                style="margin-bottom: 20px"
              >
                <div
                  class="job-listing-about d-sm-flex w-100 mx-4 row"
                >
                  <div
                    class="job-listing-position mb-3 mb-sm-0 col"
                    style="padding: 10px; flex-grow: 1.5;"
                  >
                    <div class="row">
                      <form action="detail">
                        <input type="hidden" name="donationId" value="${donation.id}">
                        <input type="hidden" name="userId" value="${userId}">
                        <c:choose>
                          <c:when test="${userId != null}">
                            <button type="submit" class="btn-light btn-lg mt-2"
                              style="border: none;
                              background: none;
                              padding: 0;
                              cursor: pointer;"
                            >${donation.name}</button>   
                          </c:when>
                          <c:otherwise>
                            <button type="submit" class="btn-light btn-lg mt-2"
                              style="border: none;
                              background: none;
                              padding: 0;
                              cursor: pointer;"
                              disabled
                            >${donation.name}</button>   
                          </c:otherwise>
                        </c:choose>
                                    
                      </form>
                    </div>
                    
                    <div class="row mt-4">
                      <c:choose>
                        <c:when test="${donation.status == 0}"
                          ><strong> Mới tạo </strong></c:when
                        >
                        <c:when test="${donation.status == 1}"
                          ><strong> Đang quyên góp</strong></c:when
                        >
                        <c:when test="${donation.status == 2}"
                          ><strong> Dừng quyên góp </strong></c:when
                        >
                        <c:when test="${donation.status == 3}"
                          ><strong> Đã đóng </strong></c:when
                        >
                      </c:choose>
                    </div>
                    
                  </div>
                  <div
                    class="job-listing-location mb-3 mb-sm-0 col ms-2"
                    style="padding: 10px"
                  >
                    Ngày bắt đầu<br /><strong>${donation.startDate}</strong
                    ><br />
                  </div>
                  <div
                    class="job-listing-location mb-3 mb-sm-0 col ms-2"
                    style="padding: 10px"
                  >
                    Ngày kết thúc<br /> <strong>${donation.endDate}</strong
                    ><br />
                  </div>
                  <div
                    class="job-listing-location mb-3 mb-sm-0 col ms-2"
                    style="padding: 10px"
                  >
                    <span class="icon-room"></span>
                    <span>${donation.organizationName}</span><br />
                    <strong>${donation.phoneNumber}</strong><br />
                  </div>
                  <div class="job-listing-meta col ms-2">
                    <c:if test="${userId != null}">
                                     
                        <!-- User Donate button -->
                        <c:if test="${donation.status == 1}">
                          <button                        
                            class="btn btn-primary py-2 mt-3"
                            data-toggle="modal"
                            data-target="#donateModal${donation.id}"
                          >
                            Quyên góp
                          </button>
                        </c:if>
                    </c:if>
                                  
                  </div>
                </div>
              </li>

              <!-- Modal -->
              <div
                class="modal fade"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
                id="donateModal${donation.id}"
              >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">
                        Quyên góp: <span></span>
                      </h5>
                      <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                      >
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form:form
                      action="userDonate"
                      modelAttribute="userDonation"
                      method="post"
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
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                          >
                            Đóng
                          </button>
                          <button
                            type="submit"
                            data-toggle="modal"
                            data-target="#exampleModal"
                            class="btn btn-primary userDonationConfirm"
                            
                          >
                            Quyên góp
                          </button>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </c:forEach>
            </ul>

            <div class="row pagination-wrap">
                <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
                  Hiển thị trang ${page} trong tổng số ${maxPageCount} trang
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <div class="custom-pagination ml-auto">
                      <c:if test="${page > 1}">
                        <a
                         class="prev"
                         href="${pageContext.request.contextPath}/public/home?userId=${userId}&display=${display}&page=${page - 1}&status=${status}">Prev</a>
                        <div class="d-inline-block">
                        </div>
                      </c:if>
                      
                      <c:if test="${maxPageCount > page}">
                        <a
                         class="next"
                         href="${pageContext.request.contextPath}/public/home?userId=${userId}&display=${display}&page=${page + 1}&status=${status}">Next</a>
                      </c:if>
                    </div>
                </div>
            </div>
          
          
        </div>
      </section>
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
      url.searchParams.set("page", 1);
      window.location.href = url.toString();   
  }); 

</script>

<script>
  var selected = document.getElementsByClassName("userDonationConfirm");
  for(var i = 0; i < selected.length; i++){
    selected[i].addEventListener("click", function () {
    alert("Ghi lại thành công, chờ xác nhận quyên góp");
  });
  }
  
</script>
  </body>
</html>
