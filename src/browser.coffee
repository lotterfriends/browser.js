# Browser.js

window.device = {}
_user_agent = window.navigator.userAgent.toLowerCase()

browser.isOpera = ->
  !!window.opera || _find(' OPR/') >= 0

browser.isFirefox = ->
  InstallTrigger?

browser.isSafari = ->
  Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') isnt -1

browser.isChrome = ->
  !!window.chrome and not browser.isOpera()

browser.isStockAndroidBrowser = ->
  _find('534.30') and _find('android');

_find = (needle) ->
  _user_agent.indexOf(needle.toLowerCase()) isnt -1
