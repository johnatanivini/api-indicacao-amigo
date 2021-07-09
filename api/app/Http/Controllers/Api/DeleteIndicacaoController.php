<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
use App\Models\Indicacao;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class DeleteIndicacaoController extends Controller
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

        $indicacao = Indicacao::find($id);

        if (!$indicacao) {
            return $this->sendError('Indicação não existe!', [], 500);
        }

        $indicacao->delete();
        
        return $this->sendResponse(new Collection(), 'Idicação removida!');
    }
}
