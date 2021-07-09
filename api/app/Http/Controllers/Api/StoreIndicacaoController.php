<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreIndicacaoRequest;
use App\Http\Resources\IndicacaoResource;
use App\Models\Indicacao;
use Exception;
use Illuminate\Http\Request;

class StoreIndicacaoController extends Controller
{
    use ResponseJsonTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(StoreIndicacaoRequest $request)
    {
        try {
            $store = Indicacao::criarIndicacao($request);
            return $this->sendResponse(new IndicacaoResource($store), 'Amigo indicado!', 201);
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), [], 500);
        }
    }
}
