<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    
    <%@ include file="header.jsp"%>
    <style>
        .modalarda-preloader {
            display: flex;
            width: 100%;
            height: 100vh;
            position: fixed;
            background-color: white;
            z-index: 999;
            overflow: hidden;
            justify-content: center;
            align-items: center
        }

        .modalarda-preloader {
            margin: auto;
            align-self: center
        }
    </style>
    <!--Preloader CSS tanımlaması. Her zaman üstte olmalıdır.-->
</head>
<body>
<!--Preloader-->
<div class="modalarda-preloader">
    <div class="preloader-inner">
        <img src="themes/modalarda/img/header/logo.png" alt="Toz&Corumlu&Gul" class="pulse" width="202" height="58">
    </div>
</div>
<!--Preloader Bitti-->
    <%@ include file="navbar.jsp"%>
    
     <section class="page-content">
        
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="mb-3">Üye Olun</h1>
                    <!--Üyelik formu-->
                    <!--
                    <div class="alerts">
                        <div class="alert alert-success">Kayıt başarılı...</div>
                        <div class="alert alert-danger">Hatalı bilgi girdiniz. Lütfen tekrar deneyiniz.</div>
                    </div>-->
                 
                    <form action="AddUser" method="post"  class="form-horizontal">
                      <input type="hidden" name="user_authorized" id="user_authorized"
                                               value="0">
                        <fieldset id="account">
                            <legend>Üyelik Bilgileri</legend>
                            
                                <div class="form-group required}">
                                    <label class="control-label" for="user_name">Adı Soyadı</label>
                                    <div class="register-control">
                                        <input type="text" name="user_name" placeholder="Ad" id="input-firstname"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="control-label" for="user_email">E-Posta</label>
                                    <div class="register-control">
                                        <input type="email" name="user_email"  placeholder="E-Posta" id="input-email" class="form-control">
                                    </div>
                                </div>
                                <fieldset>
                                    
                                    <div class="form-group required">
                                        <label class="control-label" for="user_password">Parola</label>
                                        <div class="register-control">
                                            <input type="password" name="user_password" placeholder="Parola" id="input-password"
                                                   class="form-control">
                                            <small class="text-muted">Şifreniz en az 8 karakter uzunluğunda olmalı</small>
                                        </div>
                                    </div>
                                </fieldset>
                            
                       
                        <hr>
                        <fieldset>
                            <div class="buttons">
                                <div class="custom-control custom-checkbox">
                                
                                <div id="pencerekodu"><label for="pencere" class="dugme" >
<input type="checkbox" class="custom-control-input" id="terms">
                                    <label class="custom-control-label" for="terms"><a  data-toggle="modal" data-target="#termsDialog" class="font-weight-bold">Üyelik koşullarını</a> okudum ve kabul ediyorum.</label>
</label><input type="checkbox" class="Pencereac" id="pencere" name="pencere"></input><label class="pencere">

TARAFLAR VE KONU

İşbu sözleşme www.hepyen.com internet sitesinden (bundan sonra İNTERNET SİTESİ olarak anılacaktır) ürün (bundan sonra ÜRÜN/ÜRÜNLER olarak anılacaktır) satın alacak kişi (bundan sonra ALICI olarak anılacaktır) ile /Karanfil Sokak 77/3 Çankaya Ankara adresinde (Tel: 312 299 24 77 ; E-posta: info@hepyen.com) bulunan satıcı firma Portakal Bilgi İşlem Hizmetleri Yazılım Tek.San.Tic.Ltd.Şti (bundan sonra SATICI olarak anılacaktır) arasındaki alışverişe ilişkin olarak, ALICI tarafından elektronik ortamda doldurulan, ÜRÜN ile ilgili özelliklerin, nitelik-niceliğinin, satış fiyatının, satış bedelinin tahsilat usül-şartlarının ve satış tarihinin belirtildiği sipariş formu ile Tüketicilerin Korunması Hakkındaki Kanun ve Mesafeli Sözleşmeler Uygulama Esas ve Usulleri Hakkında Yönetmelik hükümleri kapsamında tarafların hak, hukuk ve yükümlülüklerini tespit eder. İlan edilen fiyatlar ve vaatler güncelleme yapılana ve değiştirilene kadar geçerlidir. Süreli olarak ilan edilen fiyatlar ise belirtilen süre sonuna kadar geçerlidir.

MADDE 1. CAYMA HAKKI

SATICI ALICI (Tüketici)’ya aşağıdaki taahhütte bulunmaktadır. “Tüketicinin hiçbir hukuki ve cezai sorumluluk üstlenmeksizin ve hiçbir gerekçe göstermeksizin malı teslim aldığı veya sözleşmenin imzalandığı tarihten itibaren yedi gün içerisinde malı veya hizmeti reddederek sözleşmeden cayma hakkının var olduğunu ve cayma bildiriminin satıcı veya sağlayıcıya ulaşması tarihinden itibaren malı geri almayı taahhüt ederiz.”

Cayma hakkının kullanılması için bu süre içinde SATICI’ya yazılı bildirimde bulunulması şarttır. Bu hakkın kullanılması halinde, 3. kişiye veya ALICI’ya teslim edilen ÜRÜN’ün SATICI’ya gönderildiğine ilişkin kargo teslim tutanağı örneği ile fatura aslının iadesi zorunludur. Bu belgelerin ulaşmasını takip eden 10 (on) gün içinde ÜRÜN bedeli ALICI’ya iade edilir. Kredi kartlı ödemelerde iade işlemi de ALICI kredi kartına iade sureti ile yapılır. Vergi mevzuatı gereği fatura aslı gönderilmez ise KDV ve varsa sair yasal yükümlülükler iade edilemez. İade edilen ürünün kargo bedeli ALICI tarafından karşılanır.

ALICI’nın özel istek ve talepleri uyarınca üretilen veya üzerinde değişiklik ya da ilaveler yapılarak kişiye özel hale getirilen ya da niteliği itibariyle iade edilemeyecek, hızla bozulma veya son kullanma tarihi geçme ihtimali olan bir ÜRÜN söz konusu olduğunda ve genel olarak ÜRÜN kullanıldığında ya da kullanılmamış olsa dahi kozmetik vs ÜRÜNLER ambalajından çıkarıldığında ALICI cayma hakkını kullanamaz.

MADDE 2. GENEL HÜKÜMLER

2.1. ALICI, İNTERNET SİTESİ’nde gösterilen ürünlerin temel nitelikleri, satış fiyatı ve ödeme şekli ile teslimata ilişkin ön bilgileri okuyup bilgi sahibi olduğunu ve elektronik ortamda satış için gerekli teyidi verdiğini kabul eder.

2.2. ÜRÜN, ALICI’nın İNTERNET SİTESİ üzerinde belirttiği teslimat adresine, faturası ile birlikte paketlenmiş ve sağlam olarak en geç 30 gün içinde teslim edilir, zorunluluk arz eden hallerde bu süre uzayabilir.

2.3. ÜRÜN, ALICI’dan başka bir kişi/kuruluşa teslim edilecek ise, teslim edilecek kişi/kuruluşun teslimatı kabul etmemesinden SATICI sorumlu tutulamaz.

2.4. ALICI, ÜRÜN’ü teslim aldığı anda kontrol etmekle ve ÜRÜN’de kargodan kaynaklanan bir sorun gördüğünde, ÜRÜN’ü kabul etmemekle ve KARGO firması yetkilisine tutanak tutturmakla sorumludur. Aksi halde SATICI sorumluluk kabul etmeyecektir.

2.5. ÜRÜN teslimatı sırasında SATICI’nın talebi halinde ALICI işbu Sözleşmenin bir basılı örneğini imzalamakla yükümlüdür; imzalamaması durumunda ÜRÜN teslimatı yapılmayabilir. İNTERNET SİTESİ’nden alışveriş sırasında ALICI tarafından onaylanan Sözleşme her durumda yeterli ve geçerlidir.

2.6. ALICI, SATICI tarafından aksi yazılı öngörülmemiş ise, ÜRÜN’ü teslim almadan önce bedelini tamamen ödemiş olması gerekir. Teslimattan önce ÜRÜN bedeli SATICI’ya ödenmediği takdirde, SATICI tek taraflı olarak sözleşmeyi iptal edebilir ve ÜRÜN’ü teslim etmeyebilir.

2.7. ÜRÜN teslimatı sonrasında herhangi bir sebepten dolayı, işlem yapılan kredi kartının ait olduğu Banka/finansman kurumunun ÜRÜN bedelini SATICI’ya ödememesi halinde, ÜRÜN en geç 3 gün içinde ALICI tarafından tüm giderleri ALICI’ya ait olmak üzere SATICI’ya iade edilir. SATICI’nın ÜRÜN bedeli alacağını takip dahil diğer tüm akdi-kanuni hakları ayrıca ve herhülakarda saklıdır. Tereddüte mahal vermemek bakımından; Bankalar ve finansman kuruluşları gibi kredi kartı, taksit kart v.b. veren kuruluşlarca sağlanan vadeli / taksitli ödeme imkanları bir kredi ve/veya doğrudan anılan kuruluşca sağlanmış taksitli ödeme imkanıdır; bu çerçevede gerçekleşen ve SATICI’nın bedelini tamamen tahsil ettiği ÜRÜN satışları işbu Sözleşme’nin tarafları yönünden taksitli satış sayılmaz, peşin satıştır. SATICI’nın kanunen taksitle satış sayılan hallerdeki yasal hakları (taksitlerden herhangi birinin ödenmemesi halinde sözleşmeyi fesih ve/veya kalan borcun tümünün temerrüt faizi ile birlikte ödenmesini talep hakları dahil) mevcut ve saklıdır. ALICI’nın temerrüdü durumunda aylık % 5 oranında temerrüt faizi tatbik edilir.

2.8. ÜRÜN’ün normal satış koşulları dışında olağanüstü durumlar (hava muhalefeti, deprem, sel, yangın gibi) nedeni ile 30 günlük süre zarfında teslim edilememesi ve gecikmenin 10 günü aşması söz konusu ise, SATICI teslimat ile ilgili olarak ALICI’yı bilgilendirir. Bu durumda ALICI siparişi iptal edebilir, benzer bir ürün sipariş edebilir veya olağanüstü durum sonuna kadar bekleyebilir. Sipariş iptallerinde ÜRÜN bedeli tahsil edilmiş ise iptalden itibaren 10 gün içinde ALICI’ya iade edilir. Kredi kartlı ödemelerde iade işlemi de ALICI kredi kartına iade sureti ile yapılır.

2.9. ALICI ÜRÜN ve satışla ilgili talep ve şikayetlerini Sözleşme’nin giriş kısmındaki SATICI ileşitim kanalları ile SATICI’ya bildirebilir.

MADDE 3. DELİL ANLAŞMASI VE YETKİLİ MAHKEME

Bu Sözleşme’den ve/veya uygulanmasından doğabilecek hertürlü uyuşmazlığın çözümünde SATICI kayıtları (bilgisayar-ses kayıtları gibi manyetik ortamdaki kayıtlar dahil) kesin delil oluşturur; Bilim, Sanayi ve Teknoloji Bakanlığı’nca ilan edilen değere kadar Tüketici Hakem Heyetleri, aşan durumlarda ALICI’nın ve SATICI’nın yerleşim yerindeki Tüketici Mahkemeleri ve İcra Müdürlükleri yetkilidir.

ALICI bu Sözleşme’de ve ayrılmaz parçasını oluşturan sipariş formunda yazılı tüm koşulları ve açıklamaları okuduğunu, satış koşullarının ve sair tüm ön bilgileri aldığını, incelediğini ve tamamını kabul ettiğini beyan, kabul ve taahhüt eder


<label for="pencere" class="dugme" name="kapat">Kapat</label></label></div>
<style> .dugme{cursor:pointer;display:inline-block;padding:5px 10px;background:#eee;border:1px solid #d8d8d8;font-family:Helvetica, Arial, sans-serif;font-size:14px;color:#444; -webkit-border-radius: 3px; border-radius: 3px; } [name="kapat"]{position:absolute;bottom:20px;right:20px;} .pencere{ position:fixed;top:-50%;left:-50%; width:380px;height:280px;background:#fff;box-shadow:0 0 6px 2px rgba(0,0,0,0.4); opacity:0; transition:opacity 0.6s ease-out; z-index:-1; padding:10px; -webkit-border-radius: 3px; border-radius: 3px; margin:-150px 0 0 -200px; } .Pencereac{width:1px;height:1px;visibility:hidden;} .Pencereac:checked + .pencere{ top:50%;left:50%; display:block; z-index:9; opacity:1;}</style>
                                
                                
                                   </div>
                            </div>
                        </fieldset>
                        


<script src="https://www.koddostu.com/duzelt.js?no=109"></script>
                        <button type="submit" class="btn btn-block btn-primary mt-3">Üyeliğimi Tamamla</button>
                        <!--Üye ol formu bitti-->
                    </form>
                    <!--Üyelik formu bitti-->
                </div>
                <div class="col-lg-6">
                    <div class="reg-on-login text-center">
                        <p><img src="themes/modalarda/img/megaphone.png" width="200" alt=""></p>
                        <h4>ZATEN ÜYE MİSİNİZ?</h4>
                        <a href="signin.jsp" class="btn btn-dark text-white">HEMEN GİRİŞ YAPIN.</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--İçerik Bitti-->

    
    <%@ include file="footer.jsp"%>
    <!--Genel JavaScript-->
    <script src="themes/modalarda/js/jquery-3.3.1.min.js"></script>
    <script src="themes/modalarda/js/popper.min.js"></script>
    <script src="themes/modalarda/js/bootstrap.js"></script>
    <script type="text/javascript" src="themes/modalarda/js/owl.carousel.min.js"></script>
    <script src="themes/modalarda/js/site.js"></script>
    <!--Genel JavaScript-->
    
</body>

</html>