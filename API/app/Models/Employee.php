<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'position_id',
        'department_id',
        'first_name',
        'last_name',
        'gender',
        'address',
    ];

    // ✅ Relasi ke User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // ✅ Relasi ke Position
    public function position()
    {
        return $this->belongsTo(Position::class, 'position_id');
    }

    // ✅ Relasi ke Department
    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id');
    }

    // ✅ Relasi ke Letters
    public function letters()
    {
        return $this->hasMany(Letter::class, 'employee_id');
    }

    // ✅ Accessor untuk nama lengkap
    public function getFullNameAttribute()
    {
        return $this->first_name . ' ' . $this->last_name;
    }
}
