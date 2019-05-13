$(document).ready(function () {
  // Ürün Görselleri
  var productImages = $('.other-product-images ul');
  productImages.owlCarousel({
    items: 3,
    margin: 15,
    autoplay: true,
    loop: false,
    responsiveClass: true,
    onInitialized: counter,
    onTranslated: counter,
    responsive: {
      0: {
        items: 4
      },
      480: {
        items: 4
      },
      768: {
        items: 4
      },
      1000: {
        items: 5
      }
    }
  });

  $('.owl-pr').click(function (e) {
    e.preventDefault();
    productImages.trigger('prev.owl.carousel');
  });
  $('.owl-ne').click(function (e) {
    e.preventDefault();
    productImages.trigger('next.owl.carousel');
  });

  // Öğe sayısı 4'ten küçükse kontrolleri gizle
  function counter(event) {
    var element = event.target;
    var items = event.item.count;
    if (items < 4) {
      $('.product-images-container .owl-controls').hide();
    }
  }

  // Büyük Görsel Zoom
  $(".xzoom").xzoom({
    tint: false,
    Xoffset: 15,
    lensShape: 'circle',
    position: 'lens'
  });

  $('[data-fancybox]').fancybox({
    keyboard: true,
    infobar: true,
    buttons: [
      'slideShow',
      'fullScreen',
      'thumbs',
      //'download',
      //'zoom',
      'close'
    ],
    lang: 'tr',
    i18n: {
      'tr': {
        CLOSE: 'Kapat',
        NEXT: 'Sonraki',
        PREV: 'Önceki',
        ERROR: 'İçerik yüklenemedi. <br/> Lütfen tekrar deneyin.',
        PLAY_START: 'Slaytı başlat',
        PLAY_STOP: 'Slaytı duraklat',
        FULL_SCREEN: 'Tam ekran',
        THUMBS: 'Küçük resimler',
        DOWNLOAD: 'İndir',
        SHARE: 'Paylaş',
        ZOOM: 'Yakınlaştır'
      }
    }
  });

  // Büyük Görsel Değiştirme
  var bigImage = $('.big-product-image');

  $('.other-product-images a').click(function (e) {
    e.preventDefault();
    bigImage.find("img").attr("src", $(this).attr("href")); // src'i değiştir
    console.info($(this).attr("href"));
    bigImage.find("a").attr("href", $(this).attr("href")); //  href'i değiştir
  });

  // Masaüstü Beden Seçimi
  $('.productSizeListDesk .dropdown-item').click(function () {
    $('.deskProductSizeBut').html($(this).attr('data-title')+': ' + $(this).attr('data-size'));
    $('#dropdown-'+$(this).attr('data-num')).find('input').val($(this).attr('data-id'));
  });

  // Mobil Beden Seçimi
  $('.productSizeListMob .dropdown-item').click(function () {
    $('.mobProductSizeBut').html($(this).attr('data-title')+': ' + $(this).attr('data-size'));
    $('#productSizeMobVal').val($(this).attr('data-size'));
  });
});

// Yorumlar Sekmesine geç
function switchCommentsTab() {
  $('.nav-tabs a[href="#comments"]').tab('show');
}