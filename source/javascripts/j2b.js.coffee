window.Dialect = {} unless window.Dialect?
((d, $, document, window) ->
  win = $(window)

  trackPageView = (href) ->
    try
      console.log 'trackPageView', href
      _gaq.push ['_trackPageview', href]
    catch e

  trackEvent = (category, action, opt_label, opt_value, opt_noninteraction) ->
    try
      console.log 'trackEvent', category, action, opt_label, opt_value, opt_noninteraction
      _gaq.push ['_trackEvent', category, action, opt_label, opt_value, opt_noninteraction]
    catch e

  initNav = ->
    toc = $('.toc li')
    $('.header nav a[data-category]').on 'click', (e) ->
      e.preventDefault()
      category = $(this).attr('data-category')
      trackPageView('/' + category)
      trackEvent('nav', 'category', category)
      toc.css({opacity: 0.2}).filter('.' + category).css({opacity: 1})


    article = $('#article')
    return unless article and article.length > 0

    $(document).on 'pjax:start', (e) ->
      console.log 'pjax:start'
    $(document).on 'pjax:end', (e) ->
      console.log 'pjax:end, side'
      #article.slideDown()
    $(document).on 'pjax:error', (e) ->
      console.log 'pjax:error'
    $(document).on 'pjax:complete', (e) ->
      console.log 'pjax:complete'


    console.log 'initnav'
        
    $('.toc a').pjax '#article', {fragment: '#article-body'}

  initDebug = ->
    $(document).on 'keypress', (e) ->
      if e.which == 96
        $('html').toggleClass 'debug'



  init = ->
    # todo
    initDebug()
    initNav()
    $('body').removeClass 'preload'

  d.init = init

)(window.Dialect, jQuery, document, window)
jQuery(document).on 'ready', window.Dialect.init