<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="sidebar d-none d-sm-none d-lg-block">
    <!--Logo-->
    <div class="sidebar-brand">
        <div class="adtr-logo">
            <a href="product.jsp"><img src="admin/img/login/logo.png" class="desktop-logo"></a>
            <a class="sidebar-toggle text-light mr-3"><img src="admin/img/header/content.png" height="30" width="30"></a>
        </div>
    </div>
    <!--Logo Bitti-->
    <!--Sol Menü-->
    <div class="sidebar-menu" id="sidebarMenu">
        <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse"
                        data-target="#products">
                    <img src="admin/img/sidebar/urunlistesi.svg" class="menu-icon">
                    <span class="menu-text">Ürün Yönetimi</span>
                </button>
            </div>
            <div id="products" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="product.jsp">Ürünler</a></li>
                        <li><a href="addProduct.jsp">Ürün Ekle</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        
        <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse" data-target="#users">
                    <img src="admin/img/sidebar/musteriler.svg" class="menu-icon">
                    <span class="menu-text">Kullanıcılar</span>
                </button>
            </div>
            <div id="users" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="user.jsp">Kullanıcı Listesi</a></li>
                        <li><a href="addUser.jsp">Yönetici Ekle</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse" data-target="#orders">
                    <img src="admin/img/sidebar/musteriler.svg" class="menu-icon">
                    <span class="menu-text">Sipariş Yönetimi</span>
                </button>
            </div>
            <div id="orders" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="order.jsp">Siparişler</a></li>
                       
                    </ul>
                </div>
            </div>
        </div>
        
         <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse"
                        data-target="#brands">
                    <img src="admin/img/sidebar/urunlistesi.svg" class="menu-icon">
                    <span class="menu-text">Marka Yönetimi</span>
                </button>
            </div>
            <div id="brands" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="brand.jsp">Markalar</a></li>
                        <li><a href="addBrand.jsp">Marka Ekle</a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse"
                        data-target="#categories">
                    <img src="admin/img/sidebar/kategoriler.svg" class="menu-icon">
                    <span class="menu-text">Kategori Yönetimi</span>
                </button>
            </div>
            <div id="categories" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="category.jsp">Kategoriler</a></li>
                        <li><a href="addCategory.jsp">Kategori Ekle</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <button class="menu-item collapsed" aria-expanded="false" data-toggle="collapse"
                        data-target="#contact">
                    <img src="admin/img/sidebar/kategoriler.svg" class="menu-icon">
                    <span class="menu-text">İletişim Talepleri</span>
                </button>
            </div>
            <div id="contact" class="collapse" data-parent="#sidebarMenu">
                <div class="card-body">
                    <ul class="sidebar-submenu">
                        <li><a href="contacts.jsp">İletişim talepleri</a></li>
                    </ul>
                </div>
            </div>
        </div>      
       
    </div>
    <!--Sol Menü Bitti-->
</div>
