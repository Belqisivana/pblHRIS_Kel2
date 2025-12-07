<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    protected $fillable = [
        'email',
        'password',
        'is_admin',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'is_admin' => 'boolean',
        ];
    }

    // ✅ Relasi ke Employee (1 user punya 1 employee)
    public function employee()
    {
        return $this->hasOne(Employee::class, 'user_id');
    }

    // ✅ Relasi ke Letters melalui Employee
    public function letters()
    {
        return $this->hasManyThrough(
            Letter::class,      // Model tujuan
            Employee::class,    // Model perantara
            'user_id',          // FK di table employees
            'employee_id',      // FK di table letters
            'id',               // PK di table users
            'id'                // PK di table employees
        );
    }
}
