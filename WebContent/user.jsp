<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<%
ArrayList<User> urunler = new ArrayList<User>(UserDao.allUserList());
%>
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
        <h1 class="inner-page-title d-none d-sm-none d-lg-block">Kullanıcılar</h1>
       
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width: 25%;"> Adı Soyadı</th>
                    <th style="width: 25%;"> Email Adresi</th>
                    <th style="width: 20%;"> Türü</th>
                    <th style="width: 35%;"> İşlemler</th>
                </tr>
               
                </thead>
                 <%for(int i = 0; i < urunler.size(); i++){ %>
                <tbody id="userlist">
                        <tr>
                         	<td><%=urunler.get(i).getUser_name() %></td>
                            <td><%=urunler.get(i).getUser_email() %></td>
                             <td>
                              <%if(urunler.get(i).getAuthorized() == 1){ %>
                                    <span class="badge badge-warning">Yönetici</span>
                               <%} %>
                               <%if(urunler.get(i).getAuthorized() == 0){ %>
                                    <span class="badge badge-success">Müşteri</span>
                               <%} %> 
                            </td>
                            <td>
                                <a href="UserDelete?delete=<%=urunler.get(i).getUser_id()%>" >
                                    <button class="btn btn-danger btn-sm">
                                        <i class="fa fa-times"></i> Sil
                                    </button>
                                </a>
                                                               
                            </td>
                            <%} %>
                        </tr>                  
                </tbody>
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
