<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <title>Đăng nhập | Mixxshop</title>
    <style>
      :root {
        --primary-color: #4361ee;
        --secondary-color: #3f37c9;
        --accent-color: #4895ef;
        --bg-color: #f8f9fa;
        --text-color: #212529;
        --light-text: #6c757d;
        --error-color: #e63946;
        --success-color: #2a9d8f;
      }

      body {
        background-color: var(--bg-color);
        font-family: 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
      }

      .login-container {
        width: 100%;
        max-width: 1000px;
        background-color: #fff;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        display: flex;
        min-height: 600px;
      }

      .login-image {
        flex: 1;
        background-image: linear-gradient(
            rgba(67, 97, 238, 0.7),
            rgba(63, 55, 201, 0.7)
          ),
          url('https://images.unsplash.com/photo-1593642702909-dec73df255d7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
        background-size: cover;
        background-position: center;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: 40px;
        color: white;
        position: relative;
      }

      .login-image-content {
        z-index: 1;
      }

      .login-image h2 {
        font-size: 2.2rem;
        font-weight: 700;
        margin-bottom: 15px;
      }

      .login-image p {
        font-size: 1.1rem;
        line-height: 1.7;
        margin-bottom: 20px;
        opacity: 0.9;
      }

      .login-form {
        flex: 1;
        padding: 50px 40px;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      .login-form h1 {
        font-weight: 700;
        color: var(--text-color);
        margin-bottom: 10px;
        font-size: 2rem;
      }

      .login-subtitle {
        color: var(--light-text);
        margin-bottom: 30px;
        font-size: 1rem;
      }

      .form-floating {
        margin-bottom: 20px;
        position: relative;
      }

      .form-floating input {
        height: 55px;
        border-radius: 10px;
        border: 1px solid #ced4da;
        padding: 15px 15px 0;
        font-size: 1rem;
      }

      .form-floating input:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25);
      }

      .form-floating label {
        padding: 15px;
      }

      .remember-forgot {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        font-size: 0.95rem;
      }

      .remember-me {
        display: flex;
        align-items: center;
      }

      .remember-me input {
        margin-right: 8px;
      }

      .btn-primary {
        background-color: var(--primary-color);
        border: none;
        border-radius: 10px;
        padding: 12px;
        height: 50px;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        margin-bottom: 20px;
      }

      .btn-primary:hover {
        background-color: var(--secondary-color);
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
      }

      .register-link {
        text-align: center;
        margin-top: 15px;
        color: var(--light-text);
      }

      .register-link a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
      }

      .error-message {
        color: var(--error-color);
        font-size: 0.9rem;
        padding: 8px 12px;
        border-radius: 8px;
        margin-bottom: 20px;
        background-color: rgba(230, 57, 70, 0.1);
        display: flex;
        align-items: center;
      }

      .error-message i {
        margin-right: 10px;
      }

      .success-message {
        color: var(--success-color);
        font-size: 0.9rem;
        padding: 8px 12px;
        border-radius: 8px;
        margin-bottom: 20px;
        background-color: rgba(42, 157, 143, 0.1);
        display: flex;
        align-items: center;
      }

      .success-message i {
        margin-right: 10px;
      }

      @media (max-width: 768px) {
        .login-container {
          flex-direction: column;
        }

        .login-image {
          display: none;
        }

        .login-form {
          padding: 30px 20px;
        }
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <div class="login-image">
        <div class="login-image-content">
          <h2>Chào mừng bạn đến với Mixxshop</h2>
          <p>
            Nơi cung cấp những mẫu laptop chất lượng với giá tốt nhất thị
            trường. Đăng nhập để khám phá ngay!
          </p>
          <p>
            Chúng tôi cam kết mang đến cho bạn trải nghiệm mua sắm tuyệt vời
            nhất.
          </p>
        </div>
      </div>
      <div class="login-form">
        <h1>Đăng nhập</h1>
        <p class="login-subtitle">Vui lòng đăng nhập để tiếp tục mua sắm</p>
        <form:form action="/login" method="post">
          <c:if test="${param.error != null}">
            <div class="error-message">
              <i class="fas fa-exclamation-circle"></i>
              Email hoặc mật khẩu không chính xác.
            </div>
          </c:if>
          <c:if test="${param.logout != null}">
            <div class="success-message">
              <i class="fas fa-check-circle"></i>
              Đăng xuất thành công.
            </div>
          </c:if>

          <div class="form-floating">
            <input
              type="email"
              class="form-control"
              id="email"
              name="username"
              placeholder="name@example.com"
              required
            />
            <label for="email">Email</label>
          </div>

          <div class="form-floating">
            <input
              type="password"
              class="form-control"
              id="password"
              name="password"
              placeholder="Mật khẩu"
              required
            />
            <label for="password">Mật khẩu</label>
          </div>

          <div class="remember-forgot">
            <div class="remember-me">
              <input type="checkbox" id="remember" name="remember-me" />
              <label for="remember">Ghi nhớ đăng nhập</label>
            </div>
            <a href="#" class="forgot-password">Quên mật khẩu?</a>
          </div>

          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />
          <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
        </form:form>
        <div class="register-link">
          Chưa có tài khoản? <a href="/register">Đăng ký ngay</a>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
