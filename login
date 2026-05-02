<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — KiloMeter</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --blue: #2563eb;
            --blue-dark: #1d4ed8;
            --blue-light: #eff6ff;
            --slate: #0f172a;
            --slate-mid: #334155;
            --slate-light: #94a3b8;
            --bg: #f1f5f9;
            --white: #ffffff;
            --border: #e2e8f0;
            --danger: #ef4444;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg);
            min-height: 100vh;
            display: flex;
            align-items: stretch;
        }

   
        .left-panel {
            width: 45%;
            background: var(--slate);
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 48px;
            overflow: hidden;
        }

        .left-panel::before {
            content: '';
            position: absolute;
            top: -120px; left: -120px;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(37,99,235,0.35) 0%, transparent 70%);
            pointer-events: none;
        }

        .left-panel::after {
            content: '';
            position: absolute;
            bottom: -80px; right: -80px;
            width: 300px; height: 300px;
            background: radial-gradient(circle, rgba(37,99,235,0.2) 0%, transparent 70%);
            pointer-events: none;
        }

        .panel-logo {
            font-family: 'Syne', sans-serif;
            font-size: 22px;
            font-weight: 800;
            color: #fff;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
            position: relative;
            z-index: 1;
        }

        .logo-dot {
            width: 8px; height: 8px;
            background: var(--blue);
            border-radius: 50%;
            display: inline-block;
        }

        .panel-content {
            position: relative;
            z-index: 1;
        }

        .panel-content h2 {
            font-family: 'Syne', sans-serif;
            font-size: 42px;
            font-weight: 800;
            color: #fff;
            line-height: 1.1;
            margin-bottom: 18px;
            letter-spacing: -1px;
        }

        .panel-content h2 span {
            color: var(--blue);
        }

        .panel-content p {
            font-size: 15px;
            color: #94a3b8;
            line-height: 1.7;
            max-width: 320px;
        }

        .stat-row {
            display: flex;
            gap: 32px;
            position: relative;
            z-index: 1;
        }

        .stat-item .num {
            font-family: 'Syne', sans-serif;
            font-size: 26px;
            font-weight: 700;
            color: #fff;
        }

        .stat-item .label {
            font-size: 12px;
            color: #64748b;
            margin-top: 2px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

      
        .right-panel {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 48px 60px;
            background: var(--bg);
        }

        .form-box {
            width: 100%;
            max-width: 400px;
        }

        .form-box h1 {
            font-family: 'Syne', sans-serif;
            font-size: 30px;
            font-weight: 800;
            color: var(--slate);
            letter-spacing: -0.8px;
            margin-bottom: 6px;
        }

        .form-box .subtitle {
            font-size: 14px;
            color: var(--slate-light);
            margin-bottom: 36px;
        }

        .form-box .subtitle a {
            color: var(--blue);
            text-decoration: none;
            font-weight: 500;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            color: var(--slate-mid);
            margin-bottom: 7px;
            letter-spacing: 0.1px;
        }

        .field input {
            width: 100%;
            padding: 12px 14px;
            background: var(--white);
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-family: 'DM Sans', sans-serif;
            font-size: 14px;
            color: var(--slate);
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .field input:focus {
            border-color: var(--blue);
            box-shadow: 0 0 0 3px rgba(37,99,235,0.1);
        }

        .field input::placeholder {
            color: #cbd5e1;
        }

        .forgot {
            display: block;
            text-align: right;
            font-size: 12px;
            color: var(--blue);
            text-decoration: none;
            margin-top: -10px;
            margin-bottom: 24px;
        }

        .btn-login {
            width: 100%;
            padding: 13px;
            background: var(--blue);
            color: #fff;
            border: none;
            border-radius: 10px;
            font-family: 'Syne', sans-serif;
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 0.2px;
            cursor: pointer;
            transition: background 0.2s, transform 0.1s;
        }

        .btn-login:hover { background: var(--blue-dark); }
        .btn-login:active { transform: scale(0.99); }

        .divider {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 24px 0;
        }

        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .divider span {
            font-size: 12px;
            color: var(--slate-light);
        }

        .error-msg {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: var(--danger);
            font-size: 13px;
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: none;
        }

        .success-msg {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #16a34a;
            font-size: 13px;
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 16px;
            display: none;
        }

        @media (max-width: 768px) {
            .left-panel { display: none; }
            .right-panel { padding: 40px 24px; }
        }
    </style>
</head>
<body>

<div class="left-panel">
    <div class="panel-logo">
        <span class="logo-dot"></span> KiloMeter
    </div>
    <div class="panel-content">
        <h2>Track Every<br><span>KiloMeter</span><br>You Run.</h2>
        <p>Monitor your fitness journey, calculate BMI, and hit your health goals — all in one place.</p>
    </div>
    <div class="stat-row">
        <div class="stat-item">
            <div class="num">50K+</div>
            <div class="label">Active Users</div>
        </div>
        <div class="stat-item">
            <div class="num">1M+</div>
            <div class="label">KMs Tracked</div>
        </div>
        <div class="stat-item">
            <div class="num">4.9★</div>
            <div class="label">App Rating</div>
        </div>
    </div>
</div>

<div class="right-panel">
    <div class="form-box">
        <h1>Welcome back</h1>
        <p class="subtitle">Don't have an account? <a href="signup.html">Sign up free →</a></p>

        <div class="error-msg" id="errorMsg"></div>
        <div class="success-msg" id="successMsg"></div>

        <div class="field">
            <label for="username">Username</label>
            <input type="text" id="username" placeholder="Enter your username">
        </div>

        <div class="field">
            <label for="password">Password</label>
            <input type="password" id="password" placeholder="Enter your password">
        </div>

        <a href="#" class="forgot">Forgot password?</a>

        <button class="btn-login" onclick="login()">Log In</button>

        <div class="divider"><span>or</span></div>

        <p style="text-align:center; font-size:13px; color: #94a3b8;">
            New here? <a href="signup.html" style="color: var(--blue); text-decoration:none; font-weight:500;">Create a free account</a>
        </p>
    </div>
</div>

<script>
function login() {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;
    const errEl = document.getElementById('errorMsg');
    const sucEl = document.getElementById('successMsg');

    errEl.style.display = 'none';
    sucEl.style.display = 'none';

    if (!username || !password) {
        errEl.textContent = 'Please fill in all fields.';
        errEl.style.display = 'block';
        return;
    }

   
    const storedUser = localStorage.getItem('user');
    const storedPass = localStorage.getItem('pass');
    if (username === storedUser && password === storedPass) {
        sucEl.textContent = 'Login successful! Redirecting...';
        sucEl.style.display = 'block';
        setTimeout(() => window.location.href = 'index.html', 1000);
    } else {
        errEl.textContent = 'Invalid username or password.';
        errEl.style.display = 'block';
    }
}

document.addEventListener('keydown', e => {
    if (e.key === 'Enter') login();
});
</script>
</body>
</html>

