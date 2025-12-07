<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmployeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('employees')->insert([
            [
                'user_id' => '1',
                'position_id' => '1',
                'department_id' => '1',
                'first_name' => 'fairuz',
                'last_name' => 'daffa',
                'gender' => 'm',
                'address' => 'jl jlan',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'user_id' => '2',
                'position_id' => '2',
                'department_id' => '2',
                'first_name' => 'dapret',
                'last_name' => 'prot',
                'gender' => 'm',
                'address' => 'jl jlan',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
