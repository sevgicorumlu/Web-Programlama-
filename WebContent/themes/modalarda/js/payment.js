// Adtorium E-Ticaret Yazılımı Ödeme Fonksiyonları Js Dosyası
// Sürüm 0.0.1 - © 2018 Adtorium

$(document).ready(function () {

    // Dil verilerini atayalım
    var wizardBack = $('.wizard-back');
    var wizardNext = $('.wizard-next');
    var userCheckboxes = $('.user-checkboxes');

    wizardNext.text(window.langStrings.saveButton);
    wizardBack.text(window.langStrings.orderStepBack);
    wizardNext.text(window.langStrings.saveButton);

    wizardBack.addClass('d-none'); // Geri butonunu gizle
    userCheckboxes.hide(); // Kullanıcı checkboxlarını gizle

    // --- SİHİRBAZ EKLENTİSİ  ---
    var paymentWizard = $("#wizard").steps({
        headerTag: "h3",
        bodyTag: "section",
        startIndex: 0,
        transitionEffect: "none",
        autoFocus: true,
        enableKeyNavigation: false,
        enablePagination: false,
        enableFinishButton: false,
        onStepChanging: function (event, currentIndex, newIndex) {
            currentStepIndex = newIndex;
            return true
        }
    });

    var currentStepIndex = 0;

    // Adım İşlemleri
    wizardNext.click(function () {

        // 1. Adım
        if (currentStepIndex === 0) {
            wizardBack.addClass('d-none');
            wizardNext.text(window.langStrings.saveButton);

            // Kargo Metodu Kontrolü
            if ($('input[name=shipping_method]:checked').length <= 0) {
                swal({
                    title: window.langStrings.errorText,
                    text: window.langStrings.selectCargoLabel,
                    type: 'error',
                    confirmButtonText: window.langStrings.okButton
                });
            } else {
                wizardNext.prop('disabled', true); // Sonraki butonunu pasif et
                wizardNext.text(window.langStrings.completeOrder);
                wizardBack.removeClass('d-none');
                wizardBack.show();
                userCheckboxes.show(); // Kullanıcı checkboxlarını göster
                paymentWizard.steps("next");
            }
        }
        // 2. Adım
        if (currentStepIndex === 1) {
            // Eğer İleri butonu aktise
            if (wizardNext.is(":disabled") === false) {
                paymentWizard.steps("next");
            }
        }

        // 3. Adım (son)
        if (currentStepIndex === 2) {
            alert('işlemler başladı');
            wizardBack.hide();
            wizardNext.hide();
            userCheckboxes.hide();
        }
    });

    // Önceki Adım
    wizardBack.click(function () {
        $('#wizard').steps('previous');

        if (currentStepIndex === 0) {
            wizardBack.addClass('d-none');
            wizardNext.text(window.langStrings.saveButton);
            wizardNext.prop('disabled', false);
            userCheckboxes.hide()
        }
    });

    // Checkboxların ikisi de seçiliyse ileri butonunu aktif et

    $('#c_mesafeli, #c_ob').change(function () {
        checkCheckboxes()
    });

    function checkCheckboxes() {
        var boxes = $('#c_mesafeli, #c_ob');
        if (boxes.length === boxes.filter(':checked').length) {
            wizardNext.prop('disabled', false)
        } else {
            wizardNext.prop('disabled', true)
        }
    }

    // --- SİHİRBAZ EKLENTİSİ BİTTİ ---
    // Ödeme metodu yakalama
    $('.pay_tabs .nav-item a').click(function() {
        $('#payment_method').val($(this).attr('data-id'));
        var cargo_method = $('input:radio[name=shipping_method]:checked').val();
        var payment_method = $('input:radio[name=payment_method]:checked').val();
        $.ajax({
            type: "post",
            headers: {
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            url: "/ajax/cargoprice",
            data: {'cargo_id': cargo_method, 'payment_method': payment_method},
            dataType: 'json',
            success: function (response) {
                if (response.cargo_price)
                {
                    var cprice = response.cargo_price;
                } else {
                    var cprice = '0.00';
                }
                var html = '<div id="cargo_price"><strong class="text-muted">KARGO TUTARI</strong><h4 class="text-lg-right">' + cprice + ' TL</h4></div>';
                if($('#cargo_price').length)
                {
                    $('#cargo_price').html('<strong class="text-muted">KARGO TUTARI</strong><h4 class="text-lg-right">' + cprice + ' TL</h4>');
                } else {
                    $(html).insertBefore('#paymentTotal');
                }
                $('#pay_div').html(response.pay_div);
            }
        });
    });

    // Bireysel Fatura Adresi Seçiliyse
    $("#sbilling_type1").change(function () {
        if ($(this).is(':checked')) {
            $('#billing_type').hide()
        }
    });

    // Kurumsal Fatura Adresi Seçiliyse
    $("#sbilling_type2").change(function () {
        if ($(this).is(':checked')) {
            $('#billing_type').show()
        }
    });

    // Fatura ve Teslimat Adresi Aynı Seçiliyse
    $("#commonBillDeliveryAddress").change(function () {
        if ($(this).is(':checked')) {
            $('#deliveryAddress').prop('disabled', true);
            $('#btnAddNewDeliveryAddress').prop('disabled', true);
            $('.delivery-address-container').addClass('low-opacity');
        } else if ($(this).is(':checked') === false) {
            $('#deliveryAddress').prop('disabled', false);
            $('#btnAddNewDeliveryAddress').prop('disabled', false);
            $('.delivery-address-container').removeClass('low-opacity');
        }
    });

    // Kredi Kartı Input Mask
    $("input[name*='card_number']").mask('0000 0000 0000 0000');
    $("input[name*='card_cvc']").mask('0000');

    // Sabit sağ taraf
    $(window).scroll(function () {
        if ($(this).width() > '1281') {
            $(window).scroll(function () {
                if ($(window).scrollTop() > 120) {
                    $('.payment-sidebar-container').addClass('fixed-p-sidebar');
                } else {
                    $('.payment-sidebar-container').removeClass('fixed-p-sidebar');
                }
            });
        }
    });

});