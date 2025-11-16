<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Masuri Doan</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body class="login-page-body">
    <!-- Background Image with Blur -->
    <div class="login-background">
        <img
            src="${pageContext.request.contextPath}/assets/img/sushi-background.jpg"
            alt="Chef background"
            class="login-background-image"
        />
        <div class="login-background-overlay"></div>
    </div>

    <!-- Login Form Container -->
    <div class="login-container">
        <div class="login-card">
            <!-- Title -->
            <h1 class="login-title font-serif">Masuri Doan</h1>
            <p class="login-subtitle">Login to continue</p>

            <!-- Login Form -->
            <form action="${pageContext.request.contextPath}/login" method="POST" class="login-form">
                <!-- Email Field -->
                <div class="login-input-group">
                    <label for="email" class="login-label">EMAIL ADDRESS</label>
                    <div class="login-input-wrapper">
                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="you@example.com"
                            class="login-input"
                            required
                        />
                        <svg class="login-input-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                            <polyline points="22,6 12,13 2,6"></polyline>
                        </svg>
                    </div>
                </div>

                <!-- Password Field -->
                <div class="login-input-group">
                    <label for="password" class="login-label">PASSWORD</label>
                    <div class="login-input-wrapper">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="login-input"
                            required
                        />
                        <button
                            type="button"
                            class="login-password-toggle"
                            onclick="togglePasswordVisibility()"
                            aria-label="Toggle password visibility"
                        >
                            <svg id="eye-icon" class="login-input-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                <circle cx="12" cy="12" r="3"></circle>
                            </svg>
                            <svg id="eye-off-icon" class="login-input-icon hidden" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                <line x1="1" y1="1" x2="23" y2="23"></line>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Login Button -->
                <button type="submit" class="login-button">
                    LOGIN
                </button>
            </form>

            <!-- Forgot Password Link -->
            <a href="#" class="login-forgot-link">Forgot password?</a>
        </div>
    </div>

    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('password');
            const eyeIcon = document.getElementById('eye-icon');
            const eyeOffIcon = document.getElementById('eye-off-icon');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.classList.add('hidden');
                eyeOffIcon.classList.remove('hidden');
            } else {
                passwordInput.type = 'password';
                eyeIcon.classList.remove('hidden');
                eyeOffIcon.classList.add('hidden');
            }
        }
    </script>
</body>
</html>

