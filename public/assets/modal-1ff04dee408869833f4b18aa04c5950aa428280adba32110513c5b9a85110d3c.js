$(function() {
  var modal_holder_selector = '.modal-container',
  partial_holder            = '.partial-container',
  fadeScreen                = '.fade-screen.-modal.-external',
  visibleClass              = 'is-visible';

  $('.close').click(function() {
    $(fadeScreen).removeClass(visibleClass);
  });
  $(document).on('click', '.InvoqueModal', function() {
    var location;
    location = $(this).attr('href');
    if ($('#new_invoice').length && $(this).hasClass('partial') == false) {
      $(fadeScreen).addClass(visibleClass);
      $.get(location, function(data) {
        return $(modal_holder_selector).html(data).removeClass('hidden');
      });
    } else {
      $(fadeScreen).removeClass(visibleClass);
      $(modal_holder_selector).empty();
      $.get(location, function(data) {
        return $(partial_holder).html(data).removeClass('hidden');
      });
    }
    return false;
  });
  return $(document).on('ajax:success ajax:error', '.remote_form', function(event, data, status, xhr) {
    console.log(event);
    console.log(data);
    console.log(status);
    console.log(xhr);

    var classes = $(this).attr('class').split(' ');
    var formClass;
    formClass = classes[4];
    if (status == 'success') {
      var dataJson = $.parseJSON(data);
      switch (formClass){
        case 'product':
          if ($('#new_invoice').length) {
            $('.add_product').click();
            var fields = $('.fields');
            setTimeout(function(){
              fields.last().children('.product-select').append($('<option>', {
                value: dataJson[0].id,
                text: dataJson[0].name
              })).val(dataJson[0].id);
            }, 500);
            $(fadeScreen).removeClass(visibleClass);
          } else {
            $('a[href="/products"]').trigger('click');
            $(partial_holder).empty().addClass('hidden');
          }
        case 'client':
          if ($('#new_invoice').length) {
            var select = $('#invoice_client_id');
            setTimeout(function(){
              select.append($('<option>', {
                value: dataJson[0].id,
                text: dataJson[0].name
              })).val(dataJson[0].id);
            }, 500);
            $(fadeScreen).removeClass(visibleClass);
          } else {
            $('a[href="/clients"]').trigger('click');
            $(partial_holder).empty().addClass('hidden');
          }
      }
    } else {
      if (formClass == 'product' && $('#new_invoice').length || formClass == 'client' && $('#new_invoice').length) {
        return $(modal_holder_selector).html(data.responseText);
      } else {
        return $(partial_holder).html(data.responseText);
      }
    }
    return false;
  });
});
