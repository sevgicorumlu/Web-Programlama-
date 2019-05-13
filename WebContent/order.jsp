<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<%ArrayList<Order> order = new ArrayList<Order>(OrderDao.allOrderList());%>
<%ArrayList<User> user = new ArrayList<User>(UserDao.allUserList());%>
<%ArrayList<Product> urunler = new ArrayList<Product>(ProductDao.allProductList());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>Töz&Çorumlu&Gül</title>
    <link rel="shortcut icon" href="#">
    <meta name="viewport" content="width=device-width, user-scalable=no"/>
</head>
<body>

<div class="d-flex align-items-stretch">
<%@ include file="solmenu.jsp"%>

    <div class="content">
        <section class="page-content">
        <h1 class="inner-page-title d-none d-sm-none d-lg-block">Ürünler</h1>
       
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width: 20%;">Siparişi Veren Kullanıcı</th>
                    <th style="width: 15%;"> Ürün</th>
                    <th style="width: 15%;"> Siparişteki Ürün Sayısı</th>
                    <th style="width: 13%;"> Sipariş Toplamı</th>
                    <th style="width: 15%;"> Durum</th>
                    <th style="width: 35%;"> İşlemler</th>
                </tr>
               
                </thead>
                 <%for(int i = 0; i < order.size(); i++){ %>
              
                        <tr>
                            <td><%=order.get(i).getUser_id() %></td>
                            <td><%=order.get(i).getProduct_id() %></td>
                            <td><%=order.get(i).getQuantity() %> <br /></td>
                            <td><%=order.get(i).getAddress_id() %> </td>
                            <% if(order.get(i).getStatus() == 0){ %>
                            <td> <span class="badge badge-warning">Onay Bekleniyor</span></td>
                            <td>
	                            <form action="OrderStatus">
	                               		<input type="hidden" name="orderId" value="<%=order.get(i).getOrder_id() %>">
	                                    <button class="btn btn-warning btn-sm" name="orderStatus"  value="1" >
	                                        <i  name="orderStatus" value="1"></i> Sipariş Onayla
	                                    </button>
	                                
	                             </form>
	                        </td>
                            <% }%>
                            <% if(order.get(i).getStatus() == 1){ %>
                            <td><span class="badge badge-success">Sipariş Tamamlandı</span></td>
                            <td><form action="OrderStatus">
	                               		<input type="hidden" name="orderId" value="<%=order.get(i).getOrder_id() %>">
	                                    <button class="btn btn-success btn-sm" name="orderStatus"  value="0" >
	                                        <i  name="orderStatus" value="0"></i> Siparis Beklemeye Al
	                                    </button>
	                                
	                             </form></td>
                            <% }%>
                            <%} %>
                        </tr>                  
                
            </table>
        </div>
        <!--Ürünler Bitti-->
    </section>
    <!--Sayfa İçeriği Bitti-->
    </div>
    <!--Sağ Taraf Bitti-->
</div>
<!--CSS-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,900&amp;subset=latin-ext" rel="stylesheet">
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<link rel="stylesheet" href="admin/css/fontawesome-all.min.css">
<link rel="stylesheet" href="admin/css/select2.min.css">
<link rel="stylesheet" href="admin/css/select2-bootstrap.min.css">
<link rel="stylesheet" href="admin/css/style.css">
<link rel="stylesheet" href="admin/css/responsive.css">

<!--CSS Bitti-->
<!--JS-->
<script src="admin/js/jquery-3.3.0.min.js"></script>
<script src="admin/js/popper.js"></script>
<script src="admin/js/bootstrap.min.js"></script>
<script src="admin/js/jquery.initialize.min.js"></script>
<script src="admin/js/select2.min.js"></script>
<script src="admin/js/select2.tr.js"></script>
<script src="admin/js/jquery.mask.min.js"></script>
<script src="admin/js/site.js"></script>
<script type="text/javascript">
