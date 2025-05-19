<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>

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
    <title>Phản hồi khách hàng - Mixxshop</title>
    <link
      href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
      rel="stylesheet"
    />
    <link href="/css/styles.css" rel="stylesheet" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <style>
      .table-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        margin-bottom: 2rem;
      }

      .feedback-table {
        width: 100%;
        border-collapse: collapse;
      }

      .feedback-table th {
        background-color: #f8f9fa;
        color: #495057;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.85rem;
        padding: 15px;
        text-align: left;
        border-bottom: 2px solid #dee2e6;
      }

      .feedback-table td {
        padding: 15px;
        vertical-align: middle;
        border-bottom: 1px solid #e9ecef;
      }

      .feedback-table tr:hover {
        background-color: #f8f9fa;
      }

      .customer-id {
        font-weight: 600;
        color: #495057;
      }

      .customer-name {
        color: #007bff;
        font-weight: 500;
      }

      .product-name {
        color: #6c757d;
        font-style: italic;
      }

      .feedback-content {
        max-width: 400px;
        line-height: 1.5;
      }

      .page-header {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        padding: 20px;
        margin-bottom: 20px;
      }

      .page-header h1 {
        color: #343a40;
        font-weight: 600;
        margin-bottom: 5px;
      }

      .feedback-count {
        font-weight: normal;
        color: #6c757d;
        font-size: 1rem;
      }

      .pagination {
        margin-top: 20px;
      }

      .pagination .page-link {
        color: #3cb815;
        border-radius: 4px;
        margin: 0 3px;
      }

      .pagination .page-item.active .page-link {
        background-color: #3cb815;
        border-color: #3cb815;
        color: white;
      }

      .pagination .page-link:hover:not(.active) {
        background-color: #e9ecef;
      }

      .pagination .page-item.disabled .page-link {
        color: #6c757d;
      }

      @media (max-width: 992px) {
        .feedback-content {
          max-width: 300px;
        }
      }

      @media (max-width: 768px) {
        .feedback-table {
          display: block;
          overflow-x: auto;
        }

        .feedback-content {
          max-width: 200px;
        }
      }
    </style>
  </head>

  <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
      <!-- Navbar Brand-->
      <a class="navbar-brand ps-3" href="/">Mixxshop</a>
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
              <a class="nav-link" href="/adminOrder">
                <div class="sb-nav-link-icon">
                  <i class="fa-regular fa-newspaper"></i>
                </div>
                Quản lý đơn hàng
              </a>
            </div>
            <div class="nav">
              <div class="sb-sidenav-menu-heading">Khác</div>
              <a class="nav-link active" href="/cmtCus">
                <div class="sb-nav-link-icon">
                  <i class="fa-solid fa-house-user"></i>
                </div>
                Phản hồi khách hàng
              </a>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            ${currentUserLogin}
          </div>
        </nav>
      </div>
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <div class="page-header">
              <h1>Phản hồi khách hàng</h1>
              <p class="feedback-count">Tổng số phản hồi: ${feeds.size()}</p>
            </div>

            <div class="table-container">
              <table class="feedback-table">
                <thead>
                  <tr>
                    <th>ID khách hàng</th>
                    <th>Tên khách hàng</th>
                    <th>Sản phẩm đã mua</th>
                    <th>Nội dung phản hồi</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="feed" items="${feeds}">
                    <tr>
                      <td class="customer-id">${feed.user.id}</td>
                      <td class="customer-name">${feed.user.fullname}</td>
                      <td class="product-name">${feed.product.name}</td>
                      <td class="feedback-content">${feed.content}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                  <li class="page-item">
                    <a class="page-link" href="/cmtCus?page=${currentPage-1}"
                      >Trước</a
                    >
                  </li>
                </c:if>

                <c:forEach begin="1" end="${totalPage}" var="i">
                  <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="/cmtCus?page=${i}">${i}</a>
                  </li>
                </c:forEach>

                <c:if test="${currentPage < totalPage}">
                  <li class="page-item">
                    <a class="page-link" href="/cmtCus?page=${currentPage+1}"
                      >Sau</a
                    >
                  </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </main>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
