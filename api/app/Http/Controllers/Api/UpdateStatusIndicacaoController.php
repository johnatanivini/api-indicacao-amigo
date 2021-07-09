<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateIndicacaoRequest;

class UpdateStatusIndicacaoController extends Controller
{

    use ResponseJsonTrait;
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(UpdateIndicacaoRequest $request, $id)
    {
        return $this->sendResponse([], 'Status atualizado!');
    }
}
