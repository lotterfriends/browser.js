(function() {
  var _find;

  browser.isOpera = function() {
    return !!window.opera || _find(' OPR/') >= 0;
  };

  browser.isFirefox = function() {
    return typeof InstallTrigger !== "undefined" && InstallTrigger !== null;
  };

  browser.isSafari = function() {
    return Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') !== -1;
  };

  browser.isChrome = function() {
    return !!window.chrome && !browser.isOpera();
  };

  browser.isStockAndroidBrowser = function() {
    return _find('534.30') && _find('android');
  };

  _find = function(needle) {
    return _user_agent.indexOf(needle.toLowerCase()) !== -1;
  };

}).call(this);
