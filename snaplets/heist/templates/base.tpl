<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="My portfolio site, built on Haskell Snap, Angularjs, and Twitter Bootstrap">
    <meta name="viewport" content="width=device-width">
    <title>Snap web server</title>
    <link rel="stylesheet" href="styles/main.css">
  </head>
  <body ng-app="tchenApp">
    <div id="content" ng-view>

      <apply-content/>
    </div>
    <script src="components/requirejs/require.js"></script>

    <!-- build:js scripts/scripts.js -->
    <script src="scripts/app.js"></script>
    <!-- endbuild -->

    <script>
      var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
      (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
      g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
      s.parentNode.insertBefore(g,s)}(document,'script'));
    </script>
  </body>
</html>
