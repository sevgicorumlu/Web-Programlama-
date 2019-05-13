<%@ page language="java" contentType="text/html;  charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,900&amp;subset=latin-ext" rel="stylesheet">
    <title>Giriş yap</title>
    <!-- Bootstrap core CSS -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="admin/css/login.css" rel="stylesheet">
</head>

<body class="b-login text-center">
<form class="form-signin" action="AdminLogin" method="POST">
    
    <img class="mb-4" src="admin/img/login/logo.png"  width="270">
    <label for="inputEmail" class="sr-only">E-posta adresiniz</label>
    <input type="email" name="adminMail" id=adminMail class="form-control" placeholder="E-posta adresiniz" required autofocus>
    <label for="inputPassword" class="sr-only">Parolanız</label>
    <input type="password" name="adminSifre" id="adminSifre" class="form-control" placeholder="Parolanız" required>
    <div class="checkbox mb-3">
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Giriş yap</button>
    <p class="mt-5 mb-3 login-copyright">&copy; Töz&Çorumlu&Gül 2018</p>
</form>
</body>
<script src="admin/js/jquery-3.3.0.min.js"></script>
<script src="admin/js/jquery.backstretch.min.js"></script>
<script>
    $(document).ready(function () {
        $.backstretch([
            "admin/img/login/5.jpg"
        ], {duration: 3000, fade: 750});
    })
</script>
</html>
