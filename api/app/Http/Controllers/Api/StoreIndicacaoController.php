<?php

namespace App\Http\Controllers\Api;

use App\Http\Concerns\ResponseJsonTrait;
use App\Http\Controllers\Controller;
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
    public function __invoke(Request $request)
    {
        return $this->sendResponse([], 'Amigo indicado!');
    }
}
