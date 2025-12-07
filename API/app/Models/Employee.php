<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;

    protected $table = 'employees';

    protected $fillable = [
        'user_id',
        'position_id',
        'department_id',
        'first_name',
        'last_name',
        'gender',
        'address',
    ];

    /*
     * Relasi ke User
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /*
     * Relasi ke Position
     */
    public function position()
    {
        return $this->belongsTo(Position::class);
    }

    /*
     * Relasi ke Department
     */
    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    /*
     * Relasi ke Letters (1 employee → banyak letters)
     */
    public function letters()
    {
        return $this->hasMany(Letter::class);
    }

    /*
     * Relasi ke CheckClocks
     */
    public function checkClocks()
    {
        return $this->hasMany(CheckClock::class);
    }
}
