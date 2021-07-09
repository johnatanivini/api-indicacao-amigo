<?php

namespace App\Http\Resources;

use App\Models\Contato;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ContatoCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return $this->collection->map(function (Contato $contato) {
            $contato->tipoContato;
            return $contato;
        });
    }
}
