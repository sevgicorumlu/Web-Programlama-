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
        <div class="container">
            <div class="row d-none d-sm-none d-lg-block">
                <!--Banner-->
                <div class="col-lg-12 d-none d-sm-none d-lg-block">
                    <img src="themes/modalarda/img/banners/1.jpg"
                         class="img-fluid mb-3">
                </div>
                <!--Banner Bitti-->
            </div>
           
            <div class="row">
                <!--Sol Taraf-->
                <div class="col-lg-3 d-none d-sm-none d-lg-block">
                    <!--Kategori Widget-->
                   
                   <!--Kategori Widget-->
                    	
                    <div class="category-sidebar-widget">
                        <!--Kategori Başlığı-->
                        <a href="javascript:void(0);" class="sidebar-toggle"><strong
                                    class="sidebar-widget-title">KATEGORİ</strong>
                            <i class="fas fa-chevron-up" aria-expanded="true"></i> </a>
                        <!--Kategori Başlığı-->
                        <!--Widget İçeriği-->
                        <div class="sidebar-widget-content">
                    
                            <!--Kategori Checkbox-->
                             <%for(int i = 0; i < kategoriler.size(); i++){ %>
                            <a class="nav-link" href="master2.jsp?kategoriId=<%=kategoriler.get(i).getCategory_id() %>"><%=kategoriler.get(i).getCategory_name() %></a></li>
                           <%} %> 

                            <!--Kategori Checkbox Bitti-->
                           
                        </div>
                        <!--Widget İçeriği-->
                    </div>
                    
                    <!--Kategori Widget Bitti-->
                </div>
                <!--Sol Taraf Bitti-->
                <!--Sağ Taraf-->
                <div class="col-lg-9">
                    <!--Başlık ve Açıklama-->
                    
                   
                    <!--Başlık ve Açıklama Bitti-->

                    
                    
               
                    <!--Ürünler-->
                    <div class="product-showcase">
                        <div class="row">
                        <%for(int i = 0; i < urunler.size(); i++){ %>
                           <!--Ürün-->
                            <div class="col-lg-4 col-sm-6 col-6">
                                <div class="product-container">
                                    <div class="product-image">
                                        <div class="free-shipping-badge d-none d-lg-none d-sm-block">
                                            <i class="fas fa-truck"></i> Ücretsiz Kargo!
                                        </div>
                                       
                                        
                                        <a href="urun.jsp?productId=<%=urunler.get(i).getProduct_id() %>"><img
                                                    src="<%=urunler.get(i).getProduct_image() %>"
                                                    title="<%=urunler.get(i).getProduct_image() %>" alt="<%=urunler.get(i).getProduct_image() %>"></a>
                                   
                                      
                                        
                                    </div>
                                    <div class="product-meta">
                                        <div class="product-title">
                                            <a href="urun.jsp?productId=<%=urunler.get(i).getProduct_id() %>"><%=urunler.get(i).getProduct_name() %></a>
                                        </div>
                                        <div class="product-aa">
                                            <a href="urun.jsp?productId=<%=urunler.get(i).getProduct_id() %>"><%=urunler.get(i).getProduct_code() %></a>
                                        </div>
                                        <div class="product-price">
                                            
                                            <span class="currency"></span><span class="product-price"><%=urunler.get(i).getProduct_price() %> ₺</span>
                                           
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <%} %>
                            <!--Ürün Bitti-->
                                
                        </div>
                    </div>
                    <!--Ürünler Bitti-->
                        
             
                </div>
                <!--Sağ Taraf Bitti-->
            </div>
        </div>
    </section>
    <!--İçerik Bitti-->

</html>