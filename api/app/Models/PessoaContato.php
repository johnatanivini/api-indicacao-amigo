<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class PessoaContato extends Model
{
    use HasFactory;

    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at',
        'pivot'
    ];

    protected $primary_key = null;
    public $incrementing = false;

    protected $fillable = [
        'pessoa_id',
        'contato_id'
    ];

    public function pessoa():BelongsTo
    {
        return $this->belongsTo(Pessoa::class, 'pessoa_id', 'id');
    }

    public function contato():BelongsTo
    {
        return $this->belongsTo(Contato::class, 'contato_id', 'id');
    }
}
