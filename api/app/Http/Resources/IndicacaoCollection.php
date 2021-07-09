<?php

namespace App\Http\Resources;

use App\Models\Contato;
use App\Models\Indicacao;
use Illuminate\Http\Resources\Json\ResourceCollection;

class IndicacaoCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        
        return $this->collection;
    }
}
