<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contato extends Model
{
    use HasFactory;

    protected $hidden = [
        'created_at',
        'updated_at',
        'pivot',
        'tipo_contato_id'
    ];
    /**
     * @var array
     */
    protected $fillable = [
        'valor',
        'tipo_contato_id'
    ];

    public function tipoContato():BelongsTo
    {
        return $this->belongsTo(TipoContato::class, 'tipo_contato_id', 'id');
    }
}
