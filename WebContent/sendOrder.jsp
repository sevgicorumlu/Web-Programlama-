<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
    <% ArrayList<Product> sepet = new ArrayList<Product> ((ArrayList<Product>) request.getSession().getAttribute("sepet")); %>
    <%ArrayList<Category> kategoriler = new ArrayList<Category>(CategoryDao.allCategory());%>
    <% ArrayList<Address> address = new ArrayList<Address>(AddressDao.allAddress()); %>
    <%ArrayList<User> user = new ArrayList<User>(UserDao.oneUserDetail(String.valueOf(request.getSession().getAttribute("kullanici_isim"))));%>
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

<section class="page-content">
       <div class="floating-cart">
    <div class="cart-title font-weight-bold">Alışveriş Sepetiniz <i title="Kapat" class="fas fa-times"></i></div>
    <div class="cart-product-list">
       
        
       
        <!--Sepet öğeleri-->
        <div class="product-list">
            <!--foreach -->
                <div class="media">
                   
                    
                </div>
            <!--endforeachx-->
        </div>
        <!--Sepet öğeleri-->
    </div>
    <div class="floating-cart-footer">
        
        <
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
                    <li><a href="orderdetail.jsp">Sipariş Bilgi</a></li>
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
                  <%if(session.getAttribute("musteri") == null ){ %>
	                            <li><a href="signin.jsp"><img src="themes/modalarda/img/icons/header/profil.svg" class="icon-32 mr-1"> <span class="hul-span"> Üye Girişi</span>
                        </a></li>
				<%}
				if(session.getAttribute("musteri") != null ){ %>
				  <li><a href="UserLogout" class="fas fa-sign-out-alt"> <span class="hul-span"> Çıkış Yap</span>
                        </a></li>
				 
				<%} %>
                   <li>
                    <a href="master3.jsp"><img src="themes/modalarda/img/icons/header/sepet.svg" class="icon-32 mr-1"><span >Sepetim</span></a></li>
                    </li>
                    
                       
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
         <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>SİPARİŞ BİLGİLERİ</h1>
                </div>
                <div class="col-lg-12 mt-2">
                    
                    </div>
                    <table class="table table-bordered mt-3">
                        <thead class="thead-dark">
                        <tr>
                            <td class="text-left" style="width: 50%; vertical-align: top;"><h5>FATURA ADRESİ</h5></td>
                            <td class="text-left" style="width: 50%; vertical-align: top;"><h5>TESLİMAT ADRESİ</h5></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                        
                            <td class="text-left"><strong>İsim: </strong> <%=user.get(0).getUser_name()%><br>
                                <strong>Adres: </strong><%=address.get(user.get(0).getAddress_id()).getDelivery_address() %>
					<br>
                                <td class="text-left"><strong>İsim: </strong><%=user.get(0).getUser_name()%><br>
                                <strong>Adres: </strong><%=address.get(user.get(0).getAddress_id()).getDelivery_address() %>
                                <br>
                                 </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="table-responsive mt-3">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-center" style="width:7%"><strong>Ürün Resmi</strong></td>
                                <td class="text-left" style="width:20%"><strong>Ürün Adı</strong></td>
                                <td class="text-left" style="width:8%"><strong>Ürün Kodu</strong></td>
                                <td class="text-right" style="width:8%"><strong>Ürün Adedi</strong></td>
                                <td class="text-right" style="width:13%"><strong>Birim Fiyatı</strong></td>
                                <td class="text-right" style="width:13%"><strong>Tutarı</strong></td>
                                <td class="text-left" style="width:31%"><strong>İşlemler</strong></td>
                            </tr>
                            </thead>
                            <tbody>
                            
                            <%for(int i = 0; i < sepet.size(); i++){ %>
                            <tr>
                                <td class="text-center">
                                    <a href="{{ route('product',$orderproduct->product->slug) }}">
                                        <img src="<%= sepet.get(i).getProduct_image() %>" class="img-thumbnail">
                                    </a>
                                </td>
                                <td class="text-left">
                                   
                                        <%= sepet.get(i).getProduct_name() %>
                                    <br>
                                    &nbsp;
                                </td>
                                <td class="text-left"><%= sepet.get(i).getProduct_code() %></td>
                                <td class="text-right">1</td>
                                <td class="text-right"><%= sepet.get(i).getProduct_price() %> TL</td>
                                
                                <td class="text-right"><%= sepet.get(i).getProduct_price() * 1 %> TL</td>
                                <td class="text-center" style="white-space: nowrap;">
                                    <div class="row">
                                        
                                        <div class="col-md-6 col-sm-6 text-right">
                                            <form action="#" method="post">
                                                
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-reply"></i> İptal Et</button>
                                            </form>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                           
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="4"></td>
                                <td class="text-right"><b>Ara Toplam</b></td>
                                <td class="text-right"> TL</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4"></td>
                                <td class="text-right"><b>Sabit Fiyatlı Kargo</b></td>
                                <td class="text-right">1,00 TL</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="4"></td>
                                <?php $total = $aratoplam+5; ?>
                                <td class="text-right"><b>Toplam</b></td>
                                <td class="text-right"> TL</td>
                                <td></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                   
                    <div class="buttons clearfix">
                    <form action="AddOrder">
                    <input type="hidden" value="<%= sepet.get(i).getProduct_id() %>" name="productId" id="productId">
                    <input type="hidden" value="<%=user.get(0).getUser_id() %>" name="userId" id="userId">
                    <input type="hidden" value="1" name="quantity" id="quantity">
                    <input type="hidden" value="0" name="status" id="status">
                    <input type="hidden" value="<%=user.get(0).getAddress_id() %>" name="address_id" id="address_id">
                    <div class="pull-right"><button class="btn btn-primary">Sipariş Ver</button></div>
                    </form>
                        
                    </div>
                </div>
            </div>
        </div>
          <%} %>
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