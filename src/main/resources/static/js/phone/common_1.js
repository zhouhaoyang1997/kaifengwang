function lenthString(str){var len=str.length;var tt=0;for(var i=0;i<len;i++){var txt=str.charCodeAt(i);if(txt>128){tt=tt+2;}else{tt=tt+1;}}
return tt;}
function chkEmail(str){var reg=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;if(reg.test(str)){return true;}else{alert('请输入正确的电子邮箱地址！');return false;}}
function chkMobile(mobile)
{var myreg=/^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;if(mobile.length!=11){alert('请输入有效的手机号码！');return false;}
if(!myreg.test(mobile)){alert('请输入有效的手机号码！');return false;}else{return true;}}
function is_wxclient(){var ua=navigator.userAgent.toLowerCase();if(ua.match(/MicroMessenger/i)=="micromessenger"){return true;}else{return false;}}

function windowToShow(action_name,to_url,ok_url){var html='<s class="s s1"></s><s class="s s2"></s>'+'<div class="txt">请在菜单中选择在浏览器中打开，<br>以完成'+action_name+'。</div>'+'<a href="'+ok_url+'" class="btn">已完成'+action_name+'</a>　<a href="'+ok_url+'" class="btn">取消并返回</a>';var divs=document.createElement('div');divs.id='alipayForSafari';divs.className='alipay_for_safari';divs.innerHTML=html;$('body').append(divs);$('#alipayForSafari').show();history.pushState(null,'',to_url);alert('to_url:'+to_url);}
function MympsWindowMsg_JSON(data){if(data.action==="pay"&&data.classid==="2"){payAppsubmitGo(data);}else{if(data.islogin==='1'){$('#isrep').val('');$('#parentid').val('');$('#chrcontent').html('');$('#chrcontent2').val('');$('#maskTB').trigger('click');if(data.isopen==='0'){MympsWindowMsg('revert','0','恭喜你，回复成功！请耐心等待系统审核！','','');}else{successPostRevert(data);}}else{MympsWindowMsg('revert','0',data.error,'','');}}}
function payAppsubmitGo(MSGkeyval){if(isapp==="1"){var YDB=new YDBOBJ();if(MSGkeyval.Payid==="7"){YDB.SetWxpayInfo(MSGkeyval.ProductName,MSGkeyval.Desicript,MSGkeyval.Price,MSGkeyval.OuttradeNo,MSGkeyval.attach);}
else if(MSGkeyval.Payid==="1"){YDB.SetAlipayInfo(MSGkeyval.ProductName,MSGkeyval.Desicript,MSGkeyval.Price,MSGkeyval.OuttradeNo);}}}
function windowlocationhref(url,nodecode){if(nodecode){}else{url=decodeURIComponent(url);}
if(url.length>5){window.location.href=url;}}
function MympsWindowMsg(action,showid,str,url,formcode){var sys_tips='<div class="sys_tips" id="sys_tips" style="display:none;"><div class="hd" id="sys_tips_title"></div><div class="bd"><p id="sys_tips_info"></p><div class="btn"><a href="javascript:void(0);" class="btn2" id="sys_tips_submit">确定</a></div></div></div>';if(!$('#sys_tips')[0]){$('body').prepend(sys_tips);}
var sys_tips=$('#sys_tips'),sys_tips_title=$('#sys_tips_title'),sys_tips_info=$('#sys_tips_info'),sys_tips_submit=$('#sys_tips_submit');if(showid=="0"){showConsole('提示',false);}else if(showid=="1"){showConsole('提示',true,formcode);}else if(showid=="2"){windowlocationhref(url,formcode);}else if(showid=="3"){showConsole('出错了',true,formcode);}else if(showid=="4"){showConsole('出错了',false);}else{return false;}
function showConsole(tit,isredirect,formcode){sys_tips_info.html(str);sys_tips_title.html(tit);sys_tips_submit.bind('click',function(e){e.preventDefault();sys_tips.hide();isredirect&&windowlocationhref(url,formcode);});sys_tips.show();var w_h=$(window).height(),d_h=sys_tips.height(),s_h=$(document).scrollTop(),top_val=(w_h-d_h)/2;sys_tips.css({'top':top_val+'px'});}}
function reloadLocation(){if(navigator.geolocation){navigator.geolocation.getCurrentPosition(showMapGPSre,handleError,{enableHighAccuracy:true,maximumAge:1000,timeout:6000});window['location_timeout']=setTimeout("geolocFail()",10000);}else{MympsWindowMsg('location','0','抱歉，您的浏览器不支持使用HTML 5来获取地理位置服务','','');}}
function getLocation(){if(navigator.geolocation){navigator.geolocation.getCurrentPosition(showMapGPS,handleError,{enableHighAccuracy:true,maximumAge:1000,timeout:6000});window['location_timeout']=setTimeout("geolocFail()",10000);}else{MympsWindowMsg('location','0','抱歉，您的浏览器不支持使用HTML 5来获取地理位置服务','','');}}
window['location_timeout']=null;function geolocFail(){if(typeof keyvalues!=='undefined'){getPagingGlobal();}
MympsWindowMsg('location','0','抱歉，我们没有获取到您的位置信息','','');}
function handleError(value){clearTimeout(window['location_timeout']);geolocFail();switch(value.code){case value.PERMISSION_DENIED:MympsWindowMsg('location','0','抱歉，位置服务被拒绝','','');break;case value.POSITION_UNAVAILABLE:MympsWindowMsg('location','0','抱歉，暂时获取不到位置信息','','');break;case value.TIMEOUT:MympsWindowMsg('location','0','抱歉，获取信息超时','','');break;case value.UNKNOWN_ERROR:MympsWindowMsg('location','0','抱歉，位置服务未知错误','','');break;}}
function showMapGPSre(value){clearTimeout(window['location_timeout']);var longitude=value.coords.longitude;var latitude=value.coords.latitude;var map=new BMap.Map();var gpsPoint=new BMap.Point(longitude,latitude);BMap.Convertor.translate(gpsPoint,0,function(point){var geoc=new BMap.Geocoder();geoc.getLocation(point,function(rs){var addComp=rs.addressComponents;$('#curLocation2').html(addComp.district+ addComp.street+ addComp.streetNumber);});});}
function showMapGPS(value){clearTimeout(window['location_timeout']);var longitude=value.coords.longitude;var latitude=value.coords.latitude;var map=new BMap.Map();var gpsPoint=new BMap.Point(longitude,latitude);BMap.Convertor.translate(gpsPoint,0,function(point){setMap(map,point);if(typeof keyvalues!=='undefined'){getPagingGlobal({'x':point.lng,'y':point.lat},true);}});}
function showMapBD(longitude,latitude){if(longitude===''){return;}
var map=new BMap.Map();var myPoint=new BMap.Point(longitude,latitude);setMap(map,myPoint);}
function setMap(map,point){var mapPointList=$('#mapPoint').find('.item');var geoc=new BMap.Geocoder();geoc.getLocation(point,function(rs){var addComp=rs.addressComponents;$('#curLocation').html(addComp.district+ addComp.street+ addComp.streetNumber);});mapPointList.each(function(){var mapPoint=$(this);var dataX=mapPoint.attr('data-x'),dataY=mapPoint.attr('data-y');if(dataX===''||dataX==='0'){return;}
var pointB=new BMap.Point(dataX,dataY);var txt=(map.getDistance(point,pointB)/1000).toFixed(2)+'公里';$(this).find('.juli').html(txt);});}
function showFilter(option){var node=$('#'+option.ibox),fullbg=$('#'+option.fullbg),ct1=$('#'+option.content1),ct2=$('#'+option.content2),ctp1=ct1.find('.innercontent'),ctp2=ct2.find('.innercontent'),currentClass='current';var tabs=node.find('.tab .item'),conts=node.find('.inner');fullbg.css({'height':$(document).height()+'px'});var timelist=node.find('.inner > ul > li').filter(function(index){return $('ul',this).length>0;}),childUL=null;timelist.each(function(){var that=$(this);that.addClass('hasUL');that.children('a').addClass('hasUlLink');});ct1.on("click",".hasUlLink",function(e){e.preventDefault();var that=$(this).parent();if(!window['myScroll_inner']){window['myScroll_inner']=new IScroll('#'+option.content2,{click:true,scrollX:false,scrollY:true,scrollbars:true,interactiveScrollbars:true,shrinkScrollbars:'scale',fadeScrollbars:true});}
setTimeout(function(){ctp1.find('.hasUL_current').removeClass('hasUL_current');that.addClass('hasUL_current');ctp2.html('<ul>'+that.find('ul').html()+'</ul>').show();ct1.css({'width':'50%'});ct2.show();window['myScroll_inner'].refresh();},100);});tabs.each(function(i){$(this).bind("click",function(e){e.preventDefault();if(!window['myScroll_parent']){window['myScroll_parent']=new IScroll('#'+option.content1,{click:true,scrollX:false,scrollY:true,scrollbars:true,interactiveScrollbars:true,shrinkScrollbars:'scale',fadeScrollbars:true});}
setTimeout(function(){node.addClass('filter-fixed');ct2.hide();ctp1[0].innerHTML=conts.eq(i).html();ct1.css('width','100%').show();fullbg.fadeIn('fast');tabs.removeClass(currentClass);tabs.eq(i).addClass(currentClass);window['myScroll_parent'].refresh();},100);});});fullbg.bind('click',function(e){e.preventDefault();hide_nav();});function hide_nav(){node.removeClass('filter-fixed');fullbg.fadeOut('fast');timelist.removeClass('hasUL_current');tabs.removeClass(currentClass);ct1.css('width','100%').hide();ct2.hide();}}
function nearby(distance,la,ln){var lat=la;var lng=ln;document.getElementById('distanceInput').value=distance;if(lat==''&&lng==''){if(navigator.geolocation)
{navigator.geolocation.getCurrentPosition(showPosition);}}else{var obj=new Object();obj.lat=lat;obj.lng=lng;showPosition(obj,1);}}
function showPosition(position)
{var url=location.search;var theRequest='';var ic=0;var idistance=0;var lat=0;var lng=0;if(arguments[1]==1){lat=position.lat;lng=position.lng;}else{lat=position.coords.latitude;lng=position.coords.longitude;}
var distance=document.getElementById('distanceInput').value==''?0.5:document.getElementById('distanceInput').value;if(url.indexOf("?")!=-1){var str=url.substr(1);strs=str.split("&");for(var i=0;i<strs.length;i++){var k=strs[i].split("=")[0];var v=strs[i].split("=")[1];if(k!=''){if(k=='lat'){ic++;v=lat;}
if(k=='lng'){ic++;v=lng;}
if(k=='distance'){idistance++;v=distance;}
theRequest+=k+'='+v+'&';}}}
if(ic<2){theRequest+='lat='+lat+'&lng='+lng;}
if(idistance==0){theRequest+='&distance='+distance;}
var stringArray=theRequest.split('')
if(stringArray[theRequest.length-1]=='&'){stringArray[theRequest.length-1]='';theRequest=stringArray.join('');}
location.href='index.php?'+theRequest;}
function LoginHide(){$('#inner_iframe').hide();$('#mask').hide();}
//by zhy
function searchOnClik(){
	alert("23333");
	location.href='#/search';
}
