<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\IndicacaoRequest;
use App\Http\Resources\IndicacaoResource;
use App\Models\Indicacao;
use Illuminate\Http\Request;

class GetIndicacaoController extends Controller
{
    use ResponseJsonTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request, $id)
    {

        try {
            $indicacao = Indicacao::findOrFail($id);

            if (!$indicacao) {
                $this->sendError('Não foi possível buscar a indicação', [], 400);
            }

            return $this->sendResponse(new IndicacaoResource($indicacao), 'Indicação recuperada');
        } catch (\Exception $e) {
            return $this->sendError('Exceção lançada', [
                'message'=> 'Indicação não existe'
            ], 500);
        }
    }
}
