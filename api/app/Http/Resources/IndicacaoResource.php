<?php

namespace App\Http\Resources;

use App\Models\Contato;
use Illuminate\Http\Resources\Json\JsonResource;

class IndicacaoResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'pessoa' => [
               'id' => $this->pessoa->id,
               'nome' => $this->pessoa->nome,
               'cpf' => $this->pessoa->CPF,
               'contatos' => new ContatoCollection($this->pessoa->contatos)
            ],
            'status' => $this->status
        ];
    }
}
