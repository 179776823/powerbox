<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

Route::get('think', function () {
    return 'hello,ThinkPHP5!';
});

Route::get('hello/:name', 'index/hello');

Route::rule('user/add','base/user/add');
Route::rule('image/get','base/image/get');
Route::rule('api/device/getList','agbox/device/getList');
Route::rule('api/device/getEventList','agbox/device/getEventList');
Route::rule('api/import/addDevice','agbox/import/addDevice');
Route::rule('api/import/updateDevice','agbox/import/updateDevice');
Route::rule('api/import/delDevice','agbox/import/delDevice');
Route::rule('api/person/getlist','agbox/person/getlist');
Route::rule('api/cars/getlist','agbox/cars/getlist');
Route::rule('api/cars/getCarsEvent','agbox/cars/getCarsEvent');
Route::rule('api/village/getBuildingList','agbox/village/getBuildingList');
Route::rule('api/village/getHouseList','agbox/village/getHouseList');
Route::rule('api/base/delHouse','agbox/base/delHouse');
Route::rule('api/base/delBuilding','agbox/base/delBuilding');
Route::rule('api/base/addBuilding','agbox/base/addBuilding');
Route::rule('api/base/addHouse','agbox/base/addHouse');

Route::rule('api/power/powerbox','agbox/powerbox/powerBox');
Route::rule('api/power/powerone','agbox/powerbox/powerBoxOne');
Route::rule('api/power/getevent','agbox/powerbox/getEvent');
Route::rule('api/power/getheartbeat','agbox/powerbox/getHeartbeat');
Route::rule('api/power/addpowerbox','agbox/powerbox/addPowerBox');
Route::rule('api/power/delpowerbox','agbox/powerbox/delPowerBox');
Route::rule('api/power/eventtotal','agbox/powerbox/powerBoxEvent');
Route::rule('api/power/eventcode','agbox/powerbox/getEventCode');

Route::rule('api/power/getnews','agbox/powerbox/powerNewsEvent');
Route::rule('api/power/control','agbox/powerbox/control');

Route::rule('api/power/powerboxput','agbox/powerbox/powerBoxput');
Route::rule('api/power/powerreport','agbox/powerbox/powerBoxreport');
Route::rule('api/power/powermessage','agbox/powerbox/powerBoxMessage');
Route::rule('api/power/powersystem','agbox/powerbox/powerBoxSystem');
Route::rule('api/power/powercensus','agbox/powerbox/powerBoxCensus');
Route::rule('api/power/powerinfo','agbox/powerbox/powerBoxInfo');
return [

];
