<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xóa đơn hàng - Laptop Shop</title>
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
      .delete-container {
        max-width: 800px;
        margin: 0 auto;
      }

      .delete-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        margin-bottom: 2rem;
      }

      .delete-card-header {
        background-color: #dc3545;
        color: #fff;
        padding: 20px;
        font-weight: 600;
        font-size: 18px;
        text-align: center;
      }

      .delete-card-body {
        padding: 30px;
      }

      .center-icon {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .delete-warning {
        font-size: 1.05rem;
        margin-bottom: 30px;
        color: #495057;
        line-height: 1.6;
      }

      .order-info {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 30px;
      }

      .info-label {
        font-weight: 600;
        color: #495057;
        font-size: 15px;
        margin-bottom: 5px;
      }

      .info-value {
        color: #dc3545;
        font-weight: 700;
        font-size: 18px;
      }

      .btn-actions {
        display: flex;
        gap: 15px;
      }

      .btn-confirm {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 5px;
        font-weight: 600;
        transition: all 0.3s;
        flex: 1;
      }

      .btn-confirm:hover {
        background-color: #c82333;
      }

      .btn-cancel {
        background-color: #6c757d;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 5px;
        font-weight: 600;
        text-decoration: none;
        text-align: center;
        transition: all 0.3s;
        flex: 1;
      }

      .btn-cancel:hover {
        background-color: #5a6268;
        color: white;
      }

      .icon-warning {
        font-size: 60px;
        color: #dc3545;
        margin-bottom: 30px;
        text-align: center;
        display: block;
      }

      .delete-title {
        text-align: center;
        font-weight: 700;
        margin-bottom: 20px;
        color: #343a40;
      }

      @media (max-width: 768px) {
        .btn-actions {
          flex-direction: column;
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
            <h1 class="mt-4">Xóa đơn hàng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/adminDash">Dashboard</a>
              </li>
              <li class="breadcrumb-item">
                <a href="/adminOrder">Đơn hàng</a>
              </li>
              <li class="breadcrumb-item active">Xóa đơn hàng</li>
            </ol>

            <div class="delete-container">
              <div class="delete-card">
                <div class="delete-card-header">
                  <i class="fas fa-exclamation-triangle me-2"></i> Xác nhận xóa
                  đơn hàng
                </div>
                <div class="delete-card-body">
                  <div class="center-icon">
                    <i
                      class="fas fa-exclamation-circle icon-warning d-block"
                    ></i>
                  </div>
                  <h3 class="delete-title">
                    Bạn chắc chắn muốn xóa đơn hàng này?
                  </h3>

                  <div class="delete-warning">
                    <strong>Lưu ý:</strong> Thao tác này không thể hoàn tác và
                    tất cả thông tin liên quan đến đơn hàng sẽ bị xóa vĩnh viễn
                    khỏi hệ thống.
                  </div>

                  <div class="order-info">
                    <div class="row mb-3">
                      <div class="col-md-6">
                        <p class="info-label">Mã đơn hàng:</p>
                        <p class="info-value">#${delO.id}</p>
                      </div>
                      <div class="col-md-6">
                        <p class="info-label">Khách hàng:</p>
                        <p class="info-value">${delO.receiverName}</p>
                      </div>
                    </div>
                  </div>

                  <form:form
                    action="/admin/order/del/finish"
                    method="post"
                    modelAttribute="delOrder"
                  >
                    <form:input
                      type="text"
                      value="${delO.id}"
                      path="id"
                      style="display: none"
                    />

                    <div class="btn-actions">
                      <a href="/adminOrder" class="btn-cancel">
                        <i class="fas fa-times me-2"></i> Hủy bỏ
                      </a>
                      <button type="submit" class="btn-confirm">
                        <i class="fas fa-trash-alt me-2"></i> Xác nhận xóa
                      </button>
                    </div>
                  </form:form>
                </div>
              </div>
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
