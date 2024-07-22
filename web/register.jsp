<%-- 
    Document   : register
    Created on : 21 Aug 2022, 3:19:46 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <meta charset="utf-8">
        <title>Sign Up VOHBS Now!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style> 
            @font-face {
                font-family: "Muli-Regular";
                src: url("../fonts/muli/Muli-Regular.ttf"); }
            @font-face {
                font-family: "Muli-SemiBold";
                src: url("../fonts/muli/Muli-SemiBold.ttf"); }
            * {
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box; }

            body {
                font-family: "Muli-Regular";
                font-size: 14px;
                margin: 0;
                color: #999; }

            input, textarea, select, button {
                font-family: "Muli-Regular"; }

            p, h1, h2, h3, h4, h5, h6, ul {
                margin: 0; }

            img {
                max-width: 100%; }

            ul {
                padding-left: 0;
                margin-bottom: 0; }

            a {
                text-decoration: none; }

            :focus {
                outline: none; }

            .wrapper {
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #4682B4; }

            .inner {
                position: relative;
                width: 435px; }

            .image-1 {
                position: absolute;
                bottom: -12px;
                left: -191px;
                z-index: 99; }

            .image-2 {
                position: absolute;
                bottom: 0;
                right: -129px; }

            form {
                width: 100%;
                position: relative;
                z-index: 9;
                padding: 77px 61px 66px;
                background: #fff;
                box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
                -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
                -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
                -ms-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
                -o-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2); }

            h3 {
                text-transform: uppercase;
                font-size: 25px;
                font-family: "Muli-SemiBold";
                color: #333;
                letter-spacing: 3px;
                text-align: center;
                margin-bottom: 33px; }

            .form-holder {
                position: relative;
                margin-bottom: 21px; }
            .form-holder span {
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                font-size: 15px;
                color: #333; }
            .form-holder span.lnr-lock {
                left: 2px; }

            .form-holder span i.bi-key-fill {
                position: relative;
                top: -20px; /* Adjust this value to align the key emoji with the input */
            }


            .form-control {
                border: none;
                border-bottom: 1px solid #e6e6e6;
                display: block;
                width: 100%;
                height: 38px;
                background: none;
                padding: 3px 42px 0px;
                color: #666;
                font-family: "Muli-SemiBold";
                font-size: 16px; }
            .form-control::-webkit-input-placeholder {
                font-size: 14px;
                font-family: "Muli-Regular";
                color: #999;
                transform: translateY(1px); }
            .form-control::-moz-placeholder {
                font-size: 14px;
                font-family: "Muli-Regular";
                color: #999;
                transform: translateY(1px); }
            .form-control:-ms-input-placeholder {
                font-size: 14px;
                font-family: "Muli-Regular";
                color: #999;
                transform: translateY(1px); }
            .form-control:-moz-placeholder {
                font-size: 14px;
                font-family: "Muli-Regular";
                color: #999;
                transform: translateY(1px); }
            .form-control:focus {
                border-bottom: 1px solid #accffe; }

            button {
                border: none;
                width: 100%;
                height: 49px;
                margin-top: 50px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0;
                background: #00008B;
                color: #fff;
                text-transform: uppercase;
                font-family: "Muli-SemiBold";
                font-size: 15px;
                letter-spacing: 2px;
                transition: all 0.5s;
                position: relative;
                overflow: hidden; }
            button span {
                position: relative;
                z-index: 2; }
            button:before, button:after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 1;
                background-color: rgba(52, 152, 253, 0.25);
                -webkit-transition: all 0.3s;
                -moz-transition: all 0.3s;
                -o-transition: all 0.3s;
                transition: all 0.3s;
                -webkit-transform: translate(-100%, 0);
                transform: translate(-100%, 0);
                -webkit-transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1);
                transition-timing-function: cubic-bezier(0.75, 0, 0.125, 1); }
            button:after {
                -webkit-transition-delay: 0.2s;
                transition-delay: 0.2s; }
            button:hover:before, button:hover:after {
                -webkit-transform: translate(0, 0);
                transform: translate(0, 0); }

            .checkbox-label {
                display: flex;
                align-items: center;
            }

            .checkbox-label input {
                margin-right: 25px; /* Adjust this value to your preference */
            }

            @media (max-width: 991px) {
                .inner {
                    width: 400px;
                    left: 4%; } }
            @media (max-width: 767px) {
                .inner {
                    width: 100%;
                    left: 0; }

                .image-1, .image-2 {
                    display: none; }

                form {
                    padding: 35px;
                    box-shadow: none;
                    -webkit-box-shadow: none;
                    -moz-box-shadow: none;
                    -ms-box-shadow: none;
                    -o-box-shadow: none; }

                .wrapper {
                    background: none; } }

            /*# sourceMappingURL=style.css.map */
        </style>
    <body>
        <div class="wrapper">
            <div class="inner">
                <img src="images/image-1.png" alt="" class="image-1">
                <script>
                    function togglePasswordVisibility() {
                        var passwordInput = document.getElementById('user_password');
                        var showPasswordCheckbox = document.getElementById('showPassword');

                        if (showPasswordCheckbox.checked) {
                            passwordInput.type = 'text';
                        } else {
                            passwordInput.type = 'password';
                        }
                    }

                    function validateForm() {
                        var fullname = document.getElementById('fullname').value;
                        var phone = document.getElementById('user_phone').value;
                        var email = document.getElementById('user_email').value;
                        var password = document.getElementById('user_password').value;

                        if (fullname === '' || phone === '' || email === '' || password === '') {
                            alert('Please fill in all the required fields.');
                            return false;
                        }

                        // Check password against the pattern
                        var hasLowerCase = /[a-z]/.test(password);
                        var hasUpperCase = /[A-Z]/.test(password);
                        var hasDigit = /\d/.test(password);
                        var hasSpecialChar = /[@$!%*?&]/.test(password);

                        var errorMessage = 'Password must meet the following criteria:\n';

                        if (!hasLowerCase) {
                            errorMessage += '- At least one lowercase letter\n';
                        }

                        if (!hasUpperCase) {
                            errorMessage += '- At least one uppercase letter\n';
                        }

                        if (!hasDigit) {
                            errorMessage += '- At least one digit\n';
                        }

                        if (!hasSpecialChar) {
                            errorMessage += '- At least one special character (@$!%*?&)\n';
                        }

                        if (password.length < 8) {
                            errorMessage += '- Minimum length of 8 characters\n';
                        }

                        if (!(hasLowerCase && hasUpperCase && hasDigit && hasSpecialChar && password.length >= 8)) {
                            alert(errorMessage);
                            return false;
                        }

                        return true;
                    }
                </script>

                <form class="needs-validation" novalidate action="register-process.jsp" method="post" onsubmit="return validateForm();">
                    <h3>Register New Account</h3>
                    <div class="form-holder">
                        <span><i class="bi bi-person-circle"></i></span>
                        <input type="text" name="fullname" id="fullname" class="form-control" placeholder="Full Name" required>
                    </div>
                    <div class="form-holder">
                        <span><i class="bi bi-telephone-fill"></i></span>
                        <input type="text" name="user_phone" id="user_phone" class="form-control" placeholder="Phone Number" required>
                    </div>
                    <div class="form-holder">
                        <span><i class="bi bi-envelope-fill"></i></span>
                        <input type="email" name="user_email" id="user_email" class="form-control" placeholder="Email" required>
                    </div>
                    <div class="form-holder">
                        <span><i class="bi bi-key-fill"></i></span>
                        <input type="password" name="user_password" id="user_password" class="form-control" 
                               placeholder="Password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
                               title="Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, one digit, and one special character"
                               required>
                        <br>
                        <label class="checkbox-label" for="showPassword">
                            <input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()"> Show Password
                        </label>
                    </div>

                    <button>
                        <input type="submit" class="text-white ml-auto btn hvr-hover" value="Register">
                    </button>
                    <a href="login.jsp">Already have account</a>
                </form>

                <img src="images/image-2.png" alt="" class="image-2">
            </div>
        </div>
    </form>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
                                window.dataLayer = window.dataLayer || [];
                                function gtag() {
                                    dataLayer.push(arguments);
                                }
                                gtag('js', new Date());
                                gtag('config', 'UA-23581568-13');</script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"73e1a37e1d4446a3","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.8.0","si":100}' crossorigin="anonymous"></script>
</body>
</html>