window.MTIProjectId='fb855e8b-63d4-4a63-a997-62c1a35ca3ab'
do ->
  mtiTracking = document.createElement('script')
  mtiTracking.type='text/javascript'
  mtiTracking.async='true'
  mtiTracking.src='https://fast.fonts.net/t/trackingCode.js'
  (document.getElementsByTagName('body')[0] || document.getElementsByTagName('head')[0]).appendChild( mtiTracking )
  console.log('done!')
