<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Resources\IndicacaoCollection;
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
        $indicacoes = Indicacao::all();
        return $this->sendResponse(new IndicacaoCollection($indicacoes), 'Idicações carregadas');
    }
}
