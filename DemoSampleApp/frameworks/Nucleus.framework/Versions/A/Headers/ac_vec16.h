//! @file ac_vec16.h
//!	@brief Vector functions (Word16 type)
//! @note (c) 2008-2010, Cifrasoft OOO (Ltd)

#ifndef AC_VEC16_H
#define AC_VEC16_H

#include "ac_typedef.h"

#ifdef __cplusplus
extern "C" {
#endif 

//! @brief Vector of type Word16 
typedef struct vec16 {
	Word16 *data;	//!< Pointer to the internal data array 
	int datasize;	//!< Vector size
} vec16;

//! @brief Matrix of type Word16
typedef struct mat16 {
	Word16 *data;	//!< Pointer to the internal data array
	int rows;		//!< Number of rows in a matrix
	int cols;		//!< Number of columns in a matrix
	int datasize;	//!< Matrix size (total number of elements)
} mat16;

//! @brief Vector initialization (constructor)
//! @param v the pointer to the vector that need to be initialized
void vec16_init(vec16 *v);

//! @brief Set vector length
//! @param v the pointer to the vector
//! @param size the size of vector to allocate 
//! @return TRUE if successful, FALSE otherwise
//! @remark vector length can be changed arbitrary number of times
int vec16_set_length(vec16 *v, int size);

//! @brief Set vector length without destroying existing data
//! @param v the pointer to the vector
//! @param size the size of vector to allocate 
//! @return TRUE if successful, FALSE otherwise
//! @remark vector length can be changed arbitrary number of times
int vec16_set_length_save_data(vec16 *v, int size);

//! @brief Get vector length
//! @param v the pointer to the vector
//! @return the size of vector  
int vec16_length(const vec16 *v);

//! @brief Vector deinitialization (destructor)
//! @param v the pointer to the vector that need to be destroyed 
//! @return TRUE if memory was deallocated, FLASE - otherwise (e.g. if trying to deallocate empty vector) 
int vec16_free(vec16 *v);

//! @brief Clear (set to zeros) vector content 
//! @param v the pointer to the vector
void vec16_clear(vec16 *v);

//! @brief Copy vector content 
//! @param src the pointer to the source vector
//! @param dest the pointer to the destination vector
//! @return FALSE if source vector is empty, TRUE - otherwise.
//! @remark if destination vector size is not the same as source vector size then the destination vector shall be resized.
int vec16_copy(const vec16 *src, vec16 *dest); 

//! @brief Concatenate two vectors 
//! @param src1 the pointer to the first source vector
//! @param src2 the pointer to the second source vector
//! @param dest the pointer to the destination vector
//! @remark the size of destination vector shall be automatically adjusted.
void vec16_concat(const vec16 *src1, const vec16 *src2, vec16 *dest);

//! @brief Concatenate two vectors (in place)
//! @param src the pointer to the first source vector
//! @param src_dest the pointer to the second source and destination vector
//! @remark the size of destination vector shall be automatically adjusted.
void vec16_concat_inplace(const vec16 *src, vec16 *src_dest);

//! @brief Extract sub-vector
//! @param src the pointer to the source vector
//! @param dest the pointer to the destination vector
//! @param i1 the first index of sub-vector
//! @param i2 the last index of sub-vector
//! @return FALSE if indexes are out of range, TRUE - otherwise. 
//! @remark use -1 (#VEND) constant to indicate the last element of the vector
int vec16_mid(const vec16 *src, vec16 *dest, int i1, int i2);

//! @brief Extract sub-vector (in place)
//! @param src_dest the pointer to the source and destination vector
//! @param i1 the first index of sub-vector
//! @param i2 the last index of sub-vector
//! @return FALSE if indexes are out of range, TRUE - otherwise. 
//! @remark use -1 (#VEND) constant to indicate the last element of the vector
int vec16_mid_inplace(vec16 *src_dest, int i1, int i2);

//! @brief Get value of i-th element
//! @param v the pointer to the vector
//! @param i the element index
//! @return the element value
//! @remark ::vec_get_value shall display a warning message if indexes are out of range (in debug mode)
Word16 vec16_get_value(const vec16 *v, int i);

//! @brief Set value of i-th element
//! @param v the pointer to the vector
//! @param value the element value
//! @param i the element index
//! @remark ::vec_set_value shall display a warning message if indexes are out of range (in debug mode)
void vec16_set_value(vec16 *v, Word16 value, int i);

// --- Matrix functions ---

//! @brief Matrix initialization (constructor)
//! @param m the pointer to the matrix that need to be initialized
void mat16_init(mat16 *m);

//! @brief Set matrix size
//! @param m the pointer to the matrix
//! @param rows the number of rows in the matrix 
//! @param cols the number of columns in the matrix 
//! @return TRUE if successful, FALSE otherwise
//! @remark matrix size can be changed arbitrary number of times
int mat16_set_size(mat16 *m, int rows, int cols);

//! @brief Matrix deinitialization (destructor)
//! @param m the pointer to the matrix that need to be destroyed 
//! @return TRUE if memory was deallocated, FLASE - otherwise (e.g. if trying to deallocate empty matrix) 
int mat16_free(mat16 *m);

//! @brief Get value of matrix element
//! @param m the pointer to the matrix
//! @param r the row index
//! @param c the column index
//! @return the element value
//! @remark ::mat_get_value shall display a warning message if indexes are out of range (in debug mode)
Word16 mat16_get_value(const mat16 *m, int r, int c);

//! @brief Set value of matrix element
//! @param m the pointer to the matrix
//! @param value the element value
//! @param r the row index
//! @param c the column index
//! @remark ::mat_set_value shall display a warning message if indexes are out of range (in debug mode)
void mat16_set_value(mat16 *m, Word16 value, int r, int c);

//! @brief Get matrix size (total number of elements)
//! @param m the pointer to the matrix
//! @return the size of matrix  
int mat16_size(const mat16 *m);

//! @brief Clear (set to zeros) matrix content 
//! @param m the pointer to the matrix
void mat16_clear(mat16 *m);

//! @brief Extract column from matrix
//! @param m the pointer to the matrix 
//! @param v the pointer to the column vector (shall be resized automatically)
//! @param idx the column index
//! @return FALSE if column index is out of range, TRUE - otherwise.
int mat16_get_col(const mat16 *m, vec16 *v, int idx);

//! @brief Extract row from matrix
//! @param m the pointer to the matrix 
//! @param v the pointer to the row vector (shall be resized automatically)
//! @param idx the row index
//! @return FALSE if row index is out of range, TRUE - otherwise.
int mat16_get_row(const mat16 *m, vec16 *v, int idx);

//! @brief Set column elements of matrix
//! @param v the pointer to the vector containing column elements
//! @param m the pointer to the matrix 
//! @param idx the column index
//! @return FALSE if column index is out of range, TRUE - otherwise.
int mat16_set_col(const vec16 *v, mat16 *m, int idx);

//! @brief Set row elements of matrix
//! @param v the pointer to the vector containing row elements
//! @param m the pointer to the matrix 
//! @param idx the row index
//! @return FALSE if row index is out of range, TRUE - otherwise.
int mat16_set_row(const vec16 *v, mat16 *m, int idx);

//! @brief Copy matrix content 
//! @param src the pointer to the source matrix
//! @param dest the pointer to the destination matrix
//! @return FALSE if source matrix is empty, TRUE - otherwise.
//! @remark if destination matrix size is not the same as source matrix size then the destination matrix shall be resized.
int mat16_copy(const mat16 *src, mat16 *dest); 

#ifdef __cplusplus
}
#endif 

#endif
