<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DepartmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('departments')->insert([
            [
                'name' => 'manajemen',
                'radius' => '10',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'IT',
                'radius' => '10',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
