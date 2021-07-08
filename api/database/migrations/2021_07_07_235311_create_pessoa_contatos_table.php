<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePessoaContatosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pessoa_contatos', function (Blueprint $table) {
            $table->timestamps();
            $table->unsignedBigInteger('pessoa_id');
            $table->unsignedBigInteger('contato_id');
            $table->foreign('pessoa_id')->references('id')->on('pessoas');
            $table->foreign('contato_id')->references('id')->on('contatos');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pessoa_contatos');
    }
}
