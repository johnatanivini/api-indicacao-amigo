<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use LaravelLegends\PtBrValidator\Rules\FormatoCpf;

class StoreIndicacaoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'cpf' => 'cpf | required | unique:pessoas,CPF',
            'email' => 'email | unique:contatos,valor',
            'telefone' => 'required | unique:contatos,valor',
            'nome' => 'required | max: 120 | min:5'
        ];
    }

    public function messages()
    {
        return [
            'cpf' => [
                'unique:contatos,valor' => 'CPF já está em uso!'
            ]
        ];
    }
}
