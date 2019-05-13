<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>

<%ArrayList<Product> urunler = new ArrayList<Product>(ProductDao.allProductList());%>
<% ArrayList<Category> kategoriler = new ArrayList<Category>(CategoryDao.allCategory()); %>
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
                    <th style="width: 15%;"> Ürün Görseli</th>
                    <th style="width: 15%;"> Ürün Kodu</th>
                    <th style="width: 15%;"> Ürün Adı</th>
                    <th style="width: 13%;"> Açıklama</th>
                    <th style="width: 15%;"> Kategori</th>
                    <th style="width: 10%;"> Fiyatı</th>
                    <th style="width: 15%;"> Stok Adedi</th>
                    <th style="width: 35%;"> İşlemler</th>
                </tr>
               
                </thead>
                 <%for(int i = 0; i < urunler.size(); i++){ %>
              
                        <tr>
                        
                        <td><img class="irc_mi" src="<%=urunler.get(i).getProduct_image() %>" alt="ecommerce" 
                         width="100" height="100"></td>
                                                	
                         	<td><%=urunler.get(i).getProduct_code() %></td>
                            <td><%=urunler.get(i).getProduct_name() %></td>
                            <td><%=urunler.get(i).getProduct_explain() %></td>
                            <td><%= urunler.get(i).getCategory_id() %><br /></td>
                            <td><%=urunler.get(i).getProduct_price() %> ₺</td>
                            <td><%=urunler.get(i).getProduct_stock() %> </td>
                            <td>
                                <a href="ProductDelete?delete=<%=urunler.get(i).getProduct_id() %>">
                                    <button class="btn btn-danger btn-sm">
                                        <i class="fa fa-times"></i> Sil
                                    </button>
                                </a>
                                <form action="editProduct.jsp">
                                	<input type="hidden" name="productCode" value="<%=urunler.get(i).getProduct_code() %>" >
                                	<input type="hidden" name="productName" value="<%=urunler.get(i).getProduct_name() %>" >
                                	<input type="hidden" name="productImage" value="<%=urunler.get(i).getProduct_image() %>" >
                                	<input type="hidden" name="productExplain" value="<%=urunler.get(i).getProduct_explain() %>" >
                                	<input type="hidden" name="productCategoryId" value="<%=urunler.get(i).getCategory_id() %>" >
                                	<input type="hidden" name="productBrandId" value="<%=urunler.get(i).getBrand_id() %>" >
                                	<input type="hidden" name="productPrice" value="<%=urunler.get(i).getProduct_price() %>" >
                                	<input type="hidden" name="productStock" value="<%=urunler.get(i).getProduct_stock() %>" >
                                    
                                </form>
                            </td>
                            <%} %>
                        </tr>        
            </table>
        </div>
        <!--Ürünler Bitti-->
    </section>
    </div>
</div>

<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,900&amp;subset=latin-ext" rel="stylesheet">
<link rel="stylesheet" href="admin/css/bootstrap.min.css">
<link rel="stylesheet" href="admin/css/fontawesome-all.min.css">
<link rel="stylesheet" href="admin/css/select2.min.css">
<link rel="stylesheet" href="admin/css/select2-bootstrap.min.css">
<link rel="stylesheet" href="admin/css/style.css">
<link rel="stylesheet" href="admin/css/responsive.css">


<script src="admin/js/jquery-3.3.0.min.js"></script>
<script src="admin/js/popper.js"></script>
<script src="admin/js/bootstrap.min.js"></script>
<script src="admin/js/jquery.initialize.min.js"></script>
<script src="admin/js/select2.min.js"></script>
<script src="admin/js/select2.tr.js"></script>
<script src="admin/js/jquery.mask.min.js"></script>
<script src="admin/js/site.js"></script>
<script type="text/javascript">
