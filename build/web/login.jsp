<%-- 
    Document   : login
    Created on : 21 Aug 2022, 2:21:16 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta name="theme-color" content="#7952b3">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            html,
            body {
                height: 100%;
            }

            body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #B0E0E6;
            }

            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: auto;
            }

            .form-signin .checkbox {
                font-weight: 400;
            }

            .form-signin .form-floating:focus-within {
                z-index: 2;
            }

            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }
        </style>


        <!-- Custom styles for this template -->

    </head>
    <body class="text-center">

        <main class="form-signin">

            <form action="login-process.jsp" method="POST">


                <img class="mb-4" src="img/logovoh.jpeg" alt="logovoh" width="122" >
                <h1 class="h3 mb-3 fw-normal">Log In</h1>


                <div class="form-floating">
                    <input type="email" class="form-control" name="user_email" id="user_email" placeholder="name@example.com">
                    <label for="user_email">Email</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name="user_password" id="user_password" placeholder="Password">
                    <label for="password">Password</label>
                    <input type="checkbox" onclick="showPassword()"> Show Password
                </div>


                <div class="checkbox mb-3"> 
                    <label> Don't have an account?
                        <a href ="register.jsp" > Sign Up Now! </a>
                    </label>

                </div>

                <button  class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
                <p class="mt-5 mb-3 text-muted">&copy; Iman 2023</p>
            </form>
            <script>
                function showPassword() {
                    var passwordInput = document.getElementById("user_password");

                    if (passwordInput.type === "password") {
                        passwordInput.type = "text";
                    } else {
                        passwordInput.type = "password";
                    }
                }
            </script>
        </main>



    </body>
</html>