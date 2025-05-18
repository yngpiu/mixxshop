<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cập nhật trạng thái đơn hàng - Laptop Shop</title>
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
      .status-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        max-width: 700px;
        margin: 0 auto;
      }

      .status-card-header {
        background-color: #343a40;
        color: #fff;
        padding: 20px;
        font-weight: 600;
        font-size: 18px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.125);
      }

      .status-card-body {
        padding: 30px;
      }

      .status-select {
        margin-bottom: 25px;
      }

      .status-select select {
        font-size: 1.1rem;
        padding: 12px;
        border-radius: 5px;
        border: 1px solid #ced4da;
        width: 100%;
      }

      .status-select select:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
      }

      .status-option {
        font-weight: 500;
      }

      .pending-option {
        color: #856404;
      }

      .delivering-option {
        color: #004085;
      }

      .finish-option {
        color: #155724;
      }

      .btn-update {
        background-color: #28a745;
        color: white;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: 500;
        width: 100%;
        transition: all 0.3s;
      }

      .btn-update:hover {
        background-color: #218838;
        transform: translateY(-2px);
      }

      .order-info {
        margin-bottom: 25px;
        border-bottom: 1px solid #e9ecef;
        padding-bottom: 20px;
      }

      .order-title {
        font-size: 1.2rem;
        color: #495057;
        margin-bottom: 15px;
        font-weight: 600;
      }

      .order-id {
        font-weight: 600;
        color: #007bff;
      }

      .status-note {
        background-color: #f8f9fa;
        border-left: 4px solid #ffc107;
        padding: 15px;
        margin-bottom: 25px;
        border-radius: 0 5px 5px 0;
      }

      .status-note-title {
        font-weight: 600;
        color: #495057;
        margin-bottom: 8px;
      }

      .status-note-content {
        color: #6c757d;
        font-size: 14px;
        margin-bottom: 0;
      }

      .btn-back {
        background-color: #6c757d;
        color: white;
        text-decoration: none;
        padding: 8px 15px;
        border-radius: 4px;
        font-size: 14px;
        transition: all 0.3s;
        display: inline-block;
        margin-top: 30px;
      }

      .btn-back:hover {
        background-color: #5a6268;
        color: white;
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
            <h1 class="mt-4">Cập nhật trạng thái đơn hàng</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item">
                <a href="/adminDash">Dashboard</a>
              </li>
              <li class="breadcrumb-item">
                <a href="/adminOrder">Đơn hàng</a>
              </li>
              <li class="breadcrumb-item active">Cập nhật trạng thái</li>
            </ol>

            <div class="status-card mb-5">
              <div class="status-card-header">
                <i class="fas fa-edit me-2"></i> Thay đổi trạng thái đơn hàng
              </div>
              <div class="status-card-body">
                <div class="order-info">
                  <h2 class="order-title">
                    Đơn hàng <span class="order-id">#${current.id}</span>
                  </h2>
                </div>

                <div class="status-note">
                  <h4 class="status-note-title">Lưu ý:</h4>
                  <p class="status-note-content">
                    Trạng thái đơn hàng sẽ được cập nhật ngay lập tức trong hệ
                    thống và khách hàng sẽ nhận được thông báo về việc thay đổi
                    này. Hãy đảm bảo bạn chọn trạng thái chính xác.
                  </p>
                </div>

                <form:form
                  action="/admin/order/update/finish"
                  method="post"
                  modelAttribute="current"
                >
                  <div style="display: none">
                    <form:input type="text" value="${current.id}" path="id" />
                  </div>

                  <div class="status-select">
                    <label for="status" class="form-label fw-bold mb-2"
                      >Chọn trạng thái mới:</label
                    >
                    <form:select class="form-select" id="status" path="status">
                      <form:option
                        value="Pending"
                        cssClass="status-option pending-option"
                        >Đang chờ xử lý (Pending)</form:option
                      >
                      <form:option
                        value="Delivering"
                        cssClass="status-option delivering-option"
                        >Đang giao hàng (Delivering)</form:option
                      >
                      <form:option
                        value="Finish"
                        cssClass="status-option finish-option"
                        >Hoàn tất (Finish)</form:option
                      >
                    </form:select>
                  </div>

                  <button type="submit" class="btn-update">
                    <i class="fas fa-sync-alt me-2"></i> Cập nhật trạng thái
                  </button>
                </form:form>

                <a href="/adminOrder" class="btn-back">
                  <i class="fas fa-arrow-left me-2"></i> Quay lại danh sách đơn
                  hàng
                </a>
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
