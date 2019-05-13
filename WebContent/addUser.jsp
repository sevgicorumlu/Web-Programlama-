<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<% ArrayList<Category> markalar = new ArrayList<Category>(CategoryDao.allCategory()); %>
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
       
		
        <form method="post" action="AddUser" >
            <hr>
            <!--Masaüstü Sekme Linkleri-->
            <div class="desktop-nav-tabs d-none d-sm-none d-lg-block">
                <ul class="nav nav-tabs product-tabs-select">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#general_info">Yönetici Ekle</a>
                    </li>
                                       
                </ul>
            </div>
            <!--Masaüstü Sekme Linkleri Bitti-->

                        <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="general_info">
                    <!--Genel Bilgiler-->
                    <div class="form-group row">
                        <label for="user_name" class="col-sm-2 col-form-label">Yönetici Adı <span class="required-input">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control char-textarea" name="user_name" id="user_name" placeholder="Yönetici Adı"   />
                        </div>
                    </div>
                     <div class="form-group row">   
                        <label for="user_email" class="col-sm-2 col-form-label">Yönetici Email <span class="required-input">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control char-textarea" name="user_email" id="user_email" placeholder="Yönetici Email"   />
                           
                        </div>
                        </div> 
                        <div class="form-group row">   
                        <label for="user_password" class="col-sm-2 col-form-label">Yönetici Parola <span class="required-input">*</span>
                        </label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control char-textarea" name="user_password" id="user_password" placeholder="Yönetici Parola"   />
                        </div>
                        
                     
                        <div class="col-sm-10">
                            <input type="hidden" class="form-control char-textarea" name="user_authorized" id="user_authorized" value="1"   />
                        </div>
                        
                    </div>
                    
                    
                    <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Kaydet</button>
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
