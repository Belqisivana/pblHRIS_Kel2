<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\LetterFormatController;
use App\Http\Controllers\Api\LetterController;
use App\Http\Controllers\Api\LetterSubmissionController;
use App\Http\Controllers\Api\EmployeeRecapController;

// ============================
// LETTER FORMATS (Template Management)
// ============================
Route::get('/letter-formats', [LetterFormatController::class, 'index']);
Route::post('/letter-formats', [LetterFormatController::class, 'store']);
Route::get('/letter-formats/{id}', [LetterFormatController::class, 'show']);
Route::put('/letter-formats/{id}', [LetterFormatController::class, 'update']);
Route::delete('/letter-formats/{id}', [LetterFormatController::class, 'destroy']);

// ============================
// LETTER SUBMISSION (Karyawan mengajukan surat)
// ============================
// Route::middleware('auth:sanctum')->group(function () {
    Route::get('/letter/employee', [LetterSubmissionController::class, 'employeeInfo']);
    Route::post('/letters/submit', [LetterSubmissionController::class, 'submit']);
// });

// ============================
// LETTERS MANAGEMENT (HRD)
// ============================
Route::get('/letters', [LetterController::class, 'index']);
Route::get('/letters/{id}', [LetterController::class, 'show']);
Route::put('/letters/{id}/status', [LetterController::class, 'updateStatus']);
Route::get('/letters/{id}/download', [LetterController::class, 'download']);

Route::get('/employee-recap', [EmployeeRecapController::class, 'index']);
Route::get('/employee-recap/download', [EmployeeRecapController::class, 'download']);
Route::get('/employee-recap/pdf', [EmployeeRecapController::class, 'downloadPdf']);
