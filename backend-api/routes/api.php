<?php

use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1'],function(){
    Route::get('users/{id}', 'Auth\ObjectController@returnUser');
    Route::post('/user', 'UserController@createUser');
    Route::post('/login', 'LoginController@login');
    Route::post('/editprofile', 'Auth\EditController@editUser');
    Route::get('experiences/{id}', 'ObjectController@returnExperiencies');
    Route::post('experience/', 'ObjectController@returnExperiencies');
    Route::put('experience/{id}', 'ObjectController@returnExperiencies');

    Route::get('educations/{id}', 'ObjectController@returnEducation');
    Route::post('education', 'ObjectController@createEducation');
    Route::put('educations/{id}', 'ObjectController@returnEducations');

    Route::get('lincenses/{id}', 'ObjectController@returnLicense');
    Route::post('lincense', 'ObjectController@returnLicense');
    Route::put('licenses/{id}', 'ObjectController@returnLicense');
});


Route::get('users/{id}', 'AuthController@returnUser');
Route::post('/user', 'AuthController@createUser');
Route::put('users/{id}', 'AuthController@returnUser');
Route::post('/login', 'AuthController@login');
Route::post('/editprofile', 'AuthController@editUser');

Route::get('experiences/{id}', 'ObjectController@returnExperiencies');
Route::post('experience/', 'ObjectController@returnExperiencies');
Route::put('experience/{id}', 'ObjectController@returnExperiencies');

Route::get('educations/{id}', 'ObjectController@returnEducation');
Route::post('education', 'ObjectController@createEducation');
Route::put('educations/{id}', 'ObjectController@returnEducations');

Route::get('licenses/{id}', 'ObjectController@returnLicense');
Route::post('license', 'ObjectController@returnLicense');
Route::put('licenses/{id}', 'ObjectController@returnLicense');

