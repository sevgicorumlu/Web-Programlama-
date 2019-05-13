<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<% ArrayList<Category> kategoriler = new ArrayList<Category>(CategoryDao.allCategory()); %>
<% ArrayList<Brand> markalar = new ArrayList<Brand>(BrandDao.allBrand());%>
<%ArrayList<Product> urunler = new ArrayList<Product>(ProductDao.allProductList()); %>
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
       
		
        <form method="post" action="AddProduct" >
            <hr>
           
            <div class="desktop-nav-tabs d-none d-sm-none d-lg-block">
                <ul class="nav nav-tabs product-tabs-select">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#general_info">Ürün Ekle</a>
                    </li>                 
                </ul>
            </div>
            <!--Masaüstü Sekme Linkleri Bitti-->

            <div class="tab-content">
                <div class="tab-pane active" id="general_info">
                    <!--Genel Bilgiler-->
                    <div class="form-group row">
                        <label for="product_image" class="col-sm-2 col-form-label">Ürün Görseli <span class="required-input">*</span></label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control char-textarea" name="product_image" id="product_image"   />
                        </div>
                     </div>
                    <div class="form-group row">
                        <label for="product_code" class="col-sm-2 col-form-label">Ürün Kodu <span class="required-input">*</span></label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control char-textarea" name="product_code" id="product_code"   />
                        </div>
                     </div>
                     
                       <div class="form-group row">  
                        	<label for="product_name" class="col-sm-2 col-form-label">Ürün Adı <span class="required-input">*</span>
                       		 </label>
                       		 <div class="col-sm-10">
                            	<input type="text" class="form-control char-textarea" name="product_name" id="product_name"   />
                        	</div>
                        </div>
                         <div class="form-group row">  
                        	<label for="product_stock" class="col-sm-2 col-form-label">Ürün Stok <span class="required-input">*</span>
                       		 </label>
                       		 <div class="col-sm-10">
                            	<input type="text" class="form-control char-textarea" name="product_stock" id="product_stock"  />
                        	</div>
                        </div>
                         <div class="form-group row">  
                        	<label for="product_price" class="col-sm-2 col-form-label">Ürün Fiyatı <span class="required-input">*</span>
                       		 </label>
                       		 <div class="col-sm-10">
                            	<input type="text" class="form-control char-textarea" name="product_price" id="product_price"   />
                        	</div>
                        </div>
                         
                         <div class="form-group row">  
                        	<label for="product_category" class="col-sm-2 col-form-label">Kategori <span class="required-input">*</span>
                       		 </label>
                       		 <div class="col-sm-10">
                            	<select class="col-sm-12" name="product_category">
					<%for(int i = 0; i < kategoriler.size(); i++){ %>
						<option value="<%= kategoriler.get(i).getCategory_id() %>"><%= kategoriler.get(i).getCategory_name() %></option>
					<%} %>
				</select>
				<br>
                        	</div>
                        </div>
                         <div class="form-group row">  
                        	<label for="product_brand" class="col-sm-2 col-form-label">Marka <span class="required-input">*</span>
                       		 </label>
                       		 <div class="col-sm-10">
                            	<select class="col-sm-12" name="product_brand">
					<%for(int i = 0; i < markalar.size(); i++){ %>
						<option value="<%= markalar.get(i).getBrand_id() %>"><%= markalar.get(i).getBrand_name() %></option>
					<%} %>
				</select>
				<br>
                        	</div>
                        </div>
                        <div class="form-group row">  
                        	<label for="product_explain" class="col-sm-2 col-form-label">Ürün Açıklama</label>
                       		 <div class="col-sm-10">
                       		 <textarea type="text" class="form-control char-textarea" name="product_explain" id="product_explain"></textarea>
                            	
                        	</div>
                        </div>
                        
                    <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Kaydet</button>
                    <!-- Genel Bilgi Bitti -->
                </div>
                         </div>
            </div>
        </form>
        <!--Ürünler Bitti-->
   
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
