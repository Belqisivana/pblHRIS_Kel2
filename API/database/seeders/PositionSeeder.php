<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('positions')->insert([
            [
                'name' => 'manajer',
                'rate_reguler' => '5000000',
                'rate_overtime' => '100000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'it support',
                'rate_reguler' => '3000000',
                'rate_overtime' => '50000',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
