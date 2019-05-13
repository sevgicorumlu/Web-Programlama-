$(document).ready(function () {

  if ($(this).width() > '1281') {
    if ($(this).scrollTop() > 129) {
      $('.middle-header').slideUp("fast");
      $('.main-menu').css('top', '27px');
    } else if ($(this).scrollTop() < 129) {
      $('.middle-header').slideDown("fast");
      $('.main-menu').css('top', '96px');

    }
  }

  // Preloader fade-out
  $('.modalarda-preloader').fadeOut();

  // Font Awesome CSS Desteği
  window.FontAwesomeConfig = {
    searchPseudoElements: true
  };
  // Preloader
  $('.florya-preloader').fadeOut();

  var mToggle = $(".mm-toggle");
  var mClose = $(".close-mm-menu");
  var mMenu = $(".mm-menu");
  var bodyOverlay = $(".common-overlay");

  // Menüyü dökümanın yüksekliğine alma
  mMenu.css("height", $(document).height());

  // Mobil menü toggle
  mToggle.click(function (e) {
    e.preventDefault();
    bodyOverlay.fadeIn();
    $("html, body").scrollTop("0");
    mMenu.animate({
      left: "0px"
    }, 300);
  });

  var l1Toggle = $(".l1-menu-trigger");
  var l2Toggle = $(".l2-menu-trigger");

  var l1Submenu = $(".level1-menu");
  var l2Submenu = $(".level2-menu");

  // Bir alt menü
  l1Toggle.click(function (e) {
    e.preventDefault();
    $(this).next(l1Submenu).slideToggle(200);
  });

  l2Toggle.click(function (e) {
    e.preventDefault(e);
    $(this).next(l2Submenu).slideToggle(200);
  });

  bodyOverlay.add(mClose).click(function () {
    closeMenu(300);
  });

  // Menüyü kapat
  function closeMenu(speed) {
    bodyOverlay.fadeOut();
    mMenu.animate({
      left: "-110%"
    }, speed);
  }

  var floatingCart = $('.floating-cart');

  // Sepetim
  $('.my-cart-trigger').click(function (e) {
    e.preventDefault();
    bodyOverlay.fadeIn();
    floatingCart.css('right', '0');
    floatingCart.css('box-shadow', '-17px 0px 20px 0px #0000001a;')
  });

  bodyOverlay.click(function () {
    bodyOverlay.fadeOut();
    floatingCart.css('right', '-300px');
    floatingCart.css('box-shadow', 'none')
  });

  floatingCart.find('.cart-title i').click(function () {
    bodyOverlay.fadeOut();
    floatingCart.css('right', '-300px');
    floatingCart.css('box-shadow', 'none')
  });

  $(window).scroll(function () {
    if ($(this).width() < '1281') {
      if ($(this).scrollTop() > 129) {
        $('.search-area').slideUp(250);
      } else if ($(this).scrollTop() < 129) {
        $('.search-area').slideDown(250);
      }
    }

    if ($(this).width() > '1281') {
      if ($(this).scrollTop() > 129) {
        $('.middle-header').slideUp();
        $('.main-menu').css('top', '27px');
        $('.fixed-cart-trigger').css('right', '0')
      } else if ($(this).scrollTop() < 129) {
        $('.middle-header').slideDown();
        $('.main-menu').css('top', '96px');
        $('.fixed-cart-trigger').css('right', '-66px')
      }
    }
  });

  // Sidebar Akordiyon
  $('.sidebar-toggle').click(function (e) {
    e.preventDefault();

    var $this = $(this);

    if ($this.next().hasClass('show')) {
      $this.next().removeClass('show');
      $this.next().show();
      $this.find('i').removeClass('fa-chevron-down');
      $this.find('i').toggleClass('fa-chevron-up');
    } else {
      $this.parent().parent().find('li .inner').removeClass('show');
      $this.parent().parent().find('li .inner').slideUp(350);
      $this.next().toggleClass('show');
      $this.find('i').removeClass('fa-chevron-up');
      $this.find('i').toggleClass('fa-chevron-down');
      $this.next().hide();
    }
  });

  // Sepet Fonksiyonları
  /*
  var pList = $('.product-list');
    var emptyPlaceholder = $('.empty-product-list');
    var cTotal = $('.cart-total-price');
    emptyListCheck();

    $('.remove-cart-item').click(function () {
      // Öğe Sil
      $(this).parent(1).remove();
      emptyListCheck()
    });

    // Alışveriş Listesi Kontrolü
    function emptyListCheck() {
      if (pList.children().length == 0) {
        emptyPlaceholder.show();
        cTotal.text("0,00");
      } else {
        emptyPlaceholder.hide();
      }
    }
  */
  // Mobil Sekmeler
  $('.mobile-tab-select').on('change', function () {
    var tab_id = $(this).find(':selected').attr('data-tab');

    $('.tab-pane').removeClass('in active current');
    $("#" + tab_id).addClass('in active current');
  });
});

//sepet işlemleri
$('.artirazalt').on('click', function () {
    var id= $(this).attr('data-id');
    var quantity = $(this).val();
    $.ajax({
        type:'POST',
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
        },
        url:'/sepet/guncelle/' +  id,
        data:{quantity : quantity},
        success: function ($result) {
            window.location.href='/sepet';
        }
    });
});
function stockControl() {
    $.ajax({
        type: "post",
        headers: {
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
        },
        url: "/ajax/basketStockControl",
        data: '',
        dataType: 'text',
        success: function (response) {
            if (response === 'false') {
                $('#div-alert').html('<div class="container"><div class="alert alert-danger  text-center">Sepetinizde Stoklarımızda Bulunmayan Ürün Vardır Lütfen Önce Sepetinizi Güncelleyiniz</div></div>');
                $(window).scrollTop(0);
                return false;
            } else {
                window.location = "/payment";
            }
        }
    });
}

