(()=>{"use strict";var e,t,r,o,a,n={},c={};function d(e){var t=c[e];if(void 0!==t)return t.exports;var r=c[e]={exports:{}};return n[e].call(r.exports,r,r.exports,d),r.exports}d.m=n,e=[],d.O=(t,r,o,a)=>{if(!r){var n=1/0;for(u=0;u<e.length;u++){r=e[u][0],o=e[u][1],a=e[u][2];for(var c=!0,f=0;f<r.length;f++)(!1&a||n>=a)&&Object.keys(d.O).every((e=>d.O[e](r[f])))?r.splice(f--,1):(c=!1,a<n&&(n=a));if(c){e.splice(u--,1);var i=o();void 0!==i&&(t=i)}}return t}a=a||0;for(var u=e.length;u>0&&e[u-1][2]>a;u--)e[u]=e[u-1];e[u]=[r,o,a]},d.n=e=>{var t=e&&e.__esModule?()=>e.default:()=>e;return d.d(t,{a:t}),t},r=Object.getPrototypeOf?e=>Object.getPrototypeOf(e):e=>e.__proto__,d.t=function(e,o){if(1&o&&(e=this(e)),8&o)return e;if("object"==typeof e&&e){if(4&o&&e.__esModule)return e;if(16&o&&"function"==typeof e.then)return e}var a=Object.create(null);d.r(a);var n={};t=t||[null,r({}),r([]),r(r)];for(var c=2&o&&e;"object"==typeof c&&!~t.indexOf(c);c=r(c))Object.getOwnPropertyNames(c).forEach((t=>n[t]=()=>e[t]));return n.default=()=>e,d.d(a,n),a},d.d=(e,t)=>{for(var r in t)d.o(t,r)&&!d.o(e,r)&&Object.defineProperty(e,r,{enumerable:!0,get:t[r]})},d.f={},d.e=e=>Promise.all(Object.keys(d.f).reduce(((t,r)=>(d.f[r](e,t),t)),[])),d.u=e=>"assets/js/"+({85:"1f391b9e",96:"7ec84041",134:"d5cac251",248:"ee2b1056",331:"02fae9b5",368:"b49b1b14",459:"f980264e",493:"c9950bdd",664:"696d6ff5",665:"2d8ccc37",709:"09383a98",728:"3659f89c",910:"7dd55d62",941:"3be7f925",954:"ccdc81da"}[e]||e)+"."+{85:"d4dc5de3",96:"5885f44e",134:"43b415ca",248:"ee5b8e2b",331:"c80f5cd1",339:"ea7d7f66",343:"0365238a",368:"a8287b74",459:"48daf512",493:"9871c998",664:"3caa51ac",665:"99e66a58",709:"297c916a",728:"dfcea2ff",878:"27baceba",910:"bfb0e1e5",941:"b00795de",954:"64e73edf",972:"44ff1402"}[e]+".js",d.miniCssF=e=>{},d.g=function(){if("object"==typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"==typeof window)return window}}(),d.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t),o={},a="docs:",d.l=(e,t,r,n)=>{if(o[e])o[e].push(t);else{var c,f;if(void 0!==r)for(var i=document.getElementsByTagName("script"),u=0;u<i.length;u++){var l=i[u];if(l.getAttribute("src")==e||l.getAttribute("data-webpack")==a+r){c=l;break}}c||(f=!0,(c=document.createElement("script")).charset="utf-8",c.timeout=120,d.nc&&c.setAttribute("nonce",d.nc),c.setAttribute("data-webpack",a+r),c.src=e),o[e]=[t];var s=(t,r)=>{c.onerror=c.onload=null,clearTimeout(b);var a=o[e];if(delete o[e],c.parentNode&&c.parentNode.removeChild(c),a&&a.forEach((e=>e(r))),t)return t(r)},b=setTimeout(s.bind(null,void 0,{type:"timeout",target:c}),12e4);c.onerror=s.bind(null,c.onerror),c.onload=s.bind(null,c.onload),f&&document.head.appendChild(c)}},d.r=e=>{"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},d.p="/luau-signal/",d.gca=function(e){return e={"1f391b9e":"85","7ec84041":"96",d5cac251:"134",ee2b1056:"248","02fae9b5":"331",b49b1b14:"368",f980264e:"459",c9950bdd:"493","696d6ff5":"664","2d8ccc37":"665","09383a98":"709","3659f89c":"728","7dd55d62":"910","3be7f925":"941",ccdc81da:"954"}[e]||e,d.p+d.u(e)},(()=>{var e={303:0,532:0};d.f.j=(t,r)=>{var o=d.o(e,t)?e[t]:void 0;if(0!==o)if(o)r.push(o[2]);else if(/^(303|532)$/.test(t))e[t]=0;else{var a=new Promise(((r,a)=>o=e[t]=[r,a]));r.push(o[2]=a);var n=d.p+d.u(t),c=new Error;d.l(n,(r=>{if(d.o(e,t)&&(0!==(o=e[t])&&(e[t]=void 0),o)){var a=r&&("load"===r.type?"missing":r.type),n=r&&r.target&&r.target.src;c.message="Loading chunk "+t+" failed.\n("+a+": "+n+")",c.name="ChunkLoadError",c.type=a,c.request=n,o[1](c)}}),"chunk-"+t,t)}},d.O.j=t=>0===e[t];var t=(t,r)=>{var o,a,n=r[0],c=r[1],f=r[2],i=0;if(n.some((t=>0!==e[t]))){for(o in c)d.o(c,o)&&(d.m[o]=c[o]);if(f)var u=f(d)}for(t&&t(r);i<n.length;i++)a=n[i],d.o(e,a)&&e[a]&&e[a][0](),e[a]=0;return d.O(u)},r=self.webpackChunkdocs=self.webpackChunkdocs||[];r.forEach(t.bind(null,0)),r.push=t.bind(null,r.push.bind(r))})()})();