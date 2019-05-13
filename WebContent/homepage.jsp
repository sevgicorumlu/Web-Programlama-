<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<%ArrayList<Category> urunler = new ArrayList<Category>(CategoryDao.allCategory());%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 <section class="slider">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="rev_slider_wrapper">
                        <div id="main_slider" class="rev_slider" data-version="5.4.5" style="display:none">
                            <ul>
                                <%for(int i = 0; i < urunler.size(); i++){ %>
                                <li >
                                    <img src="<%=urunler.get(i).getCategory_image() %>" >
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Slider Bitti-->
    <!--Slider Alt-->
    <section class="slider-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-sm-12 pr-lg-0">
                    <div class="sb-content border-right-0">
                        <img src="themes/modalarda/img/icons/slider-bottom/iadedegisim.svg" class="icon-22" alt="" title=""> %100 İADE & DEĞİŞİM GARANTİSİ
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 pl-lg-0 pr-lg-0">
                    <div class="sb-content border-right-0">
                        <img src="themes/modalarda/img/icons/slider-bottom/kapidaodeme.svg" class="icon-22" alt="" title=""> KAPIDA ÖDEME & KREDİ KARTI
                    </div>
                </div>
                <div class="col-lg-4 col-sm-12 pl-lg-0">
                    <div class="sb-content">
                        <img src="themes/modalarda/img/icons/slider-bottom/guvenlialisveris.svg" class="icon-22" alt="" title=""> %100 GÜVENLİ ALIŞVERİŞ
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Slider Alt Bitti-->
   
               <%for(int i = 0; i < urunler.size(); i++){ %>
                    
                    <!--3'lü Kategori-->
                    <section class="category-3">
                        <div class="container">
                             
                                <div class="row">
                                    <div class="col-lg-12">
                                        <h3 class="category-head-title"><%=urunler.get(i).getCategory_name() %></h3>
                                    </div>
                                </div>
                          
                            <div class="row">
                                <!--Kategori-->
                                
                               
                                    <div class="col-lg-4 col-sm-12">
                                        <div class="category-content">
                                            <div class="category-img">
                                                <a href="master2.jsp?kategoriId=<%=urunler.get(i).getCategory_id() %>">
                                                    <img src="<%=urunler.get(i).getCategory_image() %>" class="category-hover-img">
                                                    <img src="<%=urunler.get(i).getCategory_image() %>" alt="" title="" class="img-fluid w-100">
                                                </a>
                                            </div>
                                            <div class="category-content">
                                                <div class="row">
                                                    <div class="col-lg-7">
                                                        <p class="category-title"><a href="master2.jsp?kategoriId=<%=urunler.get(i).getCategory_id() %>"><%=urunler.get(i).getCategory_name() %></a></p>
                                                      
                                                    </div>
                                                    <div class="col-lg-5 pl-lg-0">
                                                        <a href="master2.jsp?kategoriId=<%=urunler.get(i).getCategory_id() %>" class="category-link">HEMEN İNCELE</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                           
                            <!--Kategori Bitti-->
                            </div>
                        </div>
                    </section>
                      <% } %>
                    <!--3'lü Kategori Bitti-->
               
     
   

    <!--Sayfaya özel Js-->
    <script type="text/javascript" src="themes/modalarda/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="themes/modalarda/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="themes/modalarda/js/index.js"></script>
    <!--Sayfaya özel Js Bitti-->

    <!--Sayfaya özel CSS-->
    <link rel="stylesheet" type="text/css" href="themes/modalarda/revolution/css/settings.css">
    <link rel="stylesheet" type="text/css" href="themes/modalarda/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="themes/modalarda/revolution/css/navigation.css">

</html>