<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page
	import="com.ecommerce.model.*"
	import="com.ecommerce.DAO.*"
%>
<%
ArrayList<Contact> contact = new ArrayList<Contact>(ContactDao.allContact());
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
        <h1 class="inner-page-title d-none d-sm-none d-lg-block">İletişim Talepleri</h1>
       
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                 
                <tr>
                	<th style="width: 20%;">Adı</th>
                    <th style="width: 25%;">Soyadı</th>
                    <th style="width: 20%;">Email</th>
                    <th style="width: 30%;">Mesajı</th>
                    <th style="width: 30%;">Durumu</th>
                    <th style="width: 35%;">İşlemler</th>
                    
                </tr>
                </thead>
                <%for(int i = 0; i < contact.size(); i++){ %>
                <tbody id="brandlist">
                        <tr>
                        	<td><%=contact.get(i).getContact_name() %></td>
                            <td><%=contact.get(i).getContact_surname()%></td>
                            <td><%=contact.get(i).getContact_email()%></td>
                            <td><%=contact.get(i).getContact_message()%></td>
                            <% if(contact.get(i).getStatus() == 0){ %>
                            <td> <span class="badge badge-warning">Talep Okunmadı</span></td>
                            <td>
                            	<form action="ContactStatus">
                               		<input type="hidden" name="contactId" value="<%=contact.get(i).getContact_id() %>">
                                    <button class="btn btn-success btn-sm" name="contactStatus"  value="1" >
                                        <i  name="contactStatus" value="1"></i> Talep Okundu
                                    </button>
                                
                                </form>
                           	</td>
                            <% }%>
                            <% if(contact.get(i).getStatus() == 1){ %>
                            <td><span class="badge badge-success">Talep Okundu</span></td>
                            <td>
                            	<form action="ContactStatus">
                               		<input type="hidden" name="contactId" value="<%=contact.get(i).getContact_id() %>">
                                    <button class="btn btn-warning btn-sm" name="contactStatus"  value="0" >
                                        <i  name="contactStatus" value="0"></i> Talep Okunmadı
                                    </button>
                                
                                </form>
                           	</td>
                            <% }%>
                        </tr>                  
                </tbody>
                <% } %>
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
