<%@ page contentType="text/html; charset=UTF-8" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đặt hàng thành công</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: 'Montserrat', sans-serif;
        background-color: #f7f9fc;
        overflow: hidden;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }

      .success-container {
        text-align: center;
        z-index: 10;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 3rem;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: 0 auto;
      }

      .success-icon {
        font-size: 5rem;
        color: #4caf50;
        margin-bottom: 1.5rem;
        animation: bounceIn 1s;
      }

      h1 {
        color: #333;
        font-size: 2.5rem;
        margin-bottom: 1.5rem;
        font-weight: 700;
      }

      p {
        color: #666;
        margin-bottom: 2rem;
        font-size: 1.1rem;
        line-height: 1.6;
      }

      .action-button {
        display: inline-block;
        padding: 0.8rem 2rem;
        background-color: #2c3e50;
        color: white;
        text-decoration: none;
        border-radius: 30px;
        font-weight: 600;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        font-size: 1rem;
      }

      .action-button:hover {
        background-color: #1c2c3c;
        transform: translateY(-3px);
        box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
      }

      .action-button i {
        margin-right: 8px;
      }

      canvas {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 1;
      }

      @keyframes bounceIn {
        0% {
          transform: scale(0);
          opacity: 0;
        }
        60% {
          transform: scale(1.2);
          opacity: 1;
        }
        100% {
          transform: scale(1);
        }
      }
    </style>
  </head>

  <body>
    <div class="success-container">
      <div class="success-icon">
        <i class="fas fa-check-circle"></i>
      </div>
      <h1>Đặt Hàng Thành Công!</h1>
      <p>
        Cảm ơn bạn đã mua sắm tại Mixxshop. Chúng tôi đã nhận được đơn hàng của
        bạn và sẽ xử lý trong thời gian sớm nhất.
      </p>
      <a href="/" class="action-button">
        <i class="fas fa-home"></i>Tiếp Tục Mua Sắm
      </a>
    </div>

    <canvas id="canvas"></canvas>

    <script>
      let W = window.innerWidth;
      let H = window.innerHeight;
      const canvas = document.getElementById('canvas');
      const context = canvas.getContext('2d');
      const maxConfettis = 150;
      const particles = [];

      const possibleColors = [
        'DodgerBlue',
        'OliveDrab',
        'Gold',
        'Pink',
        'SlateBlue',
        'LightBlue',
        'Gold',
        'Violet',
        'PaleGreen',
        'SteelBlue',
        'SandyBrown',
        'Chocolate',
        'Crimson',
      ];

      function randomFromTo(from, to) {
        return Math.floor(Math.random() * (to - from + 1) + from);
      }

      function confettiParticle() {
        this.x = Math.random() * W; // x
        this.y = Math.random() * H - H; // y
        this.r = randomFromTo(11, 33); // radius
        this.d = Math.random() * maxConfettis + 11;
        this.color =
          possibleColors[Math.floor(Math.random() * possibleColors.length)];
        this.tilt = Math.floor(Math.random() * 33) - 11;
        this.tiltAngleIncremental = Math.random() * 0.07 + 0.05;
        this.tiltAngle = 0;

        this.draw = function () {
          context.beginPath();
          context.lineWidth = this.r / 2;
          context.strokeStyle = this.color;
          context.moveTo(this.x + this.tilt + this.r / 3, this.y);
          context.lineTo(this.x + this.tilt, this.y + this.tilt + this.r / 5);
          return context.stroke();
        };
      }

      function Draw() {
        const results = [];

        // Magical recursive functional love
        requestAnimationFrame(Draw);

        context.clearRect(0, 0, W, window.innerHeight);

        for (var i = 0; i < maxConfettis; i++) {
          results.push(particles[i].draw());
        }

        let particle = {};
        let remainingFlakes = 0;
        for (var i = 0; i < maxConfettis; i++) {
          particle = particles[i];

          particle.tiltAngle += particle.tiltAngleIncremental;
          particle.y += (Math.cos(particle.d) + 3 + particle.r / 2) / 2;
          particle.tilt = Math.sin(particle.tiltAngle - i / 3) * 15;

          if (particle.y <= H) remainingFlakes++;

          // If a confetti has fluttered out of view,
          // bring it back to above the viewport and let if re-fall.
          if (particle.x > W + 30 || particle.x < -30 || particle.y > H) {
            particle.x = Math.random() * W;
            particle.y = -30;
            particle.tilt = Math.floor(Math.random() * 10) - 20;
          }
        }

        return results;
      }

      window.addEventListener(
        'resize',
        function () {
          W = window.innerWidth;
          H = window.innerHeight;
          canvas.width = window.innerWidth;
          canvas.height = window.innerHeight;
        },
        false
      );

      // Push new confetti objects to `particles[]`
      for (var i = 0; i < maxConfettis; i++) {
        particles.push(new confettiParticle());
      }

      // Initialize
      canvas.width = W;
      canvas.height = H;
      Draw();
    </script>
  </body>
</html>
