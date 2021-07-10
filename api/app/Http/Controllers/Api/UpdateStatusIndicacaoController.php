<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateIndicacaoRequest;
use App\Http\Resources\IndicacaoResource;
use App\Models\Indicacao;
use Exception;

class UpdateStatusIndicacaoController extends Controller
{

    use ResponseJsonTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke($id)
    {
        try {
            $response = Indicacao::updateStatus($id);
            return $this->sendResponse(new IndicacaoResource($response), 'Status atualizado!');
        } catch (Exception $e) {
            return $this->sendError($e->getMessage(), [], 500);
        }
    }
}
