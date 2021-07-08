<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contato extends Model
{
    use HasFactory;

    /**
     * @var array
     */
    protected $fillable = [
        'valor',
        'tipo_contato_id'
    ];

    public function tipoContato()
    {
        return $this->belongsTo(TipoContato::class, 'tipo_contato_id', 'id');
    }
}
