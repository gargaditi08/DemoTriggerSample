//! @file ac_typedef.h
//!	@brief Basic type definitions
//! @note (c) 2008-2013, Cifrasoft OOO (Ltd)

#ifndef TYPEDEF_H
#define TYPEDEF_H

// -------  Definition of Types 
typedef short int		Word16;				//!< 16 bit signed data 
typedef int             Word32;				//!< 32 bit signed data
typedef long long       Word64;				//!< 64 bit signed data
typedef unsigned short	UWord16;			//!< 16 bit unsigned data 
typedef unsigned int	    UWord32;			//!< 32 bit unsigned data
typedef unsigned long long UWord64;			//!< 64 bit unsigned data
typedef char			Word8;				//!< 8 bit signed data
typedef unsigned char	UWord8;				//!< 8 bit unsigned data

/*
// To emulate A-memory on BF
typedef char			Word8A;			//!< 8 bit signed data
typedef unsigned char	UWord8A;
typedef short int		Word16A;
typedef unsigned short	UWord16A;
typedef long int		Word32A;
typedef unsigned long	UWord32A;
*/

// -------  General Macro Definitions 
#define Flag		Word16
#define TRUE		1						//!< TRUE constant 
#define FALSE		0						//!< FALSE constant
#define ON			1
//#define OFF		0 // OFF used in zlib
#define VSTART		0						//!< Vector start indicator
#define VEND		(-1)					//!< Vector end indicator

#ifndef NULL
#ifdef __cplusplus
#define NULL    0
#else
#define NULL    ((void *)0)
#endif
#endif

#ifndef PI
#define PI			3.141592654
#endif

#define AC_RX_HANDLE         void*
#define AC_TX_HANDLE         void*
#define AC_CAPSULE           void*
#define AC_SIGNAL            void*

// Platform-specific types
#if defined(ANDROID_NDK) && !defined(_PTRDIFF_T) && !defined(_PTRDIFF_T_DEFINED)
#define _PTRDIFF_T
typedef long ptrdiff_t;
#endif

#if defined(__IOS__) && !defined(_PTRDIFF_T) && !defined(_PTRDIFF_T_DEFINED)
#define _PTRDIFF_T
typedef long ptrdiff_t;
#endif

#endif
