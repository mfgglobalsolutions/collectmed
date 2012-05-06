/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Wed May 10 09:59:32 2006
 */
/* Compiler settings for P:\PDF\3.1.0.12\pdapp\PDApp.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_IPDCat = {0x11E3A678,0xD3DD,0x11D3,{0x9E,0x7B,0x00,0x60,0x08,0x0C,0x08,0x7D}};


const IID IID_IPDSplit = {0xBDF31A23,0xABD0,0x11D4,{0xB1,0xAA,0x00,0x10,0x4B,0xB0,0x50,0x33}};


const IID LIBID_PDAPPLib = {0x11E3A66A,0xD3DD,0x11D3,{0x9E,0x7B,0x00,0x60,0x08,0x0C,0x08,0x7D}};


const CLSID CLSID_PDCat = {0x11E3A679,0xD3DD,0x11D3,{0x9E,0x7B,0x00,0x60,0x08,0x0C,0x08,0x7D}};


const CLSID CLSID_PDSplit = {0xBDF31A24,0xABD0,0x11D4,{0xB1,0xAA,0x00,0x10,0x4B,0xB0,0x50,0x33}};


#ifdef __cplusplus
}
#endif

