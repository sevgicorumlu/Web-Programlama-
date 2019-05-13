// Adtorium Yönetim Paneli
// Adtorium Yönetim Paneli Genel JavaScript dosyası
// Adtorium.com tarafından el değmeden hazırlanmıştır.
// ---------------------------------------------------
$(document).ready(function () {
  var mToggle = $(".mobile-header .mm-toggle");
  var mClose = $(".close-mm-menu");
  var mMenu = $(".mm-menu");
  var bodyOverlay = $(".overlay");

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

  // Tooltip
  $('[data-toggle="tooltip"]').tooltip();


  // + - İkonları
  function toggleIcon(e) {
    $(e.target)
      .prev('.card-header')
      .find(".more-less")
      .toggleClass('glyphicon-plus glyphicon-minus');
  }

  $('.menu-item').on('hidden.bs.collapse', toggleIcon);
  $('.menu-item').on('shown.bs.collapse', toggleIcon);

  //Sol taraf gizleme
  $('.sidebar-toggle').click(function () {
    $('.sidebar').toggleClass('sidebar-switch');
  });

  // $('.sidebar').hover(function () {
  //  if ($(this).hasClass('sidebar-switch')){
  //    $('.sidebar').toggleClass('sidebar-switch');
  //   }
  // });

  // Sekmeler
  $('.tabgroup > div').hide();
  $('.tabgroup > div:first-of-type').show();
  $('.tabs a').click(function (e) {
    e.preventDefault();
    var $this = $(this),
      tabgroup = '#' + $this.parents('.tabs').data('tabgroup'),
      others = $this.closest('li').siblings().children('a'),
      target = $this.attr('href');
    others.removeClass('active');
    $this.addClass('active');
    $(tabgroup).children('div').hide();
    $(target).show();

  });

  // Mobil Sekmeler
  $('.mobile-select').on('change', function (e) {
    var id = $(this).val();
    $('a[href="' + id + '"]').tab('show');
  });

    // Mobil Sekmeler
  $('#activiyType').on('change', function (e) {
    var id = $(this).val();
    $(".home-stats-card .tab-pane").removeClass("active");
    $('.home-stats-card .tab-content ' + id).addClass("active");
  });




  // Karakter Sayıcı
  $(".char-textarea").on("input", function (event) {
    checkTextAreaMaxLength(this, event);
  });


  function checkTextAreaMaxLength(textBox, e) {
    var maxLength = parseInt($(textBox).data("length"));


    if (!checkSpecialKeys(e)) {
      if (textBox.value.length > maxLength - 1) textBox.value = textBox.value.substring(0, maxLength);
    }

    $(textBox).next(".char-count").html(maxLength - textBox.value.length);
    return true;
  }

  function checkSpecialKeys(e) {
    if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
      return false;
    else
      return true;
  }

  // Panel + -

  // Popover
  $(function () {
    $('[data-toggle="popover"]').popover()
  })

}); 