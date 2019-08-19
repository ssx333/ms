// //移动端字体适配
// (function(win, doc) {
//   var h;
//   win.addEventListener('resize', function() {
//       clearTimeout(h);
//       h = setTimeout(setUnitA, 200);
//   }, false);
//   win.addEventListener('pageshow', function(e) {
//       if (e.persisted) {
//           clearTimeout(h);
//           h = setTimeout(setUnitA, 200);
//       }
//   }, false);
//   var setUnitA = function() {
//       var clientWidth=doc.documentElement.clientWidth;
//       if(clientWidth>320){clientWidth=320}
//       doc.documentElement.style.fontSize = clientWidth / 7.5 + 'px';
//   };
//   setUnitA();
// })(window, document);
