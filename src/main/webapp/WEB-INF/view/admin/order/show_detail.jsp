<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chi tiết đơn hàng - Laptop Shop</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <style>
      .order-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 25px;
        overflow: hidden;
      }

      .order-card-header {
        background-color: #343a40;
        color: #fff;
        padding: 15px 20px;
        font-weight: 600;
        font-size: 18px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.125);
      }

      .order-card-body {
        padding: 20px;
      }

      .order-id {
        color: #6c757d;
        font-size: 14px;
        margin-left: 10px;
      }

      .info-table {
        width: 100%;
        margin-bottom: 0;
      }

      .info-table th {
        width: 30%;
        padding: 12px 15px;
        color: #495057;
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6;
        font-weight: 600;
      }

      .info-table td {
        padding: 12px 15px;
        border-bottom: 1px solid #dee2e6;
      }

      .status-badge {
        padding: 6px 12px;
        border-radius: 50px;
        font-size: 0.85rem;
        font-weight: 600;
        display: inline-block;
      }

      .status-pending {
        background-color: #fff3cd;
        color: #856404;
      }

      .status-delivering {
        background-color: #cce5ff;
        color: #004085;
      }

      .status-finish {
        background-color: #d4edda;
        color: #155724;
      }

      .product-table {
        width: 100%;
        border-collapse: collapse;
      }

      .product-table th {
        background-color: #f8f9fa;
        color: #495057;
        padding: 12px 15px;
        text-align: left;
        border-bottom: 2px solid #dee2e6;
        font-weight: 600;
      }

      .product-table td {
        padding: 12px 15px;
        border-bottom: 1px solid #dee2e6;
        vertical-align: middle;
      }

      .product-table tr:hover {
        background-color: #f8f9fa;
      }

      .product-name {
        font-weight: 600;
        color: #343a40;
      }

      .product-price {
        font-weight: 600;
        color: #495057;
      }

      .product-qty {
        background-color: #e9ecef;
        color: #495057;
        padding: 3px 10px;
        border-radius: 4px;
        font-weight: 600;
      }

      .btn-back {
        background-color: #6c757d;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        margin-right: 10px;
        text-decoration: none;
        transition: all 0.3s;
      }

      .btn-edit {
        background-color: #ffc107;
        color: #212529;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        text-decoration: none;
        transition: all 0.3s;
      }

      .btn-back:hover,
      .btn-edit:hover {
        opacity: 0.85;
      }

      .total-row {
        background-color: #f8f9fa;
        font-weight: 700;
      }

      .total-price {
        color: #dc3545;
        font-size: 1.1rem;
      }

      @media (max-width: 768px) {
        .info-table th {
          width: 40%;
        }
      }
    </style>
  </head>

  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="index.html">Laptop Shop</a>
      <!-- Sidebar Toggle-->
      <button
        class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
        id="sidebarToggle"
        href="#!"
      >
        <i class="fas fa-bars"></i>
      </button>
      <!-- Navbar Search-->
      <div class="d-flex align-items-center ms-auto me-3">
        <p class="text-light mb-0">Hi, ${currentUserLogin}</p>
      </div>
    </nav>
    <div id="layoutSidenav">
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <div class="sb-sidenav-menu-heading">Cơ bản</div>
              <a class="nav-link" href="/adminDash">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Dashboard
              </a>
              <a class="nav-link" href="/table/user">
                <div class="sb-nav-link-icon">
                  <i class="fa-solid fa-users"></i>
                </div>
                Quản lý người dùng
              </a>
              <a class="nav-link" href="/adminProduct">
                <div class="sb-nav-link-icon">
                  <i class="fa-brands fa-product-hunt"></i>
                </div>
                Quản lý sản phẩm
              </a>
              <a class="nav-link active" href="/adminOrder">
                <div class="sb-nav-link-icon">
                  <i class="fa-regular fa-newspaper"></i>
                </div>
                Quản lý đơn hàng
              </a>
            </div>
            <div class="nav">
              <div class="sb-sidenav-menu-heading">Khác</div>
              <a class="nav-link" href="/cmtCus">
                <div class="sb-nav-link-icon">
                  <i class="fa-solid fa-house-user"></i>
                </div>
                Phản hồi khách hàng
              </a>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <div class="small">Đăng nhập với:</div>
            Admin
          </div>
        </nav>
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Chi tiết đơn hàng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/adminDash">Dashboard</a>
              </li>
              <li class="breadcrumb-item">
                <a href="/adminOrder">Đơn hàng</a>
              </li>
              <li class="breadcrumb-item active">
                Chi tiết đơn hàng #${order.id}
              </li>
            </ol>

            <div class="row">
              <div class="col-xl-6">
                <div class="order-card">
                  <div class="order-card-header">
                    Thông tin đơn hàng
                    <span class="order-id">#${order.id}</span>
                  </div>
                  <div class="order-card-body">
                    <table class="info-table">
                      <tr>
                        <th>Mã đơn hàng</th>
                        <td>#${order.id}</td>
                      </tr>
                      <tr>
                        <th>Tổng giá trị</th>
                        <td class="fw-bold text-danger">
                          <fmt:formatNumber
                            type="number"
                            value="${order.totalPrice}"
                          />
                          VND
                        </td>
                      </tr>
                      <tr>
                        <th>Trạng thái</th>
                        <td>
                          <c:choose>
                            <c:when test="${order.status eq 'Pending'}">
                              <span class="status-badge status-pending"
                                >Đang chờ</span
                              >
                            </c:when>
                            <c:when test="${order.status eq 'Delivering'}">
                              <span class="status-badge status-delivering"
                                >Đang giao</span
                              >
                            </c:when>
                            <c:when test="${order.status eq 'Finish'}">
                              <span class="status-badge status-finish"
                                >Hoàn tất</span
                              >
                            </c:when>
                            <c:otherwise>
                              <span class="status-badge">${order.status}</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>

              <div class="col-xl-6">
                <div class="order-card">
                  <div class="order-card-header">Thông tin khách hàng</div>
                  <div class="order-card-body">
                    <table class="info-table">
                      <tr>
                        <th>Tên khách hàng</th>
                        <td>${order.receiverName}</td>
                      </tr>
                      <tr>
                        <th>Số điện thoại</th>
                        <td>${order.receiverPhone}</td>
                      </tr>
                      <tr>
                        <th>Địa chỉ giao hàng</th>
                        <td>${order.receiverAddress}</td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>

            <div class="order-card mt-4">
              <div class="order-card-header">Chi tiết sản phẩm</div>
              <div class="order-card-body">
                <div class="table-responsive">
                  <table class="product-table">
                    <thead>
                      <tr>
                        <th>Sản phẩm</th>
                        <th class="text-center">Số lượng</th>
                        <th class="text-end">Đơn giá</th>
                        <th class="text-end">Thành tiền</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${orderDetails}" var="orderDetail">
                        <tr>
                          <td>
                            <span class="product-name"
                              >${orderDetail.products.name}</span
                            >
                          </td>
                          <td class="text-center">
                            <span class="product-qty"
                              >${orderDetail.quantity}</span
                            >
                          </td>
                          <td class="text-end">
                            <fmt:formatNumber
                              type="number"
                              value="${orderDetail.price}"
                            />
                            VND
                          </td>
                          <td class="text-end product-price">
                            <fmt:formatNumber
                              type="number"
                              value="${orderDetail.price * orderDetail.quantity}"
                            />
                            VND
                          </td>
                        </tr>
                      </c:forEach>
                      <tr class="total-row">
                        <td colspan="3" class="text-end">Tổng thanh toán:</td>
                        <td class="text-end total-price">
                          <fmt:formatNumber
                            type="number"
                            value="${order.totalPrice}"
                          />
                          VND
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div class="mt-4 mb-5">
              <a href="/adminOrder" class="btn-back">
                <i class="fas fa-arrow-left me-2"></i> Quay lại
              </a>
              <a href="/admin/order/update/${order.id}" class="btn-edit">
                <i class="fas fa-edit me-2"></i> Cập nhật trạng thái
              </a>
            </div>
          </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">Copyright &copy; Laptop Shop 2024</div>
              <div>
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
