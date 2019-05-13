$(document).ready(function () {
  // Slider
  $('#main_slider').show().revolution({
    sliderLayout: 'auto',
    responsiveLevels: [1150, 960, 720, 500],
    gridwidth: [1150, 960, 720, 480],
    gridheight: [450, 450, 450, 450],
    keyboardNavigation: 'on',
    keyboard_direction: 'horizontal',
    mouseScrollNavigation: 'on',
    mouseScrollReverse: 'reverse',
    onHoverStop: 'on',
    navigation: {
      bullets: {
        enable: true,
        style: 'hesperiden'
      }
    }
  });

  // Ana Sayfa Kategori Carousel
  var homeCar = $('.special-products-for-you');
  homeCar.owlCarousel({
    items: 5,
    margin: 20,
    autoplay: true,
    loop: false,
    responsiveClass: true,
    responsive: {
      0: {
        items: 2
      },
      480: {
        items: 2
      },
      768: {
        items: 3
      },
      1000: {
        items: 5
      }
    }
  });

  $('#homeCarLeft').click(function (e) {
    e.preventDefault();
    homeCar.trigger('prev.owl.carousel');
  });
  $('#homeCarRight').click(function (e) {
    e.preventDefault();
    homeCar.trigger('next.owl.carousel');
  });
});