<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Status extends Model
{

    const INICIADA = 1;
    const EM_ANDAMENTO = 2;
    const FINALIZADO = 3;
    
    use HasFactory, SoftDeletes;

    protected $hidden = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    protected $table = 'status';

    protected $fillable = [
        'nome'
    ];
}
