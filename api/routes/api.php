<?php

use App\Http\Controllers\Api\IndicacoesController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::post('/login', 'Auth\AuthController@login')->name('login');

Route::post('/indicacoes', 'StoreIndicacaoController');

Route::middleware(['auth:sanctum'])->group(function () {

    Route::get('/indicacoes', 'IndicacoesController');
    Route::get('/indicacoes/{id}', 'GetIndicacaoController');
    Route::delete('/indicacoes/{id}', 'DeleteIndicacaoController');
    Route::put('/indicacoes/{id}', 'UpdateStatusIndicacaoController');
});
