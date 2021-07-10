<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TipoContatoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_contatos')->updateOrInsert([
            'nome' => 'Email',
            'id' => 1
        ]);

        DB::table('tipo_contatos')->updateOrInsert([
            'nome' => 'Telefone',
            'id' => 2
        ]);
    }
}
