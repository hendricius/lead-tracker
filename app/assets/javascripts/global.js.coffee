$ ->
  $("a[rel^='prettyPhoto']").prettyPhoto({
    default_width: 500,
    default_height: 344,
    social_tools: "",
    show_title: false,
    keyboard_shortcuts: true
  })
  $('.button.free-quote').on('click', ->
    _gaq.push(['_trackPageview','/click_free_quote'])
    $('.contact_form #email').focus()
  )
