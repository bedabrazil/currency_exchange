$(document).ready ->
  $('form').on 'click', '.btn-exchange', ->
    form = $(this).closest('form')
    if form.attr('action') == '/exchange'
      $.ajax form.attr('action'),
        type: form.attr('method')
        dataType: 'json'
        data: {
          currency: $('#currency').val(),
          currency_destination: $('#currency_destination', form).val(),
          quantity: $('#quantity').val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, text, jqXHR) ->
          $('#result').val(data.value)