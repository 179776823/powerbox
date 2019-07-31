//     Underscore.js 1.4.1
//     http://underscorejs.org
//     (c) 2009-2012 Jeremy Ashkenas, DocumentCloud Inc.
//     Underscore may be freely distributed under the MIT license.
((function(){var a=this,b=a._,c={},d=Array.prototype,e=Object.prototype,f=Function.prototype,g=d.push,h=d.slice,i=d.concat,j=d.unshift,k=e.toString,l=e.hasOwnProperty,m=d.forEach,n=d.map,o=d.reduce,p=d.reduceRight,q=d.filter,r=d.every,s=d.some,t=d.indexOf,u=d.lastIndexOf,v=Array.isArray,w=Object.keys,x=f.bind,y=function(a){if(a instanceof y)return a;if(this instanceof y)this._wrapped=a;else return new y(a)};typeof exports!="undefined"?(typeof module!="undefined"&&module.exports&&(exports=module.exports=y),exports._=y):a._=y,y.VERSION="1.4.1";var z=y.each=y.forEach=function(a,b,d){if(m&&a.forEach===m)a.forEach(b,d);else if(a.length===+a.length){for(var e=0,f=a.length;e<f;e++)if(b.call(d,a[e],e,a)===c)return}else for(var g in a)if(y.has(a,g)&&b.call(d,a[g],g,a)===c)return};y.map=y.collect=function(a,b,c){var d=[];return n&&a.map===n?a.map(b,c):(z(a,function(a,e,f){d[d.length]=b.call(c,a,e,f)}),d)},y.reduce=y.foldl=y.inject=function(a,b,c,d){var e=arguments.length>2;if(o&&a.reduce===o)return d&&(b=y.bind(b,d)),e?a.reduce(b,c):a.reduce(b);z(a,function(a,f,g){e?c=b.call(d,c,a,f,g):(c=a,e=!0)});if(!e)throw new TypeError("Reduce of empty array with no initial value");return c},y.reduceRight=y.foldr=function(a,b,c,d){var e=arguments.length>2;if(p&&a.reduceRight===p)return d&&(b=y.bind(b,d)),arguments.length>2?a.reduceRight(b,c):a.reduceRight(b);var f=a.length;if(f!==+f){var g=y.keys(a);f=g.length}z(a,function(h,i,j){i=g?g[--f]:--f,e?c=b.call(d,c,a[i],i,j):(c=a[i],e=!0)});if(!e)throw new TypeError("Reduce of empty array with no initial value");return c},y.find=y.detect=function(a,b,c){var d;return A(a,function(a,e,f){if(b.call(c,a,e,f))return d=a,!0}),d},y.filter=y.select=function(a,b,c){var d=[];return q&&a.filter===q?a.filter(b,c):(z(a,function(a,e,f){b.call(c,a,e,f)&&(d[d.length]=a)}),d)},y.reject=function(a,b,c){var d=[];return z(a,function(a,e,f){b.call(c,a,e,f)||(d[d.length]=a)}),d},y.every=y.all=function(a,b,d){b||(b=y.identity);var e=!0;return r&&a.every===r?a.every(b,d):(z(a,function(a,f,g){if(!(e=e&&b.call(d,a,f,g)))return c}),!!e)};var A=y.some=y.any=function(a,b,d){b||(b=y.identity);var e=!1;return s&&a.some===s?a.some(b,d):(z(a,function(a,f,g){if(e||(e=b.call(d,a,f,g)))return c}),!!e)};y.contains=y.include=function(a,b){var c=!1;return t&&a.indexOf===t?a.indexOf(b)!=-1:(c=A(a,function(a){return a===b}),c)},y.invoke=function(a,b){var c=h.call(arguments,2);return y.map(a,function(a){return(y.isFunction(b)?b:a[b]).apply(a,c)})},y.pluck=function(a,b){return y.map(a,function(a){return a[b]})},y.where=function(a,b){return y.isEmpty(b)?[]:y.filter(a,function(a){for(var c in b)if(b[c]!==a[c])return!1;return!0})},y.max=function(a,b,c){if(!b&&y.isArray(a)&&a[0]===+a[0]&&a.length<65535)return Math.max.apply(Math,a);if(!b&&y.isEmpty(a))return-Infinity;var d={computed:-Infinity};return z(a,function(a,e,f){var g=b?b.call(c,a,e,f):a;g>=d.computed&&(d={value:a,computed:g})}),d.value},y.min=function(a,b,c){if(!b&&y.isArray(a)&&a[0]===+a[0]&&a.length<65535)return Math.min.apply(Math,a);if(!b&&y.isEmpty(a))return Infinity;var d={computed:Infinity};return z(a,function(a,e,f){var g=b?b.call(c,a,e,f):a;g<d.computed&&(d={value:a,computed:g})}),d.value},y.shuffle=function(a){var b,c=0,d=[];return z(a,function(a){b=y.random(c++),d[c-1]=d[b],d[b]=a}),d};var B=function(a){return y.isFunction(a)?a:function(b){return b[a]}};y.sortBy=function(a,b,c){var d=B(b);return y.pluck(y.map(a,function(a,b,e){return{value:a,index:b,criteria:d.call(c,a,b,e)}}).sort(function(a,b){var c=a.criteria,d=b.criteria;if(c!==d){if(c>d||c===void 0)return 1;if(c<d||d===void 0)return-1}return a.index<b.index?-1:1}),"value")};var C=function(a,b,c,d){var e={},f=B(b);return z(a,function(b,g){var h=f.call(c,b,g,a);d(e,h,b)}),e};y.groupBy=function(a,b,c){return C(a,b,c,function(a,b,c){(y.has(a,b)?a[b]:a[b]=[]).push(c)})},y.countBy=function(a,b,c){return C(a,b,c,function(a,b,c){y.has(a,b)||(a[b]=0),a[b]++})},y.sortedIndex=function(a,b,c,d){c=c==null?y.identity:B(c);var e=c.call(d,b),f=0,g=a.length;while(f<g){var h=f+g>>>1;c.call(d,a[h])<e?f=h+1:g=h}return f},y.toArray=function(a){return a?a.length===+a.length?h.call(a):y.values(a):[]},y.size=function(a){return a.length===+a.length?a.length:y.keys(a).length},y.first=y.head=y.take=function(a,b,c){return b!=null&&!c?h.call(a,0,b):a[0]},y.initial=function(a,b,c){return h.call(a,0,a.length-(b==null||c?1:b))},y.last=function(a,b,c){return b!=null&&!c?h.call(a,Math.max(a.length-b,0)):a[a.length-1]},y.rest=y.tail=y.drop=function(a,b,c){return h.call(a,b==null||c?1:b)},y.compact=function(a){return y.filter(a,function(a){return!!a})};var D=function(a,b,c){return z(a,function(a){y.isArray(a)?b?g.apply(c,a):D(a,b,c):c.push(a)}),c};y.flatten=function(a,b){return D(a,b,[])},y.without=function(a){return y.difference(a,h.call(arguments,1))},y.uniq=y.unique=function(a,b,c,d){var e=c?y.map(a,c,d):a,f=[],g=[];return z(e,function(c,d){if(b?!d||g[g.length-1]!==c:!y.contains(g,c))g.push(c),f.push(a[d])}),f},y.union=function(){return y.uniq(i.apply(d,arguments))},y.intersection=function(a){var b=h.call(arguments,1);return y.filter(y.uniq(a),function(a){return y.every(b,function(b){return y.indexOf(b,a)>=0})})},y.difference=function(a){var b=i.apply(d,h.call(arguments,1));return y.filter(a,function(a){return!y.contains(b,a)})},y.zip=function(){var a=h.call(arguments),b=y.max(y.pluck(a,"length")),c=new Array(b);for(var d=0;d<b;d++)c[d]=y.pluck(a,""+d);return c},y.object=function(a,b){var c={};for(var d=0,e=a.length;d<e;d++)b?c[a[d]]=b[d]:c[a[d][0]]=a[d][1];return c},y.indexOf=function(a,b,c){var d=0,e=a.length;if(c)if(typeof c=="number")d=c<0?Math.max(0,e+c):c;else return d=y.sortedIndex(a,b),a[d]===b?d:-1;if(t&&a.indexOf===t)return a.indexOf(b,c);for(;d<e;d++)if(a[d]===b)return d;return-1},y.lastIndexOf=function(a,b,c){var d=c!=null;if(u&&a.lastIndexOf===u)return d?a.lastIndexOf(b,c):a.lastIndexOf(b);var e=d?c:a.length;while(e--)if(a[e]===b)return e;return-1},y.range=function(a,b,c){arguments.length<=1&&(b=a||0,a=0),c=arguments[2]||1;var d=Math.max(Math.ceil((b-a)/c),0),e=0,f=new Array(d);while(e<d)f[e++]=a,a+=c;return f};var E=function(){};y.bind=function(a,b){var c,d;if(a.bind===x&&x)return x.apply(a,h.call(arguments,1));if(!y.isFunction(a))throw new TypeError;return d=h.call(arguments,2),c=function(){if(this instanceof c){E.prototype=a.prototype;var e=new E,f=a.apply(e,d.concat(h.call(arguments)));return Object(f)===f?f:e}return a.apply(b,d.concat(h.call(arguments)))}},y.bindAll=function(a){var b=h.call(arguments,1);return b.length==0&&(b=y.functions(a)),z(b,function(b){a[b]=y.bind(a[b],a)}),a},y.memoize=function(a,b){var c={};return b||(b=y.identity),function(){var d=b.apply(this,arguments);return y.has(c,d)?c[d]:c[d]=a.apply(this,arguments)}},y.delay=function(a,b){var c=h.call(arguments,2);return setTimeout(function(){return a.apply(null,c)},b)},y.defer=function(a){return y.delay.apply(y,[a,1].concat(h.call(arguments,1)))},y.throttle=function(a,b){var c,d,e,f,g,h,i=y.debounce(function(){g=f=!1},b);return function(){c=this,d=arguments;var j=function(){e=null,g&&(h=a.apply(c,d)),i()};return e||(e=setTimeout(j,b)),f?g=!0:(f=!0,h=a.apply(c,d)),i(),h}},y.debounce=function(a,b,c){var d,e;return function(){var f=this,g=arguments,h=function(){d=null,c||(e=a.apply(f,g))},i=c&&!d;return clearTimeout(d),d=setTimeout(h,b),i&&(e=a.apply(f,g)),e}},y.once=function(a){var b=!1,c;return function(){return b?c:(b=!0,c=a.apply(this,arguments),a=null,c)}},y.wrap=function(a,b){return function(){var c=[a];return g.apply(c,arguments),b.apply(this,c)}},y.compose=function(){var a=arguments;return function(){var b=arguments;for(var c=a.length-1;c>=0;c--)b=[a[c].apply(this,b)];return b[0]}},y.after=function(a,b){return a<=0?b():function(){if(--a<1)return b.apply(this,arguments)}},y.keys=w||function(a){if(a!==Object(a))throw new TypeError("Invalid object");var b=[];for(var c in a)y.has(a,c)&&(b[b.length]=c);return b},y.values=function(a){var b=[];for(var c in a)y.has(a,c)&&b.push(a[c]);return b},y.pairs=function(a){var b=[];for(var c in a)y.has(a,c)&&b.push([c,a[c]]);return b},y.invert=function(a){var b={};for(var c in a)y.has(a,c)&&(b[a[c]]=c);return b},y.functions=y.methods=function(a){var b=[];for(var c in a)y.isFunction(a[c])&&b.push(c);return b.sort()},y.extend=function(a){return z(h.call(arguments,1),function(b){for(var c in b)a[c]=b[c]}),a},y.pick=function(a){var b={},c=i.apply(d,h.call(arguments,1));return z(c,function(c){c in a&&(b[c]=a[c])}),b},y.omit=function(a){var b={},c=i.apply(d,h.call(arguments,1));for(var e in a)y.contains(c,e)||(b[e]=a[e]);return b},y.defaults=function(a){return z(h.call(arguments,1),function(b){for(var c in b)a[c]==null&&(a[c]=b[c])}),a},y.clone=function(a){return y.isObject(a)?y.isArray(a)?a.slice():y.extend({},a):a},y.tap=function(a,b){return b(a),a};var F=function(a,b,c,d){if(a===b)return a!==0||1/a==1/b;if(a==null||b==null)return a===b;a instanceof y&&(a=a._wrapped),b instanceof y&&(b=b._wrapped);var e=k.call(a);if(e!=k.call(b))return!1;switch(e){case"[object String]":return a==String(b);case"[object Number]":return a!=+a?b!=+b:a==0?1/a==1/b:a==+b;case"[object Date]":case"[object Boolean]":return+a==+b;case"[object RegExp]":return a.source==b.source&&a.global==b.global&&a.multiline==b.multiline&&a.ignoreCase==b.ignoreCase}if(typeof a!="object"||typeof b!="object")return!1;var f=c.length;while(f--)if(c[f]==a)return d[f]==b;c.push(a),d.push(b);var g=0,h=!0;if(e=="[object Array]"){g=a.length,h=g==b.length;if(h)while(g--)if(!(h=F(a[g],b[g],c,d)))break}else{var i=a.constructor,j=b.constructor;if(i!==j&&!(y.isFunction(i)&&i instanceof i&&y.isFunction(j)&&j instanceof j))return!1;for(var l in a)if(y.has(a,l)){g++;if(!(h=y.has(b,l)&&F(a[l],b[l],c,d)))break}if(h){for(l in b)if(y.has(b,l)&&!(g--))break;h=!g}}return c.pop(),d.pop(),h};y.isEqual=function(a,b){return F(a,b,[],[])},y.isEmpty=function(a){if(a==null)return!0;if(y.isArray(a)||y.isString(a))return a.length===0;for(var b in a)if(y.has(a,b))return!1;return!0},y.isElement=function(a){return!!a&&a.nodeType===1},y.isArray=v||function(a){return k.call(a)=="[object Array]"},y.isObject=function(a){return a===Object(a)},z(["Arguments","Function","String","Number","Date","RegExp"],function(a){y["is"+a]=function(b){return k.call(b)=="[object "+a+"]"}}),y.isArguments(arguments)||(y.isArguments=function(a){return!!a&&!!y.has(a,"callee")}),typeof /./!="function"&&(y.isFunction=function(a){return typeof a=="function"}),y.isFinite=function(a){return y.isNumber(a)&&isFinite(a)},y.isNaN=function(a){return y.isNumber(a)&&a!=+a},y.isBoolean=function(a){return a===!0||a===!1||k.call(a)=="[object Boolean]"},y.isNull=function(a){return a===null},y.isUndefined=function(a){return a===void 0},y.has=function(a,b){return l.call(a,b)},y.noConflict=function(){return a._=b,this},y.identity=function(a){return a},y.times=function(a,b,c){for(var d=0;d<a;d++)b.call(c,d)},y.random=function(a,b){return b==null&&(b=a,a=0),a+(0|Math.random()*(b-a+1))};var G={escape:{"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","/":"&#x2F;"}};G.unescape=y.invert(G.escape);var H={escape:new RegExp("["+y.keys(G.escape).join("")+"]","g"),unescape:new RegExp("("+y.keys(G.unescape).join("|")+")","g")};y.each(["escape","unescape"],function(a){y[a]=function(b){return b==null?"":(""+b).replace(H[a],function(b){return G[a][b]})}}),y.result=function(a,b){if(a==null)return null;var c=a[b];return y.isFunction(c)?c.call(a):c},y.mixin=function(a){z(y.functions(a),function(b){var c=y[b]=a[b];y.prototype[b]=function(){var a=[this._wrapped];return g.apply(a,arguments),M.call(this,c.apply(y,a))}})};var I=0;y.uniqueId=function(a){var b=I++;return a?a+b:b},y.templateSettings={evaluate:/<%([\s\S]+?)%>/g,interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};var J=/(.)^/,K={"'":"'","\\":"\\","\r":"r","\n":"n","\t":"t","\u2028":"u2028","\u2029":"u2029"},L=/\\|'|\r|\n|\t|\u2028|\u2029/g;y.template=function(a,b,c){c=y.defaults({},c,y.templateSettings);var d=new RegExp([(c.escape||J).source,(c.interpolate||J).source,(c.evaluate||J).source].join("|")+"|$","g"),e=0,f="__p+='";a.replace(d,function(b,c,d,g,h){f+=a.slice(e,h).replace(L,function(a){return"\\"+K[a]}),f+=c?"'+\n((__t=("+c+"))==null?'':_.escape(__t))+\n'":d?"'+\n((__t=("+d+"))==null?'':__t)+\n'":g?"';\n"+g+"\n__p+='":"",e=h+b.length}),f+="';\n",c.variable||(f="with(obj||{}){\n"+f+"}\n"),f="var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n"+f+"return __p;\n";try{var g=new Function(c.variable||"obj","_",f)}catch(h){throw h.source=f,h}if(b)return g(b,y);var i=function(a){return g.call(this,a,y)};return i.source="function("+(c.variable||"obj")+"){\n"+f+"}",i},y.chain=function(a){return y(a).chain()};var M=function(a){return this._chain?y(a).chain():a};y.mixin(y),z(["pop","push","reverse","shift","sort","splice","unshift"],function(a){var b=d[a];y.prototype[a]=function(){var c=this._wrapped;return b.apply(c,arguments),(a=="shift"||a=="splice")&&c.length===0&&delete c[0],M.call(this,c)}}),z(["concat","join","slice"],function(a){var b=d[a];y.prototype[a]=function(){return M.call(this,b.apply(this._wrapped,arguments))}}),y.extend(y.prototype,{chain:function(){return this._chain=!0,this},value:function(){return this._wrapped}}),typeof define=="function"&&define.amd&&define("underscore",function(){return y})})).call(this);
//   Backbone.js 1.1.2
(function(t,e){if(typeof define==="function"&&define.amd){define(["underscore","jquery","exports"],function(i,r,s){t.Backbone=e(t,s,i,r)})}else if(typeof exports!=="undefined"){var i=require("underscore");e(t,exports,i)}else{t.Backbone=e(t,{},t._,t.jQuery||t.Zepto||t.ender||t.$)}})(this,function(t,e,i,r){var s=t.Backbone;var n=[];var a=n.push;var o=n.slice;var h=n.splice;e.VERSION="1.1.2";e.$=r;e.noConflict=function(){t.Backbone=s;return this};e.emulateHTTP=false;e.emulateJSON=false;var u=e.Events={on:function(t,e,i){if(!c(this,"on",t,[e,i])||!e)return this;this._events||(this._events={});var r=this._events[t]||(this._events[t]=[]);r.push({callback:e,context:i,ctx:i||this});return this},once:function(t,e,r){if(!c(this,"once",t,[e,r])||!e)return this;var s=this;var n=i.once(function(){s.off(t,n);e.apply(this,arguments)});n._callback=e;return this.on(t,n,r)},off:function(t,e,r){var s,n,a,o,h,u,l,f;if(!this._events||!c(this,"off",t,[e,r]))return this;if(!t&&!e&&!r){this._events=void 0;return this}o=t?[t]:i.keys(this._events);for(h=0,u=o.length;h<u;h++){t=o[h];if(a=this._events[t]){this._events[t]=s=[];if(e||r){for(l=0,f=a.length;l<f;l++){n=a[l];if(e&&e!==n.callback&&e!==n.callback._callback||r&&r!==n.context){s.push(n)}}}if(!s.length)delete this._events[t]}}return this},trigger:function(t){if(!this._events)return this;var e=o.call(arguments,1);if(!c(this,"trigger",t,e))return this;var i=this._events[t];var r=this._events.all;if(i)f(i,e);if(r)f(r,arguments);return this},stopListening:function(t,e,r){var s=this._listeningTo;if(!s)return this;var n=!e&&!r;if(!r&&typeof e==="object")r=this;if(t)(s={})[t._listenId]=t;for(var a in s){t=s[a];t.off(e,r,this);if(n||i.isEmpty(t._events))delete this._listeningTo[a]}return this}};var l=/\s+/;var c=function(t,e,i,r){if(!i)return true;if(typeof i==="object"){for(var s in i){t[e].apply(t,[s,i[s]].concat(r))}return false}if(l.test(i)){var n=i.split(l);for(var a=0,o=n.length;a<o;a++){t[e].apply(t,[n[a]].concat(r))}return false}return true};var f=function(t,e){var i,r=-1,s=t.length,n=e[0],a=e[1],o=e[2];switch(e.length){case 0:while(++r<s)(i=t[r]).callback.call(i.ctx);return;case 1:while(++r<s)(i=t[r]).callback.call(i.ctx,n);return;case 2:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a);return;case 3:while(++r<s)(i=t[r]).callback.call(i.ctx,n,a,o);return;default:while(++r<s)(i=t[r]).callback.apply(i.ctx,e);return}};var d={listenTo:"on",listenToOnce:"once"};i.each(d,function(t,e){u[e]=function(e,r,s){var n=this._listeningTo||(this._listeningTo={});var a=e._listenId||(e._listenId=i.uniqueId("l"));n[a]=e;if(!s&&typeof r==="object")s=this;e[t](r,s,this);return this}});u.bind=u.on;u.unbind=u.off;i.extend(e,u);var p=e.Model=function(t,e){var r=t||{};e||(e={});this.cid=i.uniqueId("c");this.attributes={};if(e.collection)this.collection=e.collection;if(e.parse)r=this.parse(r,e)||{};r=i.defaults({},r,i.result(this,"defaults"));this.set(r,e);this.changed={};this.initialize.apply(this,arguments)};i.extend(p.prototype,u,{changed:null,validationError:null,idAttribute:"id",initialize:function(){},toJSON:function(t){return i.clone(this.attributes)},sync:function(){return e.sync.apply(this,arguments)},get:function(t){return this.attributes[t]},escape:function(t){return i.escape(this.get(t))},has:function(t){return this.get(t)!=null},set:function(t,e,r){var s,n,a,o,h,u,l,c;if(t==null)return this;if(typeof t==="object"){n=t;r=e}else{(n={})[t]=e}r||(r={});if(!this._validate(n,r))return false;a=r.unset;h=r.silent;o=[];u=this._changing;this._changing=true;if(!u){this._previousAttributes=i.clone(this.attributes);this.changed={}}c=this.attributes,l=this._previousAttributes;if(this.idAttribute in n)this.id=n[this.idAttribute];for(s in n){e=n[s];if(!i.isEqual(c[s],e))o.push(s);if(!i.isEqual(l[s],e)){this.changed[s]=e}else{delete this.changed[s]}a?delete c[s]:c[s]=e}if(!h){if(o.length)this._pending=r;for(var f=0,d=o.length;f<d;f++){this.trigger("change:"+o[f],this,c[o[f]],r)}}if(u)return this;if(!h){while(this._pending){r=this._pending;this._pending=false;this.trigger("change",this,r)}}this._pending=false;this._changing=false;return this},unset:function(t,e){return this.set(t,void 0,i.extend({},e,{unset:true}))},clear:function(t){var e={};for(var r in this.attributes)e[r]=void 0;return this.set(e,i.extend({},t,{unset:true}))},hasChanged:function(t){if(t==null)return!i.isEmpty(this.changed);return i.has(this.changed,t)},changedAttributes:function(t){if(!t)return this.hasChanged()?i.clone(this.changed):false;var e,r=false;var s=this._changing?this._previousAttributes:this.attributes;for(var n in t){if(i.isEqual(s[n],e=t[n]))continue;(r||(r={}))[n]=e}return r},previous:function(t){if(t==null||!this._previousAttributes)return null;return this._previousAttributes[t]},previousAttributes:function(){return i.clone(this._previousAttributes)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=this;var r=t.success;t.success=function(i){if(!e.set(e.parse(i,t),t))return false;if(r)r(e,i,t);e.trigger("sync",e,i,t)};q(this,t);return this.sync("read",this,t)},save:function(t,e,r){var s,n,a,o=this.attributes;if(t==null||typeof t==="object"){s=t;r=e}else{(s={})[t]=e}r=i.extend({validate:true},r);if(s&&!r.wait){if(!this.set(s,r))return false}else{if(!this._validate(s,r))return false}if(s&&r.wait){this.attributes=i.extend({},o,s)}if(r.parse===void 0)r.parse=true;var h=this;var u=r.success;r.success=function(t){h.attributes=o;var e=h.parse(t,r);if(r.wait)e=i.extend(s||{},e);if(i.isObject(e)&&!h.set(e,r)){return false}if(u)u(h,t,r);h.trigger("sync",h,t,r)};q(this,r);n=this.isNew()?"create":r.patch?"patch":"update";if(n==="patch")r.attrs=s;a=this.sync(n,this,r);if(s&&r.wait)this.attributes=o;return a},destroy:function(t){t=t?i.clone(t):{};var e=this;var r=t.success;var s=function(){e.trigger("destroy",e,e.collection,t)};t.success=function(i){if(t.wait||e.isNew())s();if(r)r(e,i,t);if(!e.isNew())e.trigger("sync",e,i,t)};if(this.isNew()){t.success();return false}q(this,t);var n=this.sync("delete",this,t);if(!t.wait)s();return n},url:function(){var t=i.result(this,"urlRoot")||i.result(this.collection,"url")||M();if(this.isNew())return t;return t.replace(/([^\/])$/,"$1/")+encodeURIComponent(this.id)},parse:function(t,e){return t},clone:function(){return new this.constructor(this.attributes)},isNew:function(){return!this.has(this.idAttribute)},isValid:function(t){return this._validate({},i.extend(t||{},{validate:true}))},_validate:function(t,e){if(!e.validate||!this.validate)return true;t=i.extend({},this.attributes,t);var r=this.validationError=this.validate(t,e)||null;if(!r)return true;this.trigger("invalid",this,r,i.extend(e,{validationError:r}));return false}});var v=["keys","values","pairs","invert","pick","omit"];i.each(v,function(t){p.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.attributes);return i[t].apply(i,e)}});var g=e.Collection=function(t,e){e||(e={});if(e.model)this.model=e.model;if(e.comparator!==void 0)this.comparator=e.comparator;this._reset();this.initialize.apply(this,arguments);if(t)this.reset(t,i.extend({silent:true},e))};var m={add:true,remove:true,merge:true};var y={add:true,remove:false};i.extend(g.prototype,u,{model:p,initialize:function(){},toJSON:function(t){return this.map(function(e){return e.toJSON(t)})},sync:function(){return e.sync.apply(this,arguments)},add:function(t,e){return this.set(t,i.extend({merge:false},e,y))},remove:function(t,e){var r=!i.isArray(t);t=r?[t]:i.clone(t);e||(e={});var s,n,a,o;for(s=0,n=t.length;s<n;s++){o=t[s]=this.get(t[s]);if(!o)continue;delete this._byId[o.id];delete this._byId[o.cid];a=this.indexOf(o);this.models.splice(a,1);this.length--;if(!e.silent){e.index=a;o.trigger("remove",o,this,e)}this._removeReference(o,e)}return r?t[0]:t},set:function(t,e){e=i.defaults({},e,m);if(e.parse)t=this.parse(t,e);var r=!i.isArray(t);t=r?t?[t]:[]:i.clone(t);var s,n,a,o,h,u,l;var c=e.at;var f=this.model;var d=this.comparator&&c==null&&e.sort!==false;var v=i.isString(this.comparator)?this.comparator:null;var g=[],y=[],_={};var b=e.add,w=e.merge,x=e.remove;var E=!d&&b&&x?[]:false;for(s=0,n=t.length;s<n;s++){h=t[s]||{};if(h instanceof p){a=o=h}else{a=h[f.prototype.idAttribute||"id"]}if(u=this.get(a)){if(x)_[u.cid]=true;if(w){h=h===o?o.attributes:h;if(e.parse)h=u.parse(h,e);u.set(h,e);if(d&&!l&&u.hasChanged(v))l=true}t[s]=u}else if(b){o=t[s]=this._prepareModel(h,e);if(!o)continue;g.push(o);this._addReference(o,e)}o=u||o;if(E&&(o.isNew()||!_[o.id]))E.push(o);_[o.id]=true}if(x){for(s=0,n=this.length;s<n;++s){if(!_[(o=this.models[s]).cid])y.push(o)}if(y.length)this.remove(y,e)}if(g.length||E&&E.length){if(d)l=true;this.length+=g.length;if(c!=null){for(s=0,n=g.length;s<n;s++){this.models.splice(c+s,0,g[s])}}else{if(E)this.models.length=0;var k=E||g;for(s=0,n=k.length;s<n;s++){this.models.push(k[s])}}}if(l)this.sort({silent:true});if(!e.silent){for(s=0,n=g.length;s<n;s++){(o=g[s]).trigger("add",o,this,e)}if(l||E&&E.length)this.trigger("sort",this,e)}return r?t[0]:t},reset:function(t,e){e||(e={});for(var r=0,s=this.models.length;r<s;r++){this._removeReference(this.models[r],e)}e.previousModels=this.models;this._reset();t=this.add(t,i.extend({silent:true},e));if(!e.silent)this.trigger("reset",this,e);return t},push:function(t,e){return this.add(t,i.extend({at:this.length},e))},pop:function(t){var e=this.at(this.length-1);this.remove(e,t);return e},unshift:function(t,e){return this.add(t,i.extend({at:0},e))},shift:function(t){var e=this.at(0);this.remove(e,t);return e},slice:function(){return o.apply(this.models,arguments)},get:function(t){if(t==null)return void 0;return this._byId[t]||this._byId[t.id]||this._byId[t.cid]},at:function(t){return this.models[t]},where:function(t,e){if(i.isEmpty(t))return e?void 0:[];return this[e?"find":"filter"](function(e){for(var i in t){if(t[i]!==e.get(i))return false}return true})},findWhere:function(t){return this.where(t,true)},sort:function(t){if(!this.comparator)throw new Error("Cannot sort a set without a comparator");t||(t={});if(i.isString(this.comparator)||this.comparator.length===1){this.models=this.sortBy(this.comparator,this)}else{this.models.sort(i.bind(this.comparator,this))}if(!t.silent)this.trigger("sort",this,t);return this},pluck:function(t){return i.invoke(this.models,"get",t)},fetch:function(t){t=t?i.clone(t):{};if(t.parse===void 0)t.parse=true;var e=t.success;var r=this;t.success=function(i){var s=t.reset?"reset":"set";r[s](i,t);if(e)e(r,i,t);r.trigger("sync",r,i,t)};q(this,t);return this.sync("read",this,t)},create:function(t,e){e=e?i.clone(e):{};if(!(t=this._prepareModel(t,e)))return false;if(!e.wait)this.add(t,e);var r=this;var s=e.success;e.success=function(t,i){if(e.wait)r.add(t,e);if(s)s(t,i,e)};t.save(null,e);return t},parse:function(t,e){return t},clone:function(){return new this.constructor(this.models)},_reset:function(){this.length=0;this.models=[];this._byId={}},_prepareModel:function(t,e){if(t instanceof p)return t;e=e?i.clone(e):{};e.collection=this;var r=new this.model(t,e);if(!r.validationError)return r;this.trigger("invalid",this,r.validationError,e);return false},_addReference:function(t,e){this._byId[t.cid]=t;if(t.id!=null)this._byId[t.id]=t;if(!t.collection)t.collection=this;t.on("all",this._onModelEvent,this)},_removeReference:function(t,e){if(this===t.collection)delete t.collection;t.off("all",this._onModelEvent,this)},_onModelEvent:function(t,e,i,r){if((t==="add"||t==="remove")&&i!==this)return;if(t==="destroy")this.remove(e,r);if(e&&t==="change:"+e.idAttribute){delete this._byId[e.previous(e.idAttribute)];if(e.id!=null)this._byId[e.id]=e}this.trigger.apply(this,arguments)}});var _=["forEach","each","map","collect","reduce","foldl","inject","reduceRight","foldr","find","detect","filter","select","reject","every","all","some","any","include","contains","invoke","max","min","toArray","size","first","head","take","initial","rest","tail","drop","last","without","difference","indexOf","shuffle","lastIndexOf","isEmpty","chain","sample"];i.each(_,function(t){g.prototype[t]=function(){var e=o.call(arguments);e.unshift(this.models);return i[t].apply(i,e)}});var b=["groupBy","countBy","sortBy","indexBy"];i.each(b,function(t){g.prototype[t]=function(e,r){var s=i.isFunction(e)?e:function(t){return t.get(e)};return i[t](this.models,s,r)}});var w=e.View=function(t){this.cid=i.uniqueId("view");t||(t={});i.extend(this,i.pick(t,E));this._ensureElement();this.initialize.apply(this,arguments);this.delegateEvents()};var x=/^(\S+)\s*(.*)$/;var E=["model","collection","el","id","attributes","className","tagName","events"];i.extend(w.prototype,u,{tagName:"div",$:function(t){return this.$el.find(t)},initialize:function(){},render:function(){return this},remove:function(){this.$el.remove();this.stopListening();return this},setElement:function(t,i){if(this.$el)this.undelegateEvents();this.$el=t instanceof e.$?t:e.$(t);this.el=this.$el[0];if(i!==false)this.delegateEvents();return this},delegateEvents:function(t){if(!(t||(t=i.result(this,"events"))))return this;this.undelegateEvents();for(var e in t){var r=t[e];if(!i.isFunction(r))r=this[t[e]];if(!r)continue;var s=e.match(x);var n=s[1],a=s[2];r=i.bind(r,this);n+=".delegateEvents"+this.cid;if(a===""){this.$el.on(n,r)}else{this.$el.on(n,a,r)}}return this},undelegateEvents:function(){this.$el.off(".delegateEvents"+this.cid);return this},_ensureElement:function(){if(!this.el){var t=i.extend({},i.result(this,"attributes"));if(this.id)t.id=i.result(this,"id");if(this.className)t["class"]=i.result(this,"className");var r=e.$("<"+i.result(this,"tagName")+">").attr(t);this.setElement(r,false)}else{this.setElement(i.result(this,"el"),false)}}});e.sync=function(t,r,s){var n=T[t];i.defaults(s||(s={}),{emulateHTTP:e.emulateHTTP,emulateJSON:e.emulateJSON});var a={type:n,dataType:"json"};if(!s.url){a.url=i.result(r,"url")||M()}if(s.data==null&&r&&(t==="create"||t==="update"||t==="patch")){a.contentType="application/json";a.data=JSON.stringify(s.attrs||r.toJSON(s))}if(s.emulateJSON){a.contentType="application/x-www-form-urlencoded";a.data=a.data?{model:a.data}:{}}if(s.emulateHTTP&&(n==="PUT"||n==="DELETE"||n==="PATCH")){a.type="POST";if(s.emulateJSON)a.data._method=n;var o=s.beforeSend;s.beforeSend=function(t){t.setRequestHeader("X-HTTP-Method-Override",n);if(o)return o.apply(this,arguments)}}if(a.type!=="GET"&&!s.emulateJSON){a.processData=false}if(a.type==="PATCH"&&k){a.xhr=function(){return new ActiveXObject("Microsoft.XMLHTTP")}}var h=s.xhr=e.ajax(i.extend(a,s));r.trigger("request",r,h,s);return h};var k=typeof window!=="undefined"&&!!window.ActiveXObject&&!(window.XMLHttpRequest&&(new XMLHttpRequest).dispatchEvent);var T={create:"POST",update:"PUT",patch:"PATCH","delete":"DELETE",read:"GET"};e.ajax=function(){return e.$.ajax.apply(e.$,arguments)};var $=e.Router=function(t){t||(t={});if(t.routes)this.routes=t.routes;this._bindRoutes();this.initialize.apply(this,arguments)};var S=/\((.*?)\)/g;var H=/(\(\?)?:\w+/g;var A=/\*\w+/g;var I=/[\-{}\[\]+?.,\\\^$|#\s]/g;i.extend($.prototype,u,{initialize:function(){},route:function(t,r,s){if(!i.isRegExp(t))t=this._routeToRegExp(t);if(i.isFunction(r)){s=r;r=""}if(!s)s=this[r];var n=this;e.history.route(t,function(i){var a=n._extractParameters(t,i);n.execute(s,a);n.trigger.apply(n,["route:"+r].concat(a));n.trigger("route",r,a);e.history.trigger("route",n,r,a)});return this},execute:function(t,e){if(t)t.apply(this,e)},navigate:function(t,i){e.history.navigate(t,i);return this},_bindRoutes:function(){if(!this.routes)return;this.routes=i.result(this,"routes");var t,e=i.keys(this.routes);while((t=e.pop())!=null){this.route(t,this.routes[t])}},_routeToRegExp:function(t){t=t.replace(I,"\\$&").replace(S,"(?:$1)?").replace(H,function(t,e){return e?t:"([^/?]+)"}).replace(A,"([^?]*?)");return new RegExp("^"+t+"(?:\\?([\\s\\S]*))?$")},_extractParameters:function(t,e){var r=t.exec(e).slice(1);return i.map(r,function(t,e){if(e===r.length-1)return t||null;return t?decodeURIComponent(t):null})}});var N=e.History=function(){this.handlers=[];i.bindAll(this,"checkUrl");if(typeof window!=="undefined"){this.location=window.location;this.history=window.history}};var R=/^[#\/]|\s+$/g;var O=/^\/+|\/+$/g;var P=/msie [\w.]+/;var C=/\/$/;var j=/#.*$/;N.started=false;i.extend(N.prototype,u,{interval:50,atRoot:function(){return this.location.pathname.replace(/[^\/]$/,"$&/")===this.root},getHash:function(t){var e=(t||this).location.href.match(/#(.*)$/);return e?e[1]:""},getFragment:function(t,e){if(t==null){if(this._hasPushState||!this._wantsHashChange||e){t=decodeURI(this.location.pathname+this.location.search);var i=this.root.replace(C,"");if(!t.indexOf(i))t=t.slice(i.length)}else{t=this.getHash()}}return t.replace(R,"")},start:function(t){if(N.started)throw new Error("Backbone.history has already been started");N.started=true;this.options=i.extend({root:"/"},this.options,t);this.root=this.options.root;this._wantsHashChange=this.options.hashChange!==false;this._wantsPushState=!!this.options.pushState;this._hasPushState=!!(this.options.pushState&&this.history&&this.history.pushState);var r=this.getFragment();var s=document.documentMode;var n=P.exec(navigator.userAgent.toLowerCase())&&(!s||s<=7);this.root=("/"+this.root+"/").replace(O,"/");if(n&&this._wantsHashChange){var a=e.$('<iframe src="javascript:0" tabindex="-1">');this.iframe=a.hide().appendTo("body")[0].contentWindow;this.navigate(r)}if(this._hasPushState){e.$(window).on("popstate",this.checkUrl)}else if(this._wantsHashChange&&"onhashchange"in window&&!n){e.$(window).on("hashchange",this.checkUrl)}else if(this._wantsHashChange){this._checkUrlInterval=setInterval(this.checkUrl,this.interval)}this.fragment=r;var o=this.location;if(this._wantsHashChange&&this._wantsPushState){if(!this._hasPushState&&!this.atRoot()){this.fragment=this.getFragment(null,true);this.location.replace(this.root+"#"+this.fragment);return true}else if(this._hasPushState&&this.atRoot()&&o.hash){this.fragment=this.getHash().replace(R,"");this.history.replaceState({},document.title,this.root+this.fragment)}}if(!this.options.silent)return this.loadUrl()},stop:function(){e.$(window).off("popstate",this.checkUrl).off("hashchange",this.checkUrl);if(this._checkUrlInterval)clearInterval(this._checkUrlInterval);N.started=false},route:function(t,e){this.handlers.unshift({route:t,callback:e})},checkUrl:function(t){var e=this.getFragment();if(e===this.fragment&&this.iframe){e=this.getFragment(this.getHash(this.iframe))}if(e===this.fragment)return false;if(this.iframe)this.navigate(e);this.loadUrl()},loadUrl:function(t){t=this.fragment=this.getFragment(t);return i.any(this.handlers,function(e){if(e.route.test(t)){e.callback(t);return true}})},navigate:function(t,e){if(!N.started)return false;if(!e||e===true)e={trigger:!!e};var i=this.root+(t=this.getFragment(t||""));t=t.replace(j,"");if(this.fragment===t)return;this.fragment=t;if(t===""&&i!=="/")i=i.slice(0,-1);if(this._hasPushState){this.history[e.replace?"replaceState":"pushState"]({},document.title,i)}else if(this._wantsHashChange){this._updateHash(this.location,t,e.replace);if(this.iframe&&t!==this.getFragment(this.getHash(this.iframe))){if(!e.replace)this.iframe.document.open().close();this._updateHash(this.iframe.location,t,e.replace)}}else{return this.location.assign(i)}if(e.trigger)return this.loadUrl(t)},_updateHash:function(t,e,i){if(i){var r=t.href.replace(/(javascript:|#).*$/,"");t.replace(r+"#"+e)}else{t.hash="#"+e}}});e.history=new N;var U=function(t,e){var r=this;var s;if(t&&i.has(t,"constructor")){s=t.constructor}else{s=function(){return r.apply(this,arguments)}}i.extend(s,r,e);var n=function(){this.constructor=s};n.prototype=r.prototype;s.prototype=new n;if(t)i.extend(s.prototype,t);s.__super__=r.prototype;return s};p.extend=g.extend=$.extend=w.extend=N.extend=U;var M=function(){throw new Error('A "url" property or function must be specified')};var q=function(t,e){var i=e.error;e.error=function(r){if(i)i(t,r,e);t.trigger("error",t,r,e)}};return e});
;
/*!

 handlebars v4.0.5

Copyright (C) 2011-2015 by Yehuda Katz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

@license
*/
!function(a,b){"object"==typeof exports&&"object"==typeof module?module.exports=b():"function"==typeof define&&define.amd?define([],b):"object"==typeof exports?exports.Handlebars=b():a.Handlebars=b()}(this,function(){return function(a){function b(d){if(c[d])return c[d].exports;var e=c[d]={exports:{},id:d,loaded:!1};return a[d].call(e.exports,e,e.exports,b),e.loaded=!0,e.exports}var c={};return b.m=a,b.c=c,b.p="",b(0)}([function(a,b,c){"use strict";function d(){var a=new h.HandlebarsEnvironment;return n.extend(a,h),a.SafeString=j["default"],a.Exception=l["default"],a.Utils=n,a.escapeExpression=n.escapeExpression,a.VM=p,a.template=function(b){return p.template(b,a)},a}var e=c(1)["default"],f=c(2)["default"];b.__esModule=!0;var g=c(3),h=e(g),i=c(17),j=f(i),k=c(5),l=f(k),m=c(4),n=e(m),o=c(18),p=e(o),q=c(19),r=f(q),s=d();s.create=d,r["default"](s),s["default"]=s,b["default"]=s,a.exports=b["default"]},function(a,b){"use strict";b["default"]=function(a){if(a&&a.__esModule)return a;var b={};if(null!=a)for(var c in a)Object.prototype.hasOwnProperty.call(a,c)&&(b[c]=a[c]);return b["default"]=a,b},b.__esModule=!0},function(a,b){"use strict";b["default"]=function(a){return a&&a.__esModule?a:{"default":a}},b.__esModule=!0},function(a,b,c){"use strict";function d(a,b,c){this.helpers=a||{},this.partials=b||{},this.decorators=c||{},i.registerDefaultHelpers(this),j.registerDefaultDecorators(this)}var e=c(2)["default"];b.__esModule=!0,b.HandlebarsEnvironment=d;var f=c(4),g=c(5),h=e(g),i=c(6),j=c(14),k=c(16),l=e(k),m="4.0.5";b.VERSION=m;var n=7;b.COMPILER_REVISION=n;var o={1:"<= 1.0.rc.2",2:"== 1.0.0-rc.3",3:"== 1.0.0-rc.4",4:"== 1.x.x",5:"== 2.0.0-alpha.x",6:">= 2.0.0-beta.1",7:">= 4.0.0"};b.REVISION_CHANGES=o;var p="[object Object]";d.prototype={constructor:d,logger:l["default"],log:l["default"].log,registerHelper:function(a,b){if(f.toString.call(a)===p){if(b)throw new h["default"]("Arg not supported with multiple helpers");f.extend(this.helpers,a)}else this.helpers[a]=b},unregisterHelper:function(a){delete this.helpers[a]},registerPartial:function(a,b){if(f.toString.call(a)===p)f.extend(this.partials,a);else{if("undefined"==typeof b)throw new h["default"]('Attempting to register a partial called "'+a+'" as undefined');this.partials[a]=b}},unregisterPartial:function(a){delete this.partials[a]},registerDecorator:function(a,b){if(f.toString.call(a)===p){if(b)throw new h["default"]("Arg not supported with multiple decorators");f.extend(this.decorators,a)}else this.decorators[a]=b},unregisterDecorator:function(a){delete this.decorators[a]}};var q=l["default"].log;b.log=q,b.createFrame=f.createFrame,b.logger=l["default"]},function(a,b){"use strict";function c(a){return k[a]}function d(a){for(var b=1;b<arguments.length;b++)for(var c in arguments[b])Object.prototype.hasOwnProperty.call(arguments[b],c)&&(a[c]=arguments[b][c]);return a}function e(a,b){for(var c=0,d=a.length;d>c;c++)if(a[c]===b)return c;return-1}function f(a){if("string"!=typeof a){if(a&&a.toHTML)return a.toHTML();if(null==a)return"";if(!a)return a+"";a=""+a}return m.test(a)?a.replace(l,c):a}function g(a){return a||0===a?p(a)&&0===a.length?!0:!1:!0}function h(a){var b=d({},a);return b._parent=a,b}function i(a,b){return a.path=b,a}function j(a,b){return(a?a+".":"")+b}b.__esModule=!0,b.extend=d,b.indexOf=e,b.escapeExpression=f,b.isEmpty=g,b.createFrame=h,b.blockParams=i,b.appendContextPath=j;var k={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","`":"&#x60;","=":"&#x3D;"},l=/[&<>"'`=]/g,m=/[&<>"'`=]/,n=Object.prototype.toString;b.toString=n;var o=function(a){return"function"==typeof a};o(/x/)&&(b.isFunction=o=function(a){return"function"==typeof a&&"[object Function]"===n.call(a)}),b.isFunction=o;var p=Array.isArray||function(a){return a&&"object"==typeof a?"[object Array]"===n.call(a):!1};b.isArray=p},function(a,b){"use strict";function c(a,b){var e=b&&b.loc,f=void 0,g=void 0;e&&(f=e.start.line,g=e.start.column,a+=" - "+f+":"+g);for(var h=Error.prototype.constructor.call(this,a),i=0;i<d.length;i++)this[d[i]]=h[d[i]];Error.captureStackTrace&&Error.captureStackTrace(this,c),e&&(this.lineNumber=f,this.column=g)}b.__esModule=!0;var d=["description","fileName","lineNumber","message","name","number","stack"];c.prototype=new Error,b["default"]=c,a.exports=b["default"]},function(a,b,c){"use strict";function d(a){g["default"](a),i["default"](a),k["default"](a),m["default"](a),o["default"](a),q["default"](a),s["default"](a)}var e=c(2)["default"];b.__esModule=!0,b.registerDefaultHelpers=d;var f=c(7),g=e(f),h=c(8),i=e(h),j=c(9),k=e(j),l=c(10),m=e(l),n=c(11),o=e(n),p=c(12),q=e(p),r=c(13),s=e(r)},function(a,b,c){"use strict";b.__esModule=!0;var d=c(4);b["default"]=function(a){a.registerHelper("blockHelperMissing",function(b,c){var e=c.inverse,f=c.fn;if(b===!0)return f(this);if(b===!1||null==b)return e(this);if(d.isArray(b))return b.length>0?(c.ids&&(c.ids=[c.name]),a.helpers.each(b,c)):e(this);if(c.data&&c.ids){var g=d.createFrame(c.data);g.contextPath=d.appendContextPath(c.data.contextPath,c.name),c={data:g}}return f(b,c)})},a.exports=b["default"]},function(a,b,c){"use strict";var d=c(2)["default"];b.__esModule=!0;var e=c(4),f=c(5),g=d(f);b["default"]=function(a){a.registerHelper("each",function(a,b){function c(b,c,f){j&&(j.key=b,j.index=c,j.first=0===c,j.last=!!f,k&&(j.contextPath=k+b)),i+=d(a[b],{data:j,blockParams:e.blockParams([a[b],b],[k+b,null])})}if(!b)throw new g["default"]("Must pass iterator to #each");var d=b.fn,f=b.inverse,h=0,i="",j=void 0,k=void 0;if(b.data&&b.ids&&(k=e.appendContextPath(b.data.contextPath,b.ids[0])+"."),e.isFunction(a)&&(a=a.call(this)),b.data&&(j=e.createFrame(b.data)),a&&"object"==typeof a)if(e.isArray(a))for(var l=a.length;l>h;h++)h in a&&c(h,h,h===a.length-1);else{var m=void 0;for(var n in a)a.hasOwnProperty(n)&&(void 0!==m&&c(m,h-1),m=n,h++);void 0!==m&&c(m,h-1,!0)}return 0===h&&(i=f(this)),i})},a.exports=b["default"]},function(a,b,c){"use strict";var d=c(2)["default"];b.__esModule=!0;var e=c(5),f=d(e);b["default"]=function(a){a.registerHelper("helperMissing",function(){if(1!==arguments.length)throw new f["default"]('Missing helper: "'+arguments[arguments.length-1].name+'"')})},a.exports=b["default"]},function(a,b,c){"use strict";b.__esModule=!0;var d=c(4);b["default"]=function(a){a.registerHelper("if",function(a,b){return d.isFunction(a)&&(a=a.call(this)),!b.hash.includeZero&&!a||d.isEmpty(a)?b.inverse(this):b.fn(this)}),a.registerHelper("unless",function(b,c){return a.helpers["if"].call(this,b,{fn:c.inverse,inverse:c.fn,hash:c.hash})})},a.exports=b["default"]},function(a,b){"use strict";b.__esModule=!0,b["default"]=function(a){a.registerHelper("log",function(){for(var b=[void 0],c=arguments[arguments.length-1],d=0;d<arguments.length-1;d++)b.push(arguments[d]);var e=1;null!=c.hash.level?e=c.hash.level:c.data&&null!=c.data.level&&(e=c.data.level),b[0]=e,a.log.apply(a,b)})},a.exports=b["default"]},function(a,b){"use strict";b.__esModule=!0,b["default"]=function(a){a.registerHelper("lookup",function(a,b){return a&&a[b]})},a.exports=b["default"]},function(a,b,c){"use strict";b.__esModule=!0;var d=c(4);b["default"]=function(a){a.registerHelper("with",function(a,b){d.isFunction(a)&&(a=a.call(this));var c=b.fn;if(d.isEmpty(a))return b.inverse(this);var e=b.data;return b.data&&b.ids&&(e=d.createFrame(b.data),e.contextPath=d.appendContextPath(b.data.contextPath,b.ids[0])),c(a,{data:e,blockParams:d.blockParams([a],[e&&e.contextPath])})})},a.exports=b["default"]},function(a,b,c){"use strict";function d(a){g["default"](a)}var e=c(2)["default"];b.__esModule=!0,b.registerDefaultDecorators=d;var f=c(15),g=e(f)},function(a,b,c){"use strict";b.__esModule=!0;var d=c(4);b["default"]=function(a){a.registerDecorator("inline",function(a,b,c,e){var f=a;return b.partials||(b.partials={},f=function(e,f){var g=c.partials;c.partials=d.extend({},g,b.partials);var h=a(e,f);return c.partials=g,h}),b.partials[e.args[0]]=e.fn,f})},a.exports=b["default"]},function(a,b,c){"use strict";b.__esModule=!0;var d=c(4),e={methodMap:["debug","info","warn","error"],level:"info",lookupLevel:function(a){if("string"==typeof a){var b=d.indexOf(e.methodMap,a.toLowerCase());a=b>=0?b:parseInt(a,10)}return a},log:function(a){if(a=e.lookupLevel(a),"undefined"!=typeof console&&e.lookupLevel(e.level)<=a){var b=e.methodMap[a];console[b]||(b="log");for(var c=arguments.length,d=Array(c>1?c-1:0),f=1;c>f;f++)d[f-1]=arguments[f];console[b].apply(console,d)}}};b["default"]=e,a.exports=b["default"]},function(a,b){"use strict";function c(a){this.string=a}b.__esModule=!0,c.prototype.toString=c.prototype.toHTML=function(){return""+this.string},b["default"]=c,a.exports=b["default"]},function(a,b,c){"use strict";function d(a){var b=a&&a[0]||1,c=r.COMPILER_REVISION;if(b!==c){if(c>b){var d=r.REVISION_CHANGES[c],e=r.REVISION_CHANGES[b];throw new q["default"]("Template was precompiled with an older version of Handlebars than the current runtime. Please update your precompiler to a newer version ("+d+") or downgrade your runtime to an older version ("+e+").")}throw new q["default"]("Template was precompiled with a newer version of Handlebars than the current runtime. Please update your runtime to a newer version ("+a[1]+").")}}function e(a,b){function c(c,d,e){e.hash&&(d=o.extend({},d,e.hash),e.ids&&(e.ids[0]=!0)),c=b.VM.resolvePartial.call(this,c,d,e);var f=b.VM.invokePartial.call(this,c,d,e);if(null==f&&b.compile&&(e.partials[e.name]=b.compile(c,a.compilerOptions,b),f=e.partials[e.name](d,e)),null!=f){if(e.indent){for(var g=f.split("\n"),h=0,i=g.length;i>h&&(g[h]||h+1!==i);h++)g[h]=e.indent+g[h];f=g.join("\n")}return f}throw new q["default"]("The partial "+e.name+" could not be compiled when running in runtime-only mode")}function d(b){function c(b){return""+a.main(e,b,e.helpers,e.partials,g,i,h)}var f=arguments.length<=1||void 0===arguments[1]?{}:arguments[1],g=f.data;d._setup(f),!f.partial&&a.useData&&(g=j(b,g));var h=void 0,i=a.useBlockParams?[]:void 0;return a.useDepths&&(h=f.depths?b!==f.depths[0]?[b].concat(f.depths):f.depths:[b]),(c=k(a.main,c,e,f.depths||[],g,i))(b,f)}if(!b)throw new q["default"]("No environment passed to template");if(!a||!a.main)throw new q["default"]("Unknown template object: "+typeof a);a.main.decorator=a.main_d,b.VM.checkRevision(a.compiler);var e={strict:function(a,b){if(!(b in a))throw new q["default"]('"'+b+'" not defined in '+a);return a[b]},lookup:function(a,b){for(var c=a.length,d=0;c>d;d++)if(a[d]&&null!=a[d][b])return a[d][b]},lambda:function(a,b){return"function"==typeof a?a.call(b):a},escapeExpression:o.escapeExpression,invokePartial:c,fn:function(b){var c=a[b];return c.decorator=a[b+"_d"],c},programs:[],program:function(a,b,c,d,e){var g=this.programs[a],h=this.fn(a);return b||e||d||c?g=f(this,a,h,b,c,d,e):g||(g=this.programs[a]=f(this,a,h)),g},data:function(a,b){for(;a&&b--;)a=a._parent;return a},merge:function(a,b){var c=a||b;return a&&b&&a!==b&&(c=o.extend({},b,a)),c},noop:b.VM.noop,compilerInfo:a.compiler};return d.isTop=!0,d._setup=function(c){c.partial?(e.helpers=c.helpers,e.partials=c.partials,e.decorators=c.decorators):(e.helpers=e.merge(c.helpers,b.helpers),a.usePartial&&(e.partials=e.merge(c.partials,b.partials)),(a.usePartial||a.useDecorators)&&(e.decorators=e.merge(c.decorators,b.decorators)))},d._child=function(b,c,d,g){if(a.useBlockParams&&!d)throw new q["default"]("must pass block params");if(a.useDepths&&!g)throw new q["default"]("must pass parent depths");return f(e,b,a[b],c,0,d,g)},d}function f(a,b,c,d,e,f,g){function h(b){var e=arguments.length<=1||void 0===arguments[1]?{}:arguments[1],h=g;return g&&b!==g[0]&&(h=[b].concat(g)),c(a,b,a.helpers,a.partials,e.data||d,f&&[e.blockParams].concat(f),h)}return h=k(c,h,a,g,d,f),h.program=b,h.depth=g?g.length:0,h.blockParams=e||0,h}function g(a,b,c){return a?a.call||c.name||(c.name=a,a=c.partials[a]):a="@partial-block"===c.name?c.data["partial-block"]:c.partials[c.name],a}function h(a,b,c){c.partial=!0,c.ids&&(c.data.contextPath=c.ids[0]||c.data.contextPath);var d=void 0;if(c.fn&&c.fn!==i&&(c.data=r.createFrame(c.data),d=c.data["partial-block"]=c.fn,d.partials&&(c.partials=o.extend({},c.partials,d.partials))),void 0===a&&d&&(a=d),void 0===a)throw new q["default"]("The partial "+c.name+" could not be found");return a instanceof Function?a(b,c):void 0}function i(){return""}function j(a,b){return b&&"root"in b||(b=b?r.createFrame(b):{},b.root=a),b}function k(a,b,c,d,e,f){if(a.decorator){var g={};b=a.decorator(b,g,c,d&&d[0],e,f,d),o.extend(b,g)}return b}var l=c(1)["default"],m=c(2)["default"];b.__esModule=!0,b.checkRevision=d,b.template=e,b.wrapProgram=f,b.resolvePartial=g,b.invokePartial=h,b.noop=i;var n=c(4),o=l(n),p=c(5),q=m(p),r=c(3)},function(a,b){(function(c){"use strict";b.__esModule=!0,b["default"]=function(a){var b="undefined"!=typeof c?c:window,d=b.Handlebars;a.noConflict=function(){return b.Handlebars===a&&(b.Handlebars=d),a}},a.exports=b["default"]}).call(b,function(){return this}())}])});;
/*! Sea.js 2.2.1 | seajs.org/LICENSE.md */
!function(a,b){function c(a){return function(b){return{}.toString.call(b)=="[object "+a+"]"}}function d(){return A++}function e(a){return a.match(D)[0]}function f(a){for(a=a.replace(E,"/");a.match(F);)a=a.replace(F,"/");return a=a.replace(G,"$1/")}function g(a){var b=a.length-1,c=a.charAt(b);return"#"===c?a.substring(0,b):".js"===a.substring(b-2)||a.indexOf("?")>0||".css"===a.substring(b-3)||"/"===c?a:a+".js"}function h(a){var b=v.alias;return b&&x(b[a])?b[a]:a}function i(a){var b=v.paths,c;return b&&(c=a.match(H))&&x(b[c[1]])&&(a=b[c[1]]+c[2]),a}function j(a){var b=v.vars;return b&&a.indexOf("{")>-1&&(a=a.replace(I,function(a,c){return x(b[c])?b[c]:a})),a}function k(a){var b=v.map,c=a;if(b)for(var d=0,e=b.length;e>d;d++){var f=b[d];if(c=z(f)?f(a)||a:a.replace(f[0],f[1]),c!==a)break}return c}function l(a,b){var c,d=a.charAt(0);if(J.test(a))c=a;else if("."===d)c=f((b?e(b):v.cwd)+a);else if("/"===d){var g=v.cwd.match(K);c=g?g[0]+a.substring(1):a}else c=v.base+a;return 0===c.indexOf("//")&&(c=location.protocol+c),c}function m(a,b){if(!a)return"";a=h(a),a=i(a),a=j(a),a=g(a);var c=l(a,b);return c=k(c)}function n(a){return a.hasAttribute?a.src:a.getAttribute("src",4)}function o(a,b,c){var d=S.test(a),e=L.createElement(d?"link":"script");if(c){var f=z(c)?c(a):c;f&&(e.charset=f)}p(e,b,d,a),d?(e.rel="stylesheet",e.href=a):(e.async=!0,e.src=a),T=e,R?Q.insertBefore(e,R):Q.appendChild(e),T=null}function p(a,c,d,e){function f(){a.onload=a.onerror=a.onreadystatechange=null,d||v.debug||Q.removeChild(a),a=null,c()}var g="onload"in a;return!d||!V&&g?(g?(a.onload=f,a.onerror=function(){C("error",{uri:e,node:a}),f()}):a.onreadystatechange=function(){/loaded|complete/.test(a.readyState)&&f()},b):(setTimeout(function(){q(a,c)},1),b)}function q(a,b){var c=a.sheet,d;if(V)c&&(d=!0);else if(c)try{c.cssRules&&(d=!0)}catch(e){"NS_ERROR_DOM_SECURITY_ERR"===e.name&&(d=!0)}setTimeout(function(){d?b():q(a,b)},20)}function r(){if(T)return T;if(U&&"interactive"===U.readyState)return U;for(var a=Q.getElementsByTagName("script"),b=a.length-1;b>=0;b--){var c=a[b];if("interactive"===c.readyState)return U=c}}function s(a){var b=[];return a.replace(X,"").replace(W,function(a,c,d){d&&b.push(d)}),b}function t(a,b){this.uri=a,this.dependencies=b||[],this.exports=null,this.status=0,this._waitings={},this._remain=0}if(!a.seajs){var u=a.seajs={version:"2.2.1"},v=u.data={},w=c("Object"),x=c("String"),y=Array.isArray||c("Array"),z=c("Function"),A=0,B=v.events={};u.on=function(a,b){var c=B[a]||(B[a]=[]);return c.push(b),u},u.off=function(a,b){if(!a&&!b)return B=v.events={},u;var c=B[a];if(c)if(b)for(var d=c.length-1;d>=0;d--)c[d]===b&&c.splice(d,1);else delete B[a];return u};var C=u.emit=function(a,b){var c=B[a],d;if(c)for(c=c.slice();d=c.shift();)d(b);return u},D=/[^?#]*\//,E=/\/\.\//g,F=/\/[^/]+\/\.\.\//,G=/([^:/])\/\//g,H=/^([^/:]+)(\/.+)$/,I=/{([^{]+)}/g,J=/^\/\/.|:\//,K=/^.*?\/\/.*?\//,L=document,M=e(L.URL),N=L.scripts,O=L.getElementById("seajsnode")||N[N.length-1],P=e(n(O)||M);u.resolve=m;var Q=L.head||L.getElementsByTagName("head")[0]||L.documentElement,R=Q.getElementsByTagName("base")[0],S=/\.css(?:\?|$)/i,T,U,V=+navigator.userAgent.replace(/.*(?:AppleWebKit|AndroidWebKit)\/(\d+).*/,"$1")<536;u.request=o;var W=/"(?:\\"|[^"])*"|'(?:\\'|[^'])*'|\/\*[\S\s]*?\*\/|\/(?:\\\/|[^\/\r\n])+\/(?=[^\/])|\/\/.*|\.\s*require|(?:^|[^$])\brequire\s*\(\s*(["'])(.+?)\1\s*\)/g,X=/\\\\/g,Y=u.cache={},Z,$={},_={},ab={},bb=t.STATUS={FETCHING:1,SAVED:2,LOADING:3,LOADED:4,EXECUTING:5,EXECUTED:6};t.prototype.resolve=function(){for(var a=this,b=a.dependencies,c=[],d=0,e=b.length;e>d;d++)c[d]=t.resolve(b[d],a.uri);return c},t.prototype.load=function(){var a=this;if(!(a.status>=bb.LOADING)){a.status=bb.LOADING;var c=a.resolve();C("load",c);for(var d=a._remain=c.length,e,f=0;d>f;f++)e=t.get(c[f]),e.status<bb.LOADED?e._waitings[a.uri]=(e._waitings[a.uri]||0)+1:a._remain--;if(0===a._remain)return a.onload(),b;var g={};for(f=0;d>f;f++)e=Y[c[f]],e.status<bb.FETCHING?e.fetch(g):e.status===bb.SAVED&&e.load();for(var h in g)g.hasOwnProperty(h)&&g[h]()}},t.prototype.onload=function(){var a=this;a.status=bb.LOADED,a.callback&&a.callback();var b=a._waitings,c,d;for(c in b)b.hasOwnProperty(c)&&(d=Y[c],d._remain-=b[c],0===d._remain&&d.onload());delete a._waitings,delete a._remain},t.prototype.fetch=function(a){function c(){u.request(g.requestUri,g.onRequest,g.charset)}function d(){delete $[h],_[h]=!0,Z&&(t.save(f,Z),Z=null);var a,b=ab[h];for(delete ab[h];a=b.shift();)a.load()}var e=this,f=e.uri;e.status=bb.FETCHING;var g={uri:f};C("fetch",g);var h=g.requestUri||f;return!h||_[h]?(e.load(),b):$[h]?(ab[h].push(e),b):($[h]=!0,ab[h]=[e],C("request",g={uri:f,requestUri:h,onRequest:d,charset:v.charset}),g.requested||(a?a[g.requestUri]=c:c()),b)},t.prototype.exec=function(){function a(b){return t.get(a.resolve(b)).exec()}var c=this;if(c.status>=bb.EXECUTING)return c.exports;c.status=bb.EXECUTING;var e=c.uri;a.resolve=function(a){return t.resolve(a,e)},a.async=function(b,c){return t.use(b,c,e+"_async_"+d()),a};var f=c.factory,g=z(f)?f(a,c.exports={},c):f;return g===b&&(g=c.exports),delete c.factory,c.exports=g,c.status=bb.EXECUTED,C("exec",c),g},t.resolve=function(a,b){var c={id:a,refUri:b};return C("resolve",c),c.uri||u.resolve(c.id,b)},t.define=function(a,c,d){var e=arguments.length;1===e?(d=a,a=b):2===e&&(d=c,y(a)?(c=a,a=b):c=b),!y(c)&&z(d)&&(c=s(""+d));var f={id:a,uri:t.resolve(a),deps:c,factory:d};if(!f.uri&&L.attachEvent){var g=r();g&&(f.uri=g.src)}C("define",f),f.uri?t.save(f.uri,f):Z=f},t.save=function(a,b){var c=t.get(a);c.status<bb.SAVED&&(c.id=b.id||a,c.dependencies=b.deps||[],c.factory=b.factory,c.status=bb.SAVED)},t.get=function(a,b){return Y[a]||(Y[a]=new t(a,b))},t.use=function(b,c,d){var e=t.get(d,y(b)?b:[b]);e.callback=function(){for(var b=[],d=e.resolve(),f=0,g=d.length;g>f;f++)b[f]=Y[d[f]].exec();c&&c.apply(a,b),delete e.callback},e.load()},t.preload=function(a){var b=v.preload,c=b.length;c?t.use(b,function(){b.splice(0,c),t.preload(a)},v.cwd+"_preload_"+d()):a()},u.use=function(a,b){return t.preload(function(){t.use(a,b,v.cwd+"_use_"+d())}),u},t.define.cmd={},a.define=t.define,u.Module=t,v.fetchedList=_,v.cid=d,u.require=function(a){var b=t.get(t.resolve(a));return b.status<bb.EXECUTING&&(b.onload(),b.exec()),b.exports};var cb=/^(.+?\/)(\?\?)?(seajs\/)+/;v.base=(P.match(cb)||["",P])[1],v.dir=P,v.cwd=M,v.charset="utf-8",v.preload=function(){var a=[],b=location.search.replace(/(seajs-\w+)(&|$)/g,"$1=1$2");return b+=" "+L.cookie,b.replace(/(seajs-\w+)=1/g,function(b,c){a.push(c)}),a}(),u.config=function(a){for(var b in a){var c=a[b],d=v[b];if(d&&w(d))for(var e in c)d[e]=c[e];else y(d)?c=d.concat(c):"base"===b&&("/"!==c.slice(-1)&&(c+="/"),c=l(c)),v[b]=c}return C("config",a),u}}}(this);
;
//===========================================================================================
// CUSTOM HELPERS
//===========================================================================================
Handlebars.registerHelper("fixcondition", function (context, options) {
  var ret = false;
  for (var prop in context.hash) {
    if (context.hash[prop]) {
      ret = true;
    }
  }
  if (ret) {
    return context.fn();
  }
});
//Evenly distributes a collection of elements or blocks among a customizable number of html containers
//@param REQUIRED CONTEXT: An array of elements or blocks to split
//@param OPTIONAL delimiter="</ENDTAG><STARTTAG>" : Defines how the list should be broken and then started. Uses <ul> by default
//@param OPTIONAL mod="NUMBER" : Defines how many containers to distribute items into; 2 by default.
//
//EXAMPLE USAGE:
//<ul>
//<!-- evenly divide the items into 3 separate lists -->
//{{#split items delimiter="</ul><ul>" mod="3"}}
//   <li>{{text}}</li>
//{{/each}}
//</ul>
Handlebars.registerHelper("split", function (context, options) {
  /*ignore jshint start*/
  var ret = "",
    delimiter = options.hash.delimiter || "</ul><ul>",
    mod = Number(options.hash.mod || 2);
  if (context && context instanceof Array && !isNaN(mod)) {
    for (var i = 0, j = context.length, k = Math.ceil(j / mod); i < j; i++) {
      if (i > 0 && i % k === 0) {
        ret += delimiter;
      }
      context[i].index = i;
      ret += options.fn(context[i]);
    }
  }
  return ret;
  /*ignore jshint end*/
});

//Writes out a collection, inserting a delimiter after the nth item written.
//@param REQUIRED CONTEXT: An array of elements or blocks to output
//@param OPTIONAL delimiter="</ENDTAG><STARTTAG>" : Defines the markup to be written after the nth item
//@param OPTIONAL count="NUMBER" : The number of items to write before the delimiter is written. Not written by default.
//@param OPTIONAL multiple=true  : If true, the delimiter will be inserted every nTH items instead of only once
//
//EXAMPLE USAGE:
//<ul>
//<!-- the first 10 items go in container 1, the rest in container 2 -->
//{{#max items delimiter="</ul><ul>" mod="10"}}
//   <li>{{text}}</li>
//{{/each}}
//</ul>
Handlebars.registerHelper("max", function (context, options) {
  var ret = "",
    delimiter = options.hash.delimiter || "</ul><ul>",
    count = Number(options.hash.count || -1),
    compare = options.hash.multiple ? function (index) {
      return index > 0 && index % count === 0;
    } : function (index) {
      return index === count;
    };

  if (context && context instanceof Array && !isNaN(length)) {
    for (var i = 0, j = context.length; i < j; i++) {
      if (compare(i)) {
        ret += delimiter;
      }
      context[i].index = i;
      ret += options.fn(context[i]);
    }
  }
  return ret;
});

//Inverse of #if. Differs from {{^}} by testing the empty state correctly.
Handlebars.registerHelper("ifnot", function (context, options) {
  if (context instanceof Function) {
    context = context.call(this);
  }
  if (!context || Handlebars.Utils.isEmpty(context)) {
    return options.fn(this);
  } else {
    return options.inverse(this);
  }
});

//If the passed in context is a string, the first block is returned, otherwise the else block is returned.
//EXAMPLE USAGE:
//{{#ifstring mything}}
//mything is === string
//{{else}}
//mything is not a string
//{{/ifstring}}
Handlebars.registerHelper("ifstring", function (context, options) {
  if (typeof (context) === "string") {
    return options.fn(this);
  }
  return options.inverse(this);
});

//Compares the passed in context against a test string
//@param REQUIRED CONTEXT: The data field to evaluate
//@param REQUIRED test="VALUE": A string value to compare the field against
//
//EXAMPLE USAGE:
//<h1>People</h1>
//<ul>
//   {{#people}}
//    {{#equals type test="friend"}}
//     <li>{{name}} is cool</li>
//    {{/equals}}
//    {{#equals type test="enemy"}}
//     <li>{{name}} is uncool</li>
//    {{/equals}}
//   {{/people}}
//</ul>
Handlebars.registerHelper("equals", function (context, options) {
  /*ignore jshint start*/
  if ((context === '') || context !== (options.hash.test)) {
    return options.inverse(this);
  }
  return options.fn(this);
  /*ignore jshint end*/
});

//Compares the passed in context against a test string and writes normal block out if they do not equal each other
//@param REQUIRED CONTEXT: The data field to evaluate
//@param REQUIRED test="VALUE": A string value to compare the field against
Handlebars.registerHelper("notequals", function (context, options) {
  /*ignore jshint start*/
  if (!context || context === options.hash.test)
    return options.inverse(this);
  return options.fn(this);
  /*ignore jshint end*/
});


//Displays the block if the context is less than the test value
//@param REQUIRED CONTEXT: The data field to evaluate
//@param REQUIRED test="VALUE": a number to test the field against
Handlebars.registerHelper("lessthan", function (context, options) {
  var a = Number(context || -1),
    b = Number(options.hash.test || -1);
  if (isNaN(a) || isNaN(b) || a >= b) {
    return options.inverse(this);
  }
  return options.fn(this);
});

//Displays the block if the context is greater than the test value
//@param REQUIRED CONTEXT: The data field to evaluate
//@param REQUIRED test="VALUE": a number to test the field against
//
//EXAMPLE USAGE:
//{{#greaterthan count test="5"}}
//   the count is over 5
//{{else}}
//   the count is 5 or less
//{{/greaterthan}}
Handlebars.registerHelper("greaterthan", function (context, options) {
  var a = Number(context || -1),
    b = Number(options.hash.test || -1);
  if (isNaN(a) || isNaN(b) || a <= b) {
    return options.inverse(this);
  }
  return options.fn(this);
});

//Specialized IF statement that writes out the normal block if the number of array elements is less than the passed in count, otherwise writes out the {{else}} block
//@param REQUIRED CONTEXT: An array to evaluate
//@param REQUIRED count="NUMBER": Evaluates the expression as TRUE if this number is less than the number of array elements
Handlebars.registerHelper("containsless", function (context, options) {
  var count = Number(options.hash.count || -1);
  if (!context || !context instanceof Array || isNaN(count) || count <= context.length) {
    return options.inverse(this);
  }
  return options.fn(this);
});

//Specialized IF statement that writes out the normal block if the number of array elements is greater than the passed in count, otherwise writes out the {{else}} block
//@param REQUIRED CONTEXT: An array to evaluate
//@param REQUIRED count="NUMBER": Evaluates the expression as TRUE if this number is greater than the number of array elements
//
//EXAMPLE USAGE:
//{{#containsmore people test="5"}}
//   there are 5 or more people
//{{else}}
//   there are less than 5 people
//{{/containsmore}}
Handlebars.registerHelper("containsmore", function (context, options) {
  var count = Number(options.hash.count || -1);
  if (!context || !context instanceof Array || isNaN(count) || count >= context.length) {
    return options.inverse(this);
  }
  return options.fn(this);
});

//Inserts a separator between a list of items
//@param REQUIRED CONTEXT: An array of elements or blocks
//@param OPTIONAL delimiter="STRING" : Defines the delimiter to place between items; uses a comma by default.
Handlebars.registerHelper("sep", function (context, options) {
  var ret = "",
    delimiter = options.hash.delimiter || ",";
  if (context && context instanceof Array) {
    for (var i = 0, j = context.length; i < j; i++) {
      context[i].index = i;
      ret = ret + (i === 0 ? "" : delimiter) + options.fn(context[i]);
    }
  }
  return ret;
});

//Returns the number of elements within an array
//@param REQUIRED CONTEXT: An array element to return information on. If empty or not an array, returns an empty string.
//
//EXAMPLE USAGE:
//There are {{#count people}} people.
Handlebars.registerHelper("count", function (context, options) {
  if (context && context instanceof Array) {
    return context.length;
  }
  return "";
});

//Invokes a partial named from the passed in context. Requires pre-registration.
//  WARNING:
//  * The context of invoke is passed directly to the new template
//  * Exceptions raised due to a missing template is passed to handlebars
//  * The root model is disconnected, so parent notation does not work {{..\..\data}}
//
//@param REQUIRED CONTEXT: The value holding the name of the partial to invoke. MUST be a string.
//
//EXAMPLE USAGE:
//  In this example, "props.template" is a model key that contains the template name to execute
//  This allows different templates to run based on a property value
//{{#people}}
//   {{invoke props.template}}
//{{/people}}
Handlebars.registerHelper("invoke", function (context, options) {
  if ((typeof (context) === "string" || typeof (context) === "undefined") && typeof (options) === "object") {
    var process = function (context, options) {
      if (options.hash.lcase)
        context = context.toLowerCase();
      context = context.split(".");
      if (options.hash.prefix)
        context.unshift(options.hash.prefix);
      if (options.data.component && !options.hash.global)
        context.unshift(options.data.component);
      context = context.join(".");
      return context;
    };

    context = process(context || "", options);
    if (typeof (Handlebars.partials[context]) === "undefined" && options.hash.fallback) {
      context = process(options.hash.fallback, options);
    }
    return Handlebars.run(context, this, options);
  }
  return "";
});

//Writes out an object in key="value" pairs; usuful for anchor property bundles.
//@param REQUIRED CONTEXT: A flat object. Recursion and complex objects are NOT supported.
//@param OPTIONAL prefix: A prefix to add to each key. defaults to "data-"
//
//EXAMPLE USAGE:
//write out all keys as data-key attributes:
//   <a href="#"{{{#datalist props.data}}}>{{text}}</a>
//write out keys with a custom prefix:
//   <a href="#"{{{#datalist props.data prefix="myprefix_"}}}>{{text}}</a>
//write out keys with no prefix at all:
//   <a href="#"{{{#datalist props.data prefix=""}}}>{{text}}</a>
Handlebars.registerHelper("datalist", function (context, options) {
  /*ignore jshint start*/
  var ret = "",
    name, prefix = options.hash.prefix || options.hash.prefix === undefined && "data-" || "";

  for (name in context) {
    if (context.hasOwnProperty(name)) {
      ret += " " + prefix + name + "=\"" + context[name] + "\"";
    }
  }
  return ret;
  /*ignore jshint end*/
});

Handlebars.registerHelper("valempty", function (str, options) {
  var reg = /<[^>]+>/g,
    str1 = '';
  if (str && str.length) {
    str1 = (typeof str) === 'string' ? str : str[0];
    if (reg.test(str1)) {
      var s = '<div>' + str1 + '</div>'
      if ($.trim($(s).text())) {
        return options.fn(this);
      }
    } else {
      if ($.trim(str1)) {
        return options.fn(this);
      }
    }
  }
  return options.inverse(this);
});

//quick way of dumping the template context out
//
//EXAMPLE USAGE:
//{{#debug people}}
Handlebars.registerHelper("debug", function (context, options) {
  /*ignore jshint start*/
  console.log(context);
  /*ignore jshint end*/
});

Handlebars.registerHelper("dateyear", function (context, options) {
  return new Date().getFullYear();
});

Handlebars.registerHelper("gettree", function (context) {
  var html = '';
  var expand = '';
  if (!context) return false;
  function walker(arr) {
    var args = arguments;
    html += args[1] ? '<ul class="hide">' : '<ul>';
    for (var i = 0, len = arr.length; i < len; i++) {
      var obj = arr[i];
      var urls = 'href="' + (obj.uri || obj.url || ('#' + (obj.anchor || ''))) + '"';
      if (obj.children) {
        html += '<li>';
        expand = obj.isexpand ? ' expand' : '';
        html += '<i data-args="' + obj.id + '" class="collapse' + expand + '"></i><a ' + urls + 'data-args="' + obj.id + '" data-page="' + (obj.page || '') + '"><ins data-args="' + obj.id + '" data-page="' + obj.page + '" class="' + obj.selectstatus + '"></ins>' + obj.label + '</a>';
        walker(obj.children, !obj.isexpand);
        html += '</li>';
      } else {
        html += '<li><a target="_blank" ' + urls + ' data-page="' + obj.page + '" data-args="' + obj.id + '"><ins data-page="' + obj.page + '" class="' + obj.selectstatus + '" data-args="' + obj.id + '"></ins>' + obj.label + '</a></li>';
      }
    }
    html += '</ul>';
    return html;
  }
  return walker(context);
  //return '<div class="tree">' + html + '</div>';
});


Handlebars.registerHelper("treerelation", function (context, curid) {
  var html = '';
  var expand = '';
  if (!context) return false;
  function walker(arr) {
    html += arguments[1] ? '<ul class="hide">' : '<ul>';
    for (var i = 0, len = arr.length; i < len; i++) {
      var obj = arr[i];
      if (obj.children) {
        html += '<li>';
        expand = obj.isexpand ? '' : ' expand';
        html += '<i data-args="' + obj.id + '"  data-action="' + curid + '" class="collapse' + expand + '"></i><a href="javascript:;" data-args="' + obj.id + '" data-action="' + curid + '">' + obj.label + '</a>';
        walker(obj.children, obj.isexpand, obj.id, obj.morechild);
        html += '</li>';
      } else {
        if (i >= 3 && !arguments[3]) {
          html += '<li><a href="javascript:;" data-arg="' + arguments[2] + '" data-args="' + curid + '" class="relationmore">その他を表示</a></li>';
          break;
        }
        var urls = 'href="javascript:;"';
        if (!!obj.entitled) {
          urls = 'href="' + (obj.uri || obj.url || ('#' + obj.anchor)) + '"';
        }
        html += '<li><a class="opendocview" ' + urls + '>' + obj.label + '</a></li>';
      }
    }
    html += '</ul>';
    return html;
  }
  walker(context);
  return '<div class="tree">' + html + '</div>';
});

Handlebars.registerHelper("frodate", function (context, options) {
  function _formatjapdate(curtime) {
    var date = new Date(),
      year = date.getFullYear() + 10,
      month = 12,
      str = '',
      day = new Date(year, month, 0).getDate();

    var calendarData = {
      pingcheng: {
        lbl: '平成',
        startYear: 1989,
        startMonth: 1,
        startDay: 8,
        endYear: year,
        endMonth: month,
        endDay: day,
        starttime: +new Date(1989, 1 - 1, 8),
        endtime: +new Date(year, month, day)
      },
      zhaohe: {
        lbl: '昭和',
        startYear: 1926,
        startMonth: 12,
        startDay: 25,
        endYear: 1989,
        endMonth: 1,
        endDay: 7,
        starttime: +new Date(1926, 12 - 1, 25),
        endtime: +new Date(1989, 1 - 1, 7)
      },
      dazheng: {
        lbl: '大正',
        startYear: 1912,
        startMonth: 7,
        startDay: 30,
        endYear: 1926,
        endMonth: 12,
        endDay: 24,
        starttime: +new Date(1912, 7 - 1, 30),
        endtime: +new Date(1926, 12 - 1, 24)
      },
      mingzhi: {
        lbl: '明治',
        startYear: 1868,
        startMonth: 9,
        startDay: 8,
        endYear: 1912,
        endMonth: 7,
        endDay: 29,
        starttime: +new Date(1868, 9 - 1, 8),
        endtime: +new Date(1912, 7 - 1, 29)
      }
    };
    var time = curtime.getTime(),
      yearf = curtime.getFullYear();
    function getYearScope(o) {
      if (time >= o.starttime && time <= o.endtime) {
        return true;
      }
      return false;
    }
    for (var n in calendarData) {
      if (calendarData.hasOwnProperty(n)) {
        var o = calendarData[n];
        if (getYearScope(o)) {
          str = o.lbl.split('')[0] + (yearf - o.startYear + 1);
        }
      }
    }
    return str;
  }

  var date = context.split('/'),
    month = date[1],
    day = date[2];

  date = _formatjapdate(new Date(context)) + '/' + month + '/' + day;

  return date;
});

Handlebars.registerHelper("tojpdate", function (context, options) {
  var arr = context.split('-'),
    year = arr[0],
    month = arr[1],
    day = arr[2],
    str = '',
    mydate = new Date(year, month, day);
  var calendarData = {
    pingcheng: {
      lbl: '平成',
      startYear: 1989,
      startMonth: 1,
      startDay: 8,
      endYear: year,
      endMonth: month,
      endDay: day,
      starttime: +new Date(1989, 1 - 1, 8),
      endtime: +new Date(year, month, day)
    },
    zhaohe: {
      lbl: '昭和',
      startYear: 1926,
      startMonth: 12,
      startDay: 25,
      endYear: 1989,
      endMonth: 1,
      endDay: 7,
      starttime: +new Date(1926, 12 - 1, 25),
      endtime: +new Date(1989, 1 - 1, 7)
    },
    dazheng: {
      lbl: '大正',
      startYear: 1912,
      startMonth: 7,
      startDay: 30,
      endYear: 1926,
      endMonth: 12,
      endDay: 24,
      starttime: +new Date(1912, 7 - 1, 30),
      endtime: +new Date(1926, 12 - 1, 24)
    },
    mingzhi: {
      lbl: '明治',
      startYear: 1868,
      startMonth: 9,
      startDay: 8,
      endYear: 1912,
      endMonth: 7,
      endDay: 29,
      starttime: +new Date(1868, 9 - 1, 8),
      endtime: +new Date(1912, 7 - 1, 29)
    }
  };

  function getYearScope(o) {
    if (+mydate >= o.starttime && +mydate <= o.endtime) {
      return true;
    } else {
      return false;
    }
  }

  for (var n in calendarData) {
    if (calendarData.hasOwnProperty(n)) {
      var o = calendarData[n];
      if (getYearScope(o)) {
        str = o.lbl.split('')[0] + (year - o.startYear + 1);
      }
    }
  }

  return str + '/' + month + '/' + day;
});

// take string to date
// test='s' mark='/' return='未送信'
Handlebars.registerHelper("todate", function (context, options) {
  var test = options.hash.test,
    mark = options.hash.mark,
    redata = options.hash.redata;
  if (context === undefined || context === null || context === '' || context === '0001-01-01T00:00:00' || context === '0001-01-01T09:00:00' || context === '0001/01/01 09:00' || context === '2001/01/01 09:00') {
    return new Handlebars.SafeString('<font>' + redata + '</font>');
  }
  // context.replace("T"," ").replace(/[-]/g,"/").replace(/(\d{4})-(\d{2})-(\d{2})T(.*)?\.(.*)/, "$1/$2/$3 $4")
  var date = new Date(context.replace(/(\d{4})-(\d{2})-(\d{2})T(.*)?\.(.*)/, "$1/$2/$3 $4"));
  // var date = new Date(context);
  var year = date.getFullYear();
  var month = (date.getMonth() + 1) < 10 ? ('0' + (date.getMonth() + 1).toString()) : (date.getMonth() + 1);
  var day = date.getDate() < 10 ? ('0' + date.getDate()) : date.getDate();
  var hour = date.getHours() < 10 ? ('0' + date.getHours()) : date.getHours();
  var minute = date.getMinutes() < 10 ? ('0' + date.getMinutes()) : date.getMinutes();
  var second = date.getSeconds() < 10 ? ('0' + date.getSeconds()) : date.getSeconds();
  if (year <= 1) {
    return new Handlebars.SafeString('<font>' + redata + '</font>');
  }

  if (test === 'd') {

    if (mark === '#') {
      return year + '年' + month + '月' + day + '日';
    }
    return year + mark + month + mark + day;
  }
  else if (test === 's') {
    return year + mark + month + mark + day + ' ' + hour + ':' + minute + ':' + second;
  }
});

Handlebars.registerHelper("progress", function (context, options) {
  context = parseFloat(context.toFixed(2));
  return parseInt(0.8 * parseFloat(context) - 8) < 0 ? 0 : parseInt(0.8 * parseFloat(context) - 8) >= 72 ? 72 : parseInt(0.8 * parseFloat(context) - 8);
});

Handlebars.registerHelper("tojson", function (context, options) {
  console.log(context);
  try {
    return JSON.stringify(context);
  }
  catch (err) {
    return context;
  }
});

Handlebars.registerHelper("todouble", function (context, options) {
  if (context === '' || context === 0 || context === -1) {
    return context;
  }
  else {
    return parseFloat(context.toFixed(2))
  }
});

Handlebars.registerHelper("toint", function (context, options) {
  if (context === '' || context === 0 || context === -1) {
    return context;
  }
  else {
    return parseFloat(context.toFixed(0))
  }
});

Handlebars.registerHelper("indexplus", function (context, options) {
  var test = options.hash.test
  return parseInt(context) + test;
});

Handlebars.registerHelper("progresscolor", function (context, options) {
  if (context === -1 || context === '-1' || context === null || context === undefined) {
    return '';
  }
  var score = parseInt(context);
  if (score >= 0 && score <= 29) {
    return 'red';
  }
  else if (score > 29 && score <= 59) {
    return 'orange';
  }
  else if (score > 59 && score <= 89) {
    return 'green';
  }
  else if (score > 89) {
    return 'blue';
  }
});

Handlebars.registerHelper("browser", function (context, options) {
  var versionIE = function (ver) {
    var b = document.createElement('b')
    b.innerHTML = '<!--[if IE ' + ver + ']><i></i><![endif]-->'
    return b.getElementsByTagName('i').length === 1
  }
  // Internet Explorer 6-11
  var isIE = /*@cc_on!@*/false || !!document.documentMode;
  // Edge 20+
  var isEdge = !isIE && !!window.StyleMedia;
  if (versionIE(6) || versionIE(7) || versionIE(8) || isEdge) {
    return 'hidden';
  } else {
    return '';
  }
});


// pagecount not exist or <=50
Handlebars.registerHelper("pagemin", function (context, options) {
  var test = options.hash.test;
  if (context === undefined || isNaN(context)) {
    return options.inverse(this);
  } else {
    if (Number(context) <= test) {
      return options.inverse(this);
    } else {
      return options.fn(this);
    }
  }
});
Handlebars.registerHelper("pagemax", function (context, options) {
  var test = options.hash.test;
  if (context === undefined || isNaN(context)) {
    return options.inverse(this);
  } else {
    if (Number(context) > test) {
      return options.inverse(this);
    } else {
      return options.fn(this);
    }
  }
});
Handlebars.registerHelper("isLastLevel", function (context, options) {
  var currentLevel = context[context.length - 1];
  var test = options.hash.test;
  if (currentLevel.id.toString() === "0" && (currentLevel.level > 1)) {
    return options.fn(this);
  } else if (Number(currentLevel.level) > test) {
    return options.fn(this);
  } else {
    return options.inverse(this);
  }
});
// #amount status test='3#4' mark='#'
Handlebars.registerHelper("amount", function (context, options) {
  var mark = options.hash.mark;
  var array = options.hash.test.split(mark);
  var show = false;
  for (var i = 0; i < array.length; i++) {
    if (context.toString() === array[i].toString()) {
      show = true;
    }
  }
  if (show) {
    return options.fn(this);
  } else {
    return options.inverse(this);
  }
});

// #isContain xxx test='x'
Handlebars.registerHelper("isContain", function (context, options) {
  var test = options.hash.test;

  try {
    new RegExp(test);
  } catch (e) {
    test = '/' + test + '/';
  }

  if (context.match(test)) {
    return options.fn(this);
  }
  return options.inverse(this);
});


//if context is exist or context=0 or context is null
Handlebars.registerHelper("ifexists", function (context, options) {
  if (context === undefined || context === null || context === 0 || context === '') {
    return options.fn(this);
  } else {
    return options.inverse(this);
  }
});



Handlebars.registerHelper("sub", function (str, n) {
  var r = /[^\x00-\xff]/g;
  n = typeof n === 'number' ? n : 45;
  if (str.replace(r, "***").length <= n) return str.toString();
  var m = Math.floor(n / 3);
  for (var i = m; i < str.length; i++) {
    if (str.substr(0, i).replace(r, "***").length >= n) {
      return str.substr(0, i) + "...";
    }
  }
  return str.toString();
});

//more streamlined condition testing.
//
//EXAMPLE USAGE:
//{{#is a '===' b}} //compare two things with the given condition. operator must be inside quotes.
//  ...
//{{/is}}
//
//{{#is a b}}  //if no condition is given, then a basic == equality is assumed
//  ...
//{{/is}
//
//{{is a}}     //if no comparison variable is given, then existance is tested instead
//  ...
//{{/is}}
Handlebars.registerHelper('is', function () {
  var args = arguments,
    left = args[0].toString(),
    operator = args[1],
    right = args[2] && args[2].toString(),
    options = args[3];

  //if only one argument is given, then do a basic existance test
  if (args.length === 2) {
    options = args[1];
    if (left) return options.fn(this);
    return options.inverse(this);
  }

  //if two arguments are given, then do a basic equality test
  if (args.length === 3) {
    right = args[1];
    options = args[2];
    if (left === right) return options.fn(this);
    return options.inverse(this);
  }

  //three arguments, so determine what condition the user wanted
  switch (operator) {
    case '==':
      return (left === right) ? options.fn(this) : options.inverse(this);
    case '===':
      return (left === right) ? options.fn(this) : options.inverse(this);
    case '<':
      return (left < right) ? options.fn(this) : options.inverse(this);
    case '<=':
      return (left <= right) ? options.fn(this) : options.inverse(this);
    case '>':
      return (left > right) ? options.fn(this) : options.inverse(this);
    case '>=':
      return (left >= right) ? options.fn(this) : options.inverse(this);
    case '&&':
      return (left && right) ? options.fn(this) : options.inverse(this);
    case '||':
      return (left || right) ? options.fn(this) : options.inverse(this);
    case '!=':
      return (left !== right) ? options.fn(this) : options.inverse(this);
    case '!==':
      return (left !== right) ? options.fn(this) : options.inverse(this);
    default:
      return options.inverse(this);
  }
});
// custom compare function
Handlebars.registerHelper('ccompare', function (context, options) {
  /*ignore jshint start*/
  if ((context === '') || context.replace(/&amp;/g, '&') !== (options.hash.test)) {
    return options.fn(this);
  }
  return options.inverse(this);
  /*ignore jshint end*/
});

// trans string to lowercase
Handlebars.registerHelper('lower', function (text) {
  return text.toLowerCase();
});

Handlebars.registerHelper('increase', function (index) {
  if (typeof index === 'string') {
    index = Number(index);
  }
  return index + 1;
});

Handlebars.registerHelper('reduce', function (index) {
  if (typeof index === 'string') {
    index = Number(index);
  }
  return index - 1;
});

Handlebars.registerHelper('transImp', function (index) {
  var impMap = {
    "1": "低",
    "2": "中",
    "3": "高"
  };

  return impMap[index];
});

Handlebars.registerHelper('itemStatus', function (index) {
  var statusMap = {
    "1": "回答を選択",
    "2": "できている",
    "5": "ほぼできている",
    "3": "一部できている",
    "4": "できていない",
    "6": "対象ではない"
  };

  return statusMap[index];
});

Handlebars.registerHelper('uniq', function (string) {
  if (typeof string === "string") {
    return _.compact(_.uniq(string.split('<br/>'))).join('<br/>');
  }
  return string;
});

Handlebars.set = function (bundle, prefix) {
  var key, item;
  if (prefix) {
    prefix += ".";
  } else {
    prefix = "";
  }
  for (key in bundle) {
    if (bundle.hasOwnProperty(key)) {
      item = bundle[key];
      if (typeof (item) === "function") {
        Handlebars.registerPartial(prefix + key, Handlebars.template(item));
      } else if (typeof (item) === "object") {
        Handlebars.set(item, prefix + key);
      }
    }
  }
};

Handlebars.get = function (name) {
  return Handlebars.partials[name];
};

Handlebars.process = function (name, model, options) {
  model = model || {};
  if (model.toJSON instanceof Function) { //if this is container, then convert it to raw json
    model = model.toJSON();
  }
  var fn = this.get(name, options);
  if (fn instanceof Function) {
    return fn(model, options);
  }
  throw "Template not found";
};

Handlebars.registerHelper("minus", function (num1, num2) {
  return num1 - num2;
});
Handlebars.registerHelper("plus", function (num1, num2) {
  return num1 + num2;
});
Handlebars.registerHelper("cutword", function (text, options) {
  var res = '';
  text = text + '';
  if (text.length > 128) {
    res = text.substring(0, 128) + "...";
  } else {
    res = text;
  }
  return res;
});

Handlebars.run = function (name, model, options) {
  try {
    return this.process(name, model, options);
  } catch (e) {
    try {
      return this.process(options && options.error || "error", { message: e.message || e }, options);
    } catch (e2) { }
    return "";
  }
};

(function ($) {
  "use strict";
  $.fn.run = function (template, model, options) {
    return this.html(Handlebars.run(template, model, options));
  };
})($);

function getType(obj, lc) {
  var ret;
  if (obj) {
    ret = ({}).toString.call(obj).match(/\s([a-z|A-Z]+)/)[1];
  } else {
    ret = (obj === null) ? 'Null' : 'Undefined';
  }
  return (lc ? ret.toLowerCase() : ret);
}

JOL.model = Backbone.Model.extend({
  urlRoot: '',
  fetch: function (options) {
    //alert('fetch');
    var xhr;

    this.trigger("fetch");
    xhr = Backbone.Model.prototype.fetch.call(this, options);
    xhr.fetch = true;

    return xhr;
  },
  attr: function (attr, val) {
    if (attr.indexOf('.') !== -1) {
      var att = attr.split('.'),
        attrs = this.attributes;

      for (var i = 0; i < att.length; i++) {
        if (typeof val === 'undefined') {
          attrs = attrs[att[i]];
        } else {

          if (i === (att.length - 1)) {
            attrs[att[i]] = val;
          } else {
            attrs = attrs[att[i]];
          }
        }
      }

      if (typeof val === 'undefined') {
        return attrs;
      }
    } else {
      if (typeof val === 'undefined') {
        return this.attributes[attr];
      } else {
        this.attributes[attr] = val;
      }
    }
  },
  find: function (id, data) {
    data = data || this.attributes;
    function worker(id, data) {
      for (var prop in data) {
        if (data.hasOwnProperty(prop)) {
          if (getType(data[prop], true) === 'object' || getType(data[prop], true) === 'array') {
            var refp = worker(id, data[prop]);
            if (refp) return refp;
          } else if (prop === 'id' && data[prop] === id) {
            return data;
          }
        }
      }
      return false;
    }
    return worker(id, data);
  },
  save: function (key, value, options) {
    //alert('save');
    var xhr;

    this.trigger('save');
    xhr = Backbone.Model.prototype.save.apply(this, arguments);
    xhr.save = true;

    return xhr;
  },
  sync: function (method, model, options) {
    //alert('sync');
    var oldsuccess = options.success,
      olderror = options.error,
      showLoading = typeof options.showLoading === 'undefined' ? true : options.showLoading;


    // model.set('data', undefined);
    // model.set('nexttoken', undefined);
    // model.set('failed', undefined);

    options.beforeSend = function (obj, code, xhr) {
      if (showLoading) {
        $('.loading').show();
        $('.overlay').show();
      }
    };

    options.success = function (obj, code, xhr) {
      $('.loading').hide();
      $('.overlay').hide();
      oldsuccess.apply(this, arguments);
    };

    options.error = function (obj, code, xhr) {
      olderror.apply(this, arguments);
      $('.loading').hide();
      $('.overlay').hide();
    };

    return Backbone.Model.prototype.sync.apply(this, arguments);
  }
});

JOL.view = Backbone.View.extend({
  constructor: function (options) {
    var self = this,
      model = null;

    self.base = self.constructor.__super__;
    self.$el = $((self.type === 'layout') ? '.layout' : '.layout > .' + self.type);

    if (!self.model) {
      model = { page: pageModel[self.type], global: pageModel.global, logout: pageModel.logout };
      self.model = new JOL.model(model);
    }

    self.on('afterRender', self.afterRender || function () { });
    self.initialize.apply(self, arguments);
    self.disabled ? self.undelegateEvents() : self.delegateEvents();
    if (self.layout && self.disabled) {
      self.layout.undelegateEvents();
    }
  },
  render: function () {
    this.$el.run(this.template, this.model.toJSON());
    if (this.type !== 'layout') {
      this.autoHeight();
      //数据加载完页面有可能变长，需要重新设置背景高度
      $('.noticeoverlay').css({ height: $('body').height() + "px" });
    }
    this.trigger('afterRender');
    return this;
  },
  autoHeight: function () {
    var actualHeight = this.$el.outerHeight(true),
      deltaHeight = actualHeight - this.$el.height(),
      maxHeight = $(window).height() - $('.header').height() - $('.footer').height();

    this.$el.css({ height: 'auto' });

    if (this.$el.outerHeight(true) < maxHeight) {
      this.$el.css({ height: (maxHeight - deltaHeight) });
      this.$el.find('.border').css({ height: maxHeight - deltaHeight - 31 - 46 });
    }
    this.custUI && this.custUI();
  },
  noticeover: function () {
    var global = this.model.get('global'),
      shownotice = global.user.shownotice,
      noticeinfor = global.user.noticeinfor,
      Dialog = this.Dialog,
      notice = global.status.notice;
    //dialog
    if (!notice && shownotice) {

      this.notice = new Dialog({
        type: 'layout',
        template: 'common.notice',
        page: this,
        overlay: true,
        width: noticeinfor.width,
        height: noticeinfor.height,
        events: {
          'click .cknotice': 'noticesave'
        },
        noticesave: function () {
          var noticecheck = $('#noticecheck').is(':checked');
          if (noticecheck) {
            var AjaxNotice = JOL.model.extend({ urlRoot: '/api/common/notice' }),
              ajaxNotice = new AjaxNotice();
            ajaxNotice.save({
              id: noticeinfor.id
            }, {
                type: "POST"
              });
          }
          this.close();
          return false;
        }
      });

      this.notice.open({
        model: noticeinfor
      });
      this.model.attr('global.status.notice', true);

    }
  }
});
$.ajaxSetup({
  statusCode: {
    401: function () {
      location.reload();
    },
    403: function () {
    }
  },
  cache: false
});
