<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'email'=>'example@gmail.com',
                'password'=>'pass1234',
                'is_admin'=>'1',
            ],
            [
                'email'=>'example1@gmail.com',
                'password'=>'pass1234',
                'is_admin'=>'2',
            ],
        ]);
    }
}
