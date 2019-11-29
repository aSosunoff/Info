```javascript
$.get('/', function (data) {
  var t = data.match(/(images\/portfolio).*?.jpg/gi);
  var a = [];
  t.forEach(function (item, i, t) {
    a.push('http://repnitskaya.ru/' + item);
  });
  a.forEach(function (item, i, a) {
     var aTag = document.createElement("a");
      aTag.download = item;
      aTag.target = '_blank';
      aTag.href = item;
      aTag.click();
  });
});
	
(function(){
	var block = document.getElementById('allsizes-photo'),
		img = block.getElementsByTagName('img')[0],
		src = img.getAttribute('src');
		
	var aTag = document.createElement('a');
      aTag.download = src;
      //aTag.target = '_blank';
      aTag.href = src;
	  document.body.appendChild(aTag);
      aTag.click();
})()

(function(){
	var img = document.getElementsByClassName('zoom-large')[0],
		src = img.getAttribute('src');
		
	var aTag = document.createElement('a');
      aTag.download = src;
      //aTag.target = '_blank';
      aTag.href = src;
	  document.body.appendChild(aTag);
      aTag.click();
})()
```