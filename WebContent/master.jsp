<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%ArrayList<Category> kategoriler = new ArrayList<Category>(CategoryDao.allCategory());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<title>Töz&Çorumlu&Gül</title>
    <meta charset="UTF-8">
    
    <%@ include file="header.jsp"%>
    <style>
        .modalarda-preloader {
            display: flex;
            width: 100%;
            height: 100vh;
            position: fixed;
            background-color: white;
            z-index: 999;
            overflow: hidden;
            justify-content: center;
            align-items: center
        }

        .modalarda-preloader {
            margin: auto;
            align-self: center
        }
    </style>
    <!--Preloader CSS tanımlaması. Her zaman üstte olmalıdır.-->
</head>
<body>
<!--Preloader-->
<div class="modalarda-preloader">
    <div class="preloader-inner">
        <img src="themes/modalarda/img/header/logo.png" alt="Töz&Corumlu&Gül" class="pulse" width="202" height="58">
    </div>
</div>
<!--Preloader Bitti-->

<div class="floating-cart">
    <div class="cart-title font-weight-bold">Alışveriş Sepetiniz <i title="Kapat" class="fas fa-times"></i></div>
    <div class="cart-product-list">
     
           
    </div>
   
</div>
<!--Sepetim Bitti-->
<!--Overlay-->
<div class="common-overlay"></div>
<!--Overlay Bitti-->
<!--Top Bar-->
<section class="top-bar d-none d-lg-block d-sm-none">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="tb-menu">
                    <li class="discount-item"><a href="#"><img src="themes/modalarda/img/icons/header/indirim.svg" class="icon-16">
                            İndirim Reyonu</a></li>
                    <li><a href="iletisim.jsp">İletişim</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>
<!--Top Bar Bitti-->
<!--Header-->
<header class="middle-header">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-7 logo-area">
                <a class="mm-toggle"><i class="fas fa-bars fa-2x d-sm-block d-lg-none"></i> </a>
                <a href="master.jsp" title="Modalarda"> <img class="modalarda-logo" src="themes/modalarda/img/header/logo.png"
                                                             width="202" height="58" alt="Modalarda" title="Modalarda"></a>
            </div>
            <div class="col-md-5 col-12 search-area">
               
            </div>
            <div class="col-md-4 col-5 link-area">
                <ul class="header-user-links">
                    <li class="d-lg-none d-sm-block"><a href="#"><img src="themes/modalarda/img/icons/header/heart.svg"
                                                                      class="icon-32 mr-1"></a></li>
                  <%if(session.getAttribute("musteri") == null ){ %>
	                            <li><a href="signin.jsp"><img src="themes/modalarda/img/icons/header/profil.svg" class="icon-32 mr-1"> <span class="hul-span"> Üye Girişi</span>
                        </a></li>
				<%}
				if(session.getAttribute("musteri") != null ){ %>
				  <li><a href="UserLogout" class="fas fa-sign-out-alt"> <span class="hul-span"> Çıkış Yap</span>
                        </a></li>
                        <li>
                    <a href="master3.jsp"><img src="themes/modalarda/img/icons/header/sepet.svg" class="icon-32 mr-1"><span >Sepetim</span></a></li>
                    </li></ul>
				 
				<%} %>
                   
                     
            </div>
        </div>
    </div>
</header>
<!--Header Bitti-->
<!--Menü-->
<section class="main-menu d-none d-sm-none d-lg-flex">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-md yamm p-0">
                    <div id="navbar-collapse-grid" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav mr-0">
                         
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</section>
<!--Menü Bitti-->
<section class="main-menu d-none d-sm-none d-lg-flex" style="top: 96px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-expand-md yamm p-0">
                    <div id="navbar-collapse-grid" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav mr-0">
                         <%for(int i = 0; i < kategoriler.size(); i++){ %>
                            <li class="nav-item dd-list"><a class="nav-link" href="master2.jsp?kategoriId=<%=kategoriler.get(i).getCategory_id() %>"><%=kategoriler.get(i).getCategory_name() %></a></li>
                           
                           <%} %> 
    
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    
</section>
    <%@ include file="homepage.jsp"%>
    <%@ include file="footer.jsp"%>
    
    <!--Genel JavaScript-->
    <script src="themes/modalarda/js/jquery-3.3.1.min.js"></script>
    <script src="themes/modalarda/js/popper.min.js"></script>
    <script src="themes/modalarda/js/bootstrap.js"></script>
    <script type="text/javascript" src="themes/modalarda/js/owl.carousel.min.js"></script>
    <script src="themes/modalarda/js/site.js"></script>
    <!--Genel JavaScript-->
    
</body>

</html>