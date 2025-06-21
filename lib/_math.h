#ifndef _MATHEMATICS_H
#define _MATHEMATICS_H

#include "src_info.h"
#include "std_constants.h"
#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include <stdarg.h>

#define UNSIGNED_MATRIX 0X10
#define FLOAT_MATRIX    0X20
#define CHAR_MATRIX     0X40
#define PTR_MATRIX      0X80

#define ABSOLUTE(value) ((value < 0) ? -value : value)
#define NORMALIZE(value, max)       (value / max)
#define NORMALIZE_K(value, max, k) ((value / max) * k)

#define RAD(deg)    (deg * (M_PI / 180.0))
#define DEG(rad)    (rad * (180.0 / M_PI))

void* matrix_add(void* matrix_1, void* matrix_2, int row, int col, unsigned char sizeof_type);


float normalize(register float input, register float max);
double normalize_lf(register double input, register double max);

float normalize(register float input, register float max) {
    return input / max;
}
double normalize_lf(register double input, register double max) {
    return input / max;
}

void* matrix_add(void* matrix_1, void* matrix_2, int row, int col, unsigned char sizeof_type) {
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {

            switch (sizeof_type) {
                case sizeof(unsigned char):
                *(char*) matrix_1 += *(char*) matrix_2;
                break;
            
            case sizeof(unsigned short):
                *(short*) matrix_1 += *(short*) matrix_2;
                break;
                
            case sizeof(unsigned long):
                *(unsigned long*) matrix_1 += *(unsigned long*) matrix_2;
                break;
                
            case sizeof(unsigned long long):
                *(unsigned long long*) matrix_1 += *(unsigned long long*) matrix_2;
                break;

            case (sizeof(float) | FLOAT_MATRIX):
                *(float*) matrix_1 += *(float*) matrix_2;
                break;

            case (sizeof(double) | FLOAT_MATRIX):
                *(double*) matrix_1 += *(double*) matrix_2;
                break;

            default:
                *(int*) matrix_1 += *(int*) matrix_2;
                sizeof_type = sizeof(int);
                break;
            }

            matrix_1 = (char*) matrix_1 + (sizeof_type & 0XF);
            matrix_2 = (char*) matrix_2 + (sizeof_type & 0XF);
        }
        
    }
    
}

void matrix_scan(void* matrix, int row, int col, register unsigned int sizeof_type, char* _msg_, ...) {
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {
            printf(_msg_, i, j);
            switch (sizeof_type) {
                case sizeof(unsigned char):
                scanf("%u", (unsigned char*) matrix);
                break;
            
                case sizeof(unsigned short):
                scanf("%u", (unsigned short*) matrix);
                break;
                
                case sizeof(unsigned long):
                scanf("%u", (unsigned long*) matrix);                
                break;
                
                case sizeof(unsigned long long):
                scanf("%llu", (unsigned long long*) matrix);
                break;

                case (sizeof(float) | FLOAT_MATRIX):
                scanf("%f", (float*) matrix);
                break;
                
            case (sizeof(double) | FLOAT_MATRIX):
                scanf("%lf", (double*) matrix);
                break;
                
                case (CHAR_MATRIX | PTR_MATRIX):
                scanf("%s", (char*) matrix);
                break;
            
                default:
                scanf("%d", (int*) matrix);
                sizeof_type = sizeof(int);
                break;
            }
            matrix += (sizeof_type & 0XF);
        }
        
    }
}
void matrix_print(void* matrix, int row, int col, int sizeof_type, char* _fmt_) {
    for (int i = 0; i < row; i++) {
        for (int j = 0; j < col; j++) {

            switch (sizeof_type) {
                case (UNSIGNED_MATRIX | sizeof(unsigned char)):
                printf(_fmt_, *(unsigned char*) matrix);
                break;
            
            case (UNSIGNED_MATRIX | sizeof(unsigned short)):
                printf(_fmt_, *(unsigned short*) matrix);
                break;
                
            case (UNSIGNED_MATRIX | sizeof(unsigned long)):
                printf(_fmt_, *(unsigned long*) matrix);              
                break;
                
            case (UNSIGNED_MATRIX | sizeof(unsigned long long)):
                printf(_fmt_, *(unsigned long long*) matrix);
                break;

            case (sizeof(float) | FLOAT_MATRIX):
                printf(_fmt_, *(float*) matrix);
                break;

            case (sizeof(double) | FLOAT_MATRIX):
                printf(_fmt_, *(double*) matrix);
                break;

            case (CHAR_MATRIX | PTR_MATRIX):
                printf(_fmt_, (char*) matrix);
                break;
            
            default:
                printf(_fmt_, *(int*) matrix);
                sizeof_type = sizeof(int);
                break;
            }

            matrix += (sizeof_type & 0XF);
        }     
        putchar('\n');  
    }
}
#endif