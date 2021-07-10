<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->updateOrInsert([
            'name' => 'john',
            'email'=>'john@john.com',
            'password' => Hash::make('123456')
        ], [
            'email'=>'john@john.com',
            'id' => 1
        ]);
    }
}
