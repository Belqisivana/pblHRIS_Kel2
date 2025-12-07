<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Letter;
use App\Models\LetterFormat;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class LetterSubmissionController extends Controller
{
    public function employeeinfo()
    {
        $user = Auth::user();

        $employee = Employee::with(['position', 'department'])
            ->where('user_id', $user->id)
            ->first();

        if (!$employee) {
            return response()->json([
                'success' => false,
                'message' => 'Employee data not found for this user.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'employee' => $employee
        ]);
    }

    public function store(Request $request)
    {
        // VALIDASI 
        $validated = $request->validate([
            'letter_format_id' => 'required|exists:letter_formats,id',
            'tanggal_mulai' => 'required|date',
            'tanggal_selesai' => 'required|date|after_or_equal:tanggal_mulai',
        ]);

        // AMBIL EMPLOYEE BERDASARKAN USER LOGIN
        $employee = Employee::where('user_id', Auth::id())->first();

        if (!$employee) {
            return response()->json([
                'success' => false,
                'message' => 'Employee not found.'
            ], 404);
        }

        // MEMBUAT SURAT BARU
        $letter = Letter::create([
            'letter_format_id' => $validated['letter_format_id'],
            'employee_id' => $employee->id,
            'name' => $employee->first_name . ' ' . $employee->last_name,
            'jabatan' => $employee->position->name,
            'departemen' => $employee->department->name,
            'tanggal_mulai' => $validated['tanggal_mulai'],
            'tanggal_selesai' => $validated['tanggal_selesai'],
            'status' => 'pending',
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pengajuan telah dibuat.',
            'data' => $letter,
        ], 201);
    }
}
