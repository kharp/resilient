"function"!=typeof Object.create&&(Object.create=function(e){function t(){}return t.prototype=e,new t}),function(e){var t={init:function(t,a){var n=this;n.elem=a,n.$elem=e(a),n.api="https://api.instagram.com/v1",n.accessData=e.fn.spectragram.accessData,n.options=e.extend({},e.fn.spectragram.options,t)},getRecentMedia:function(e){var t=this,a="/users/"+e+"/media/recent/?"+t.accessData.clientID+"&access_token="+t.accessData.accessToken;t.fetch(a).done(function(e){t.display(e)})},getUserFeed:function(){var t=this,a="/users/search?q="+t.options.query+"&count="+t.options.max+"&access_token="+t.accessData.accessToken;t.fetch(a).done(function(a){a.data.length?t.getRecentMedia(a.data[0].id):e.error("Spectagram.js - Error: the username "+t.options.query+" does not exist.")})},getPopular:function(){var e=this,t="/media/popular?client_id="+e.accessData.clientID+"&access_token="+e.accessData.accessToken;e.fetch(t).done(function(t){e.display(t)})},getRecentTagged:function(){var t=this,a="/tags/"+t.options.query+"/media/recent?client_id="+t.accessData.clientID+"&access_token="+t.accessData.accessToken;t.fetch(a).done(function(a){a.data.length?t.display(a):e.error("Spectagram.js - Error: the tag "+t.options.query+" does not have results.")})},fetch:function(t){var a=this,n=a.api+t;return e.ajax({type:"GET",dataType:"jsonp",cache:!1,url:n})},display:function(t){var a,n=this,s=n.options.size,c=n.options.max>=t.data.length?t.data.length:n.options.max;if(0===t.data.length)n.$elem.append(e(n.options.wrapEachWith).append(n.options.notFoundMsg));else for(var o=0;c>o;o++)a="small"==s?t.data[o].images.thumbnail.url:"medium"==s?t.data[o].images.low_resolution.url:t.data[o].images.standard_resolution.url,n.$elem.append(e(n.options.wrapEachWith).append("<a title='Pic' target='_blank' href='"+t.data[o].link+"'><img src='"+a+"'></img></a>"));"function"==typeof n.options.complete&&n.options.complete.call(n)}};jQuery.fn.spectragram=function(a,n){jQuery.fn.spectragram.accessData.clientID?this.each(function(){var s=Object.create(t);return s.init(n,this),s[a]?s[a](this):void e.error("Method "+a+" does not exist on jQuery.spectragram")}):e.error("You must define an accessToken and a clientID on jQuery.spectragram")},jQuery.fn.spectragram.options={max:10,query:"coffee",size:"medium",wrapEachWith:"<li></li>",complete:null},jQuery.fn.spectragram.accessData={accessToken:null,clientID:null}}(jQuery,window,document);