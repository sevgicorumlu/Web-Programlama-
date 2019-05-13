<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<section class="page-content">
       <div class="floating-cart">
    
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
                <a href="master.jsp" title="Töz&Corumlu&Gül"> <img class="modalarda-logo" src="themes/modalarda/img/header/logo.png"
                                                             width="202" height="58" alt="Töz&Corumlu&Gül" title="Töz&Corumlu&Gül"></a>
            </div>
            <div class="col-md-5 col-12 search-area">
                
                 
                    <div class="input-group header-search">
                        
                        <div class="input-group-append">
                            
                        </div>
                    </div>
                
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
                    <h1>SİPARİŞLERİM</h1>
                </div>
                <div class="col-lg-12">
                    
                    <form>
                        <div class="table-responsive">
                            <table id="cartProducts" class="table table-hover ">
                                <thead>
                                <tr>
                                    <th style="width: 10%" scope="col">Sipariş Kodu</th>
                                    <th style="width: 10%" scope="col">Ürün Foto</th>
                                    <th style="width:100%" scope="col">Ürün Adı</th>
                                    <th style="width:50%" scope="col">Ürün Miktarı</th>
                                    <th style="width:10%" scope="col">Tutar</th>
                                    <th scope="col">İşlemler</th>
                                </tr>
                                </thead>
                                <tbody>
                               <%for(int i = 0; i < sepet.size(); i++){ %>
                                <tr>
                                    <td scope="col">
                                       <%= sepet.get(i).getProduct_code() %>
                                    </td>
                                    <td scope="col">
                                       <img src="<%=sepet.get(i).getProduct_image() %>" width="50" > 
                                    </td>
                                    <td scope="col"><%=sepet.get(i).getProduct_name() %></td>
                                    <td scope="col" ><select class="basketItemQuantity ng-pristine ng-valid ng-touched" ng-model="item.Quantity" ng-init="oldQuantity = 0" ng-focus="oldQuantity = item.Quantity" ng-options="q for q in [] | range:item.Product.MinQuantity:item.StockQuantity" ng-change="quantityChange(item,oldQuantity)" relparent=".parentrel" style=""><option label="1" value="number:1" selected="selected">1</option><option label="2" value="number:2">2</option><option label="3" value="number:3">3</option><option label="4" value="number:4">4</option><option label="5" value="number:5">5</option><option label="6" value="number:6">6</option><option label="7" value="number:7">7</option><option label="8" value="number:8">8</option><option label="9" value="number:9">9</option><option label="10" value="number:10">10</option></select></td>
                                    <td scope="col">
                                       <%=sepet.get(i).getProduct_price() %> TL
                                    </td>
                                    <td scope="col">
                                    <a href="DeleteBasket?urunId=<%=sepet.get(i).getProduct_id() %>"><button  class="btn btn-block btn-danger"><i class="fas fa-times"></i>&nbsp; Sepetten Çıkart</button>
                                    </td>
                                </tr>
                               <%} %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td><a href="http://adtrdemo1.com" class="btn btn-warning"><i class="fa fa-angle-left"></i>
                                                Alışverişe Devam</a></td>
                                        <td></td>
                                        <td></td>
                                        <td style="width: 50%">
                                            <p><strong>Alt toplam: 709.69 TL</strong></p>

                                            <p><strong>KDV: 127.75</strong></p>
                                            <p><strong>Toplam 837.44 TL</strong></p>
                                        </td>
                                        <td>
                                        <a href="sendOrder.jsp" class="btn btn-success btn-block">
                                           Ödeme Yap
                                       </a>
                                        </td>
                                    </tr>
                                    </tfoot>
                            </table>
                        </div>
                    </form>
                   

                </div>
            </div>
    </section>
    <!--İçerik Bitti-->

</html>