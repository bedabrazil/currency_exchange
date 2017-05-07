$(document).ready ->
  currency_left = $('#currency option')
  currency_right = $('#currency_destination option')

  $('form').on 'change', '#currency, #currency_destination', ->
    swapCoin()
    if $('#quantity').val()
      getConversion()
  $('form').on 'click', '.swap-arrow', ->
    currency_left_selected = $('#currency option:selected')
    currency_right_selected = $('#currency_destination option:selected')
    currency_left.each (i,e) ->
      if e.value == currency_right_selected.val()
        e.selected = true
        $('#addon-local').text(e.value)
    currency_right.each (i, e) ->
      if e.value == currency_left_selected.val()
        e.selected = true
        $('#addon-destination').text(e.value)
    if $('#quantity').val()
      getConversion()
  $('form').on 'blur', '#quantity', ->
    getConversion()
  getConversion = ->
    form = $('#exchange_form')
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
      return false
  swapCoin = ->
    currency_left_selected = $('#currency option:selected')
    currency_right_selected = $('#currency_destination option:selected')
    $('#addon-local').text(currency_left_selected.val())
    $('#addon-destination').text(currency_right_selected.val())
 
    
    