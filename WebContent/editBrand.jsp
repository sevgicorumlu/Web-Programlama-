<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<% ArrayList<Brand> markalar = new ArrayList<Brand>(BrandDao.allBrand()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>Töz&Corumlu&Gül</title>
    <link rel="shortcut icon" href="#">
    <meta name="viewport" content="width=device-width, user-scalable=no"/>
</head>
<body>

<div class="d-flex align-items-stretch">
<%@ include file="solmenu.jsp"%>

    <div class="content">
       
		
        <form method="post" action="BrandUpdate" >
            <hr>
            <!--Masaüstü Sekme Linkleri-->
            <div class="desktop-nav-tabs d-none d-sm-none d-lg-block">
                <ul class="nav nav-tabs product-tabs-select">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#general_info">Marka Düzenle</a>
                    </li>
                                       
                </ul>
            </div>
            <!--Masaüstü Sekme Linkleri Bitti-->

                        <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="general_info">
                    <!--Genel Bilgiler-->
                    <div class="form-group row">
                        <label for="brand_name" class="col-sm-2 col-form-label">Marka <span class="required-input">*</span>
                        </label>
                        <div class="col-sm-10">
                          <input type="hidden" name="brandId" id="brandId" value="<%=request.getParameter("brandId") %>"   />
                            <input type="text" class="form-control char-textarea" name="brandName" required maxlength="100"
                                   data-length="100" id="brandName" placeholder="Marka" value="<%=request.getParameter("brandName") %>"   />
                            <span class="char-count">100 </span> <span class="char-count-label">/ 100</span>
                        </div>
                    </div>
                     
                <div class="text-right">
                <div class="actions btn-set">
                   
                    <button type="reset" class="btn btn-secondary-outline"><i class="fa fa-reply"></i> Temizle</button>
                    <button type="submit" name="kaydet" value="1" class="btn btn-success"><i class="fa fa-check"></i> Kaydet</button>
                    <a href="{{ route('adtrpanel.users.delete', $product->product_id) }}"> <button class="btn btn-warning"><i class="fa fa-check-circle"></i>Sil</button></a>
                  
                </div>
            </div>
                    <!-- Genel Bilgi Bitti -->
                </div>
         </div>
            </div>
        </form>
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
