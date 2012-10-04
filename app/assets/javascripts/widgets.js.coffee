Reviews.Widgets = do ->
  success = (form) ->
    (data, status, xhr) ->
      form.hide()
      $('#thanks').show()

  ajaxifyForm = (form) ->
    form.submit (e) ->
      $t = $(@)
      e.preventDefault()
      url = $t.attr('action')
      data = $t.serialize()
      $.post url, data, success(form)
  init: ->
    ajaxifyForm $('form#new_review')