<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<%
ArrayList<Product> urun = new ArrayList<Product>(ProductDao.oneProduct(Integer.valueOf(request.getParameter("productId"))));
%>
<% ArrayList<Category> kategoriler = new ArrayList<Category>(CategoryDao.allCategory()); %>
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
    
    <div class="cart-product-list">
       
        <!--Sepet öğeleri-->
        <div class="product-list">
            <!--foreach -->
                <div class="media">
                   
                    <div class="media-body">
                       
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
<head>
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

    
    <section class="page-content">
        <div class="container">
           
            <div class="row">
                <!--Ürün Detay Üst-->
                <div class="col-lg-12">
                                    
                    <div class="product-details-top d-none d-sm-none d-lg-flex">
                        <div href="#" class="whatsapp-bar">
                            <a href="#"><i class="fab fa-whatsapp"></i></a>
                            <span><a href="#">0538 370 17 40</a></span>
                        </div>
                        <div href="#" class="cc-bar">
                            <i class="fas fa-credit-card"></i>
                            <span>KREDİ KARTINA 9 TAKSİT!</span>
                        </div>
                        <div href="#" class="cargo-bar">
                            <i class="fas fa-truck"></i>
                            <span>1-4 İŞ GÜNÜ İÇİNDE KARGODA!</span>
                            
                        </div>
                    </div>
                </div>
                <!--Ürün Detay Üst Bitti-->
               
                    <!--Ürün Görselleri-->
                    <div class="col-lg-6 pr-lg-0">
                        <div class="product-images-container">
                            <div class="big-product-image">
                                <a title="Başlık" data-fancybox="gallery"
                                   href="<%=urun.get(0).getProduct_image() %>"><img
                                            class="xzoom"
                                            xoriginal="<%=urun.get(0).getProduct_image() %>"
                                            src="<%=urun.get(0).getProduct_image() %>" alt=""
                                            title=""></a>
                            </div>
                            <div class="other-product-images">
                                <ul class="owl-carousel">
                                    <li><a data-fancybox="gallery" title="Başlık" href="<%=urun.get(0).getProduct_image() %>"><img src="<%=urun.get(0).getProduct_image() %>"> </a></li>
                                    
                                </ul>
                            </div>
                           
                        </div>
                    </div>
                    <!--Ürün Görselleri Bitti-->
               
                <!--Ürün Detayları-->
                <div class="col-lg-6 pl-lg-0">
                    <form class="product-details-right" action="AddBasket" method="post">
                        
                        <input type="hidden" name="productId" value="<%=urun.get(0).getProduct_id() %>" />
                        <input type="hidden" name="userId" value="2" />
                        <input type="hidden" name="quantity" value="1" />
                        <!--Ürün Başlığı -->
                        <h1 class="product-details-title"><%=urun.get(0).getProduct_name() %></h1>
                        <!--Ürün Başlığı Bitti -->
                        <!--Ürün Kodu -->
                        <div class="product-details-product-code"><%=urun.get(0).getProduct_code() %></div>
                        <!--Ürün Bitti -->
                       
                        <hr>
                        <!--Ürün Fiyatı-->
                        <div class="product-details-product-price d-none d-sm-none d-lg-block">
                           
                            <span class="product-price"><%=urun.get(0).getProduct_price() %> TL</span>
                          
                        </div>
                        <!--Ürün Fiyatı-->
                        <%if(session.getAttribute("musteri") != null ){ %>
                       <br><a href="AddBasket?productId=<%=urun.get(0).getProduct_id() %>">
                        <button  class="btn btn-primary ml-2 font-weight-bold add-to-cart w-100"><i class="fas fa-cart-plus"></i> SEPETE EKLE</button>
                        </a>
                        <% } %>
                        <%if(session.getAttribute("musteri") == null ){ %>
                       <br><a href="#">
                        <button id="buton" class="btn btn-primary ml-2 font-weight-bold add-to-cart w-100"><i class="fas fa-cart-plus"></i> SEPETE EKLE</button>
                        </a>
                        <% } %>
                        </div>
                        
                        <hr>
                        
                    </form>
                    <!--Ürün Detayları Bitti-->
                </div>
            </div>
            <!--Alt Sekmeler-->
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-bottom-tabs">
                        <!--Masaüstü Sekme Başlıkları-->
                        <ul class="nav nav-tabs d-none d-sm-none d-lg-flex" role="tablist" id="productTabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#desc" role="tab" data-toggle="tab">ÜRÜN AÇIKLAMASI</a>
                            </li>
                            
                        </ul>
                        <!--Masaüstü Sekme Başlıkları Bitti-->
                        <!--Mobil Sekme Başlıkları-->
                        <select class="mobile-tab-select d-sm-block d-lg-none" title="Sekmeler">
                            <option data-tab="desc">ÜRÜN AÇIKLAMASI</option>
                           
                        </select>
                        <!--Mobil Sekme Başlıkları Bitti-->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane in active" id="desc">
                                <p><strong><%=urun.get(0).getProduct_name() %></strong></p>
                                <p><%=urun.get(0).getProduct_explain() %>
                                </p>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="pay_options">
                                Ödeme Seçenekleri
                            </div>
                            <div role="tabpanel" class="tab-pane" id="comments">
                                
                                <div class="comments col-md-12">
                                   
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Alt Sekmeler Bitti-->
           
        </div>
    </section>
    <!--İçerik Bitti-->

    <!--Sayfaya özel Js-->
    <script src="themes/modalarda/js/xzoom.min.js"></script>
    <script src="themes/modalarda/js/fancybox.js"></script>
    <script src="themes/modalarda/js/product-details.js"></script>
    <!--Sayfaya özel Js Bitti-->
    

    <!--Sayfaya özel CSS-->
    <link rel="stylesheet" href="themes/modalarda/css/fancybox.css"/>
    <link rel="stylesheet" href="themes/modalarda/css/xzoom.css">
    <!--Sayfaya özel CSS Bitti-->

    
    <%@ include file="footer.jsp"%>
    <!--Genel JavaScript-->
    <script src="themes/modalarda/js/jquery-3.3.1.min.js"></script>
    <script src="themes/modalarda/js/popper.min.js"></script>
    <script src="themes/modalarda/js/bootstrap.js"></script>
    <script type="text/javascript" src="themes/modalarda/js/owl.carousel.min.js"></script>
    <script src="themes/modalarda/js/site.js"></script>
    <script>
		var buton=document.getElementById("buton");
		buton.onclick=function(){
		window.alert("Sepete Eklemek İçin Giriş Yapınız"); }
	</script>
    <!--Genel JavaScript-->
    
</body>

</html>