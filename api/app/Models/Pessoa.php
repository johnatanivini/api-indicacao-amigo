<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pessoa extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'nome',
        'CPF'
    ];

    public function contatos()
    {
        return $this->belongsToMany(Contato::class, 'pessoa_contatos', 'pessoa_id', 'contato_id');
    }
}
