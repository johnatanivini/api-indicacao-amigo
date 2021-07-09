<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Resources\IndicacaoResource;
use App\Models\Indicacao;
use Illuminate\Http\Request;

class IndicacoesController extends Controller
{

    use ResponseJsonTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        return $this->sendResponse(new IndicacaoResource(Indicacao::all()), 'Idicações carregadas');
    }
}
