<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
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
     
       
        <!--Sepet öğeleri-->
        <div class="product-list">
            <!--foreach -->
                <div class="media">
                    <form action="{{ route('basket.remove') }}" method="post">
                        
                        <input type="hidden" name="rowid" value="{{ $urunCartItem->rowId }}" />
                        <button type="submit" class="remove-cart-item"><i class="fas fa-times-circle"></i></button>
                    </form>
                   <div class="media-body">
                         <p>
                           
                        </p>
                        <div class="form-group row">
                            <div class="col-sm-7 pr-0">
                                 </div>
                            
                        </div>
                    </div>
                </div>
            <!--endforeachx-->
        </div>
        <!--Sepet öğeleri-->
           
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
                    <li class="discount-item"><a href="iletisim.jsp"><img src="themes/modalarda/img/icons/header/indirim.svg" class="icon-16">
                            İndirim Reyonu</a></li>
                    <li><a href="#">İletişim</a></li>
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
<section class="slider">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="rev_slider_wrapper">
                        <div id="main_slider" class="rev_slider" data-version="5.4.5" style="display:none">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
    
     <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Bize Ulaşın</h1>
                </div>
                <div class="col-lg-6">
                    <h5>İLETİŞİM BİLGİLERİMİZ</h5>
                    <div class="card">
                        <div class="card-body">
                            <p><i class="fas fa-map-marker"></i> Cumhuriyet Mahallesi İsmet İnönü Bulvarı No:293 Atakum /
                                SAMSUN</p>
                            <p><i class="fas fa-phone"></i> 0 850 485 24 24</p>
                            <p><i class="fas fa-envelope"></i> info@tozcorumlugul.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <h5>BİZE YAZIN</h5>
                    <form action="AddContact" method="post">
                        <div class="form-group">
                            <input type="text" placeholder="Adınız" class="form-control" name="first_name" id="first_name">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="Soyadınız" class="form-control" name="last_name" id="last_name">
                        </div>
                        <div class="form-group">
                            <input type="email" placeholder="E-posta adresiniz" class="form-control" name="email" id="email">
                        </div>
                        <div class="form-group">
                        <textarea id="message" name="message" class="form-control" placeholder="Mesajınız"
                                  rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Gönder</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!--Google Harita-->
    <section class="g-map">
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14250.513057679862!2d36.26131889427087!3d41.33493312561216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1str!2str!4v1517260513414"
                width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
    </section>
    
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