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
<div class="floating-cart">
    <div class="cart-title font-weight-bold">Alışveriş Sepetiniz <i title="Kapat" class="fas fa-times"></i></div>
    <div class="cart-product-list">
       
        <!--Sepet boşsa-->
        <div class="empty-product-list text-center pt-3 pb-2">
            <i class="fas fa-shopping-cart fa-3x mb-2"></i>
            <h5>Alışveriş sepetiniz boş...</h5>
        </div>
        <!--Sepet boşsa bitti-->
       
        <!--Sepet öğeleri-->
        <div class="product-list">
            <!--foreach -->
                <div class="media">
                    <form action="{{ route('basket.remove') }}" method="post">
                        
                        <input type="hidden" name="rowid" value="{{ $urunCartItem->rowId }}" />
                        <button type="submit" class="remove-cart-item"><i class="fas fa-times-circle"></i></button>
                    </form>
                    <img class="ml-2 mr-3" src="{{ getImageAndTitle($urunCartItem->id)->path }}" width="64" height="64" alt="Generic placeholder image" alt="{{ getImageAndTitle($urunCartItem->id)->alt_and_title }}" title="{{ getImageAndTitle($urunCartItem->id)->alt_and_title }}">
                    <div class="media-body">
                        <a href="{{ route('product', $urunCartItem->options->slug)  }}" class="font-weight-bold mt-0">{{ $urunCartItem->name }}</a>
                        <p>
                            <small>{{ number_format($urunCartItem->subtotal,2) }} TL</small>
                        </p>
                        <div class="form-group row">
                            <div class="col-sm-7 pr-0">
                                <input title="Adet" type="number" min="0"   max="100" name="piece" class="form-control text-center artirazalt" value="{{ $urunCartItem->qty }}" data-id="{{ $urunCartItem->rowId }}">
                            </div>
                            <label class="col-sm-5 col-form-label">Adet</label>
                        </div>
                    </div>
                </div>
            <!--endforeachx-->
        </div>
        <!--Sepet öğeleri-->
            @endif
    </div>
    <div class="floating-cart-footer">
        <div class="cart-total">
            <small>TOPLAM</small>
            <span class="cart-total-price">total</span> <span class="currency">TL</span>
        </div>
        <ul>
            <li class="continue-shopping"><a href="{{ route('anasayfa') }}">ALIŞVERİŞE DEVAM</a></li>
            <li class="go-to-payment"><a href="{{ route('payment') }}"><i class="fas fa-cart-arrow-down"></i> ÖDEMEYE GİT</a></li>
        </ul>
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
                    <li><a href="{{ route('orders.orders') }}">Sipariş Takibi</a></li>
                    <li><a href="{{ route('contact') }}">İletişim</a></li>
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
                <form action="{{ route('search') }}" method="post">
                    
                    <div class="input-group header-search">
                        
                        <div class="input-group-append">
                            
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 col-5 link-area">
                <ul class="header-user-links">
                    <li class="d-lg-none d-sm-block"><a href="#"><img src="themes/modalarda/img/icons/header/heart.svg"
                                                                      class="icon-32 mr-1"></a></li>
                  
                    <li><a href="signin.jsp"><img src="themes/modalarda/img/icons/header/profil.svg" class="icon-32 mr-1"> <span class="hul-span">Üye Girişi</span>
                        </a></li>
                   
                        
                  
                    <li class="my-cart-trigger">
                        <a href="{{route('basket')}}"><img src="themes/modalarda/img/icons/header/sepet.svg" class="icon-32 mr-1"><span class="hul-span">Sepetim</span></a></li>
                </ul>
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
        <img src="themes/modalarda/img/header/logo.png" alt="Modalarda.com" class="pulse" width="202" height="58">
    </div>
</div>
<!--Preloader Bitti-->
    
      <section class="page-content">
        
        <div class="container">
            <div class="row">
                <!--<div class="col-lg-12">
                    <div class="alerts">
                        <div class="alert alert-success">Giriş başarılı. Yönlendiriliyorsunuz...</div>
                        <div class="alert alert-danger">Hatalı bilgi girdiniz. Lütfen tekrar deneyiniz.</div>
                    </div>
                </div>-->
                <div class="col-lg-6">
                    <h1 class="mb-3">GİRİŞ YAP</h1>
                    <!--Giriş formu-->
                   
                    <form class="form-signin text-center" action="UserLogin" method="POST">
                        <label for="musteriMail" class="sr-only">E-posta adresiniz</label>
                        <input type="musteriMail" id="musteriMail" class="form-control"  name="musteriMail" placeholder="E-posta adresiniz">
                        <label for="musteriSifre" class="sr-only">Parolanız</label>
                        <input type="password" id="musteriSifre" class="form-control mt-2" name="musteriSifre" placeholder="Parolanız">
                        <div>
                            <label>
                                <input type="checkbox" value="remember-me"> Beni hatırla
                            </label>
                          
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Giriş yap</button>
							
                    </form>
                    <!--Giriş formu bitti-->
                </div>
                <div class="col-lg-6">
                    <div class="reg-on-login text-center">
                        <p><img src="themes/modalarda/img/coffee.png" width="200" alt=""></p>
                        <h4>ÜYELİĞİNİZ YOK MU?</h4>
                        <a href="signup.jsp" class="btn btn-dark text-white">HEMEN BİR TANE OLUŞTURUN.</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--İçerik Bitti-->
    
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