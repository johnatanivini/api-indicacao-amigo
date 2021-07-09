<?php

namespace App\Models;

use App\Http\Requests\StoreIndicacaoRequest;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;

class Indicacao extends Model
{
    use HasFactory, SoftDeletes;

    protected $hidden = [
        'created_at',
        'deleted_at',
        'updated_at',
        'pessoa_id',
        'status_id'
    ];

    protected $fillable = [
        'id',
        'pessoa_id',
        'status_id'
    ];

    public function pessoa(): BelongsTo
    {
        return $this->belongsTo(Pessoa::class);
    }

    public function status(): BelongsTo
    {
        return $this->belongsTo(Status::class);
    }

    public static function criarIndicacao(StoreIndicacaoRequest $store):Indicacao | Exception
    {

        DB::beginTransaction();

        try {
            if (!$store->validated()) {
                throw new \Exception('Ocorreu um erro ao tentar indicar!');
            }

            $pessoa = Pessoa::create([
                'nome' => $store->nome,
                'CPF' => $store->cpf,
            ]);

            if (!TipoContato::where('nome', 'Email')->first()) {
                throw new Exception('O Tipo de contato Email não está cadastrado');
            }

            if (!TipoContato::where('nome', 'Telefone')->first()) {
                throw new Exception('O Tipo de contato Telefone não está cadastrado');
            }

            $email = Contato::create([
                'tipo_contato_id' => TipoContato::where('nome', 'Email')->first()->id,
                'valor' => $store->email
            ]);

            $telefone = Contato::create([
                'tipo_contato_id' => TipoContato::where('nome', 'Telefone')->first()->id,
                'valor' => $store->telefone
            ]);

            PessoaContato::create([
                'pessoa_id' => $pessoa->id,
                'contato_id' => $email->id
            ]);

            PessoaContato::create([
                'pessoa_id' => $pessoa->id,
                'contato_id' => $telefone->id
            ]);

            $indicacao = Indicacao::create([
                'pessoa_id' => $pessoa->id,
                'status_id' => Status::INICIADA
            ]);

            DB::commit();
            
            return $indicacao;
        } catch (\Exception $e) {
            DB::rollBack();
            throw new Exception($e->getMessage());
        }
    }
}
