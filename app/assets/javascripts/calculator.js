jQuery(document).ready(function($) {
  let productQuantity = '.product_quantity',
      fieldContainer = '.field-container',
      total = 'span.i-total';


  $(document).on('keyup', productQuantity, function() {
    var tax = $('#invoice_tax').val();
    if (isNaN(tax) || tax == 0) {
      tax = 0;
    } 
    var parent = $(this).parents(fieldContainer),
        quantity = $(this).val(),
        price = parent.children(3).children('.i-price').text(),
        priceTotalList = [],
        taxPercent = 0,
        balance = 0,
        totalBalance = 0;
    parent.children(4).children('.i-total').text(quantity * price);
    parent.children(4).children('.i-total').attr('value', quantity * price);
    $(fieldContainer).each(function(index, el) {
      var check = parseFloat($(this).children(4).children(total).text());
      if (!isNaN(check) && check != 0) {
        balance += check;
      }
    });
    taxPercent = balance * tax/100;
    totalBalance = balance + taxPercent;

    $('#invoice_balance').attr('value', totalBalance);
    $('span.balance').text('$' + totalBalance.toFixed(2));    
  });
  $(document).on('keyup', '#invoice_tax', function() {
    var tax = $(this).val(),
        taxPercent = 0.00,
        balance = 0,
        totalBalance = 0.00;
    if (isNaN(tax) || tax == 0) {
      tax = 0;
    }
    $(fieldContainer).each(function(index, el) {
      var check = parseFloat($(this).children(4).children(total).text());
      if (!isNaN(check) && check != 0) {
        balance += check;
      }
    });
    if (!isNaN(balance) && balance != 0) {
      taxPercent = parseFloat(balance) * tax/100;
      totalBalance = parseFloat(balance) + parseFloat(taxPercent);
      $('#invoice_balance').attr('value', totalBalance);
      $('span.balance').text('$' + totalBalance.toFixed(2));
    }
  });
});


