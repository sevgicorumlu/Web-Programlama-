// Ürün Fotoları
var postDetailImages = $('.post-details-photo-carousel');
postDetailImages.owlCarousel({
    items: 4,
    margin: 10,
    autoplay: false,
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
            items: 4
        }
    }
})

$('#pi-left').click(function(e) {
    e.preventDefault();
    postDetailImages.trigger('prev.owl.carousel');
});
$('#pi-right').click(function(e) {
    e.preventDefault();
    postDetailImages.trigger('next.owl.carousel');
});



//Büyük görseli değişimi
var bigImage = $('.post-big-photo a');
var bigImageTag = $('.post-big-photo a img');

//Büyük Görsel
if ((bigImage).is(":visible")) {
    bigImage.rebox();
}

// Owl'dan büyük görsele
$('.post-details-photo-carousel a').click(function(e) {
    e.preventDefault();
    bigImageTag.attr("src", $(this).attr("href"));
    bigImage.attr("href", $(this).attr("href"));
});