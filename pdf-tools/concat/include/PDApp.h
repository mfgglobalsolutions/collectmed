/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Wed May 10 09:59:32 2006
 */
/* Compiler settings for P:\PDF\3.1.0.12\pdapp\PDApp.idl:
    Os (OptLev=s), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __PDApp_h__
#define __PDApp_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IPDCat_FWD_DEFINED__
#define __IPDCat_FWD_DEFINED__
typedef interface IPDCat IPDCat;
#endif 	/* __IPDCat_FWD_DEFINED__ */


#ifndef __IPDSplit_FWD_DEFINED__
#define __IPDSplit_FWD_DEFINED__
typedef interface IPDSplit IPDSplit;
#endif 	/* __IPDSplit_FWD_DEFINED__ */


#ifndef __PDCat_FWD_DEFINED__
#define __PDCat_FWD_DEFINED__

#ifdef __cplusplus
typedef class PDCat PDCat;
#else
typedef struct PDCat PDCat;
#endif /* __cplusplus */

#endif 	/* __PDCat_FWD_DEFINED__ */


#ifndef __PDSplit_FWD_DEFINED__
#define __PDSplit_FWD_DEFINED__

#ifdef __cplusplus
typedef class PDSplit PDSplit;
#else
typedef struct PDSplit PDSplit;
#endif /* __cplusplus */

#endif 	/* __PDSplit_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IPDCat_INTERFACE_DEFINED__
#define __IPDCat_INTERFACE_DEFINED__

/* interface IPDCat */
/* [unique][helpstring][dual][uuid][object] */ 

typedef 
enum PDErrorType
    {	pdSuccess	= 0,
	pdErrFileAccess	= pdSuccess + 1,
	pdErrNotPDF	= pdErrFileAccess + 1,
	pdErrUnexpectedStructure	= pdErrNotPDF + 1,
	pdErrBadTrailer	= pdErrUnexpectedStructure + 1,
	pdErrBadXref	= pdErrBadTrailer + 1,
	pdErrNullRef	= pdErrBadXref + 1,
	pdErrParamValue	= pdErrNullRef + 1,
	pdErrReadingObject	= pdErrParamValue + 1,
	pdErrAlreadyWritten	= pdErrReadingObject + 1,
	pdErrOutputNotOpen	= pdErrAlreadyWritten + 1,
	pdErrNoCurrentInput	= pdErrOutputNotOpen + 1,
	pdErrBadCallingSequence	= pdErrNoCurrentInput + 1,
	pdErrNoMemory	= pdErrBadCallingSequence + 1,
	pdErrException	= pdErrNoMemory + 1,
	pdErrMissingParameter	= pdErrException + 1,
	pdErrNoLogoDefined	= pdErrMissingParameter + 1,
	pdErrInsufficentFontData	= pdErrNoLogoDefined + 1,
	pdErrIllegalFont	= pdErrInsufficentFontData + 1,
	pdErrNoMoreData	= pdErrIllegalFont + 1,
	pdErrNoCurrentPage	= pdErrNoMoreData + 1,
	pdErrOS	= pdErrNoCurrentPage + 1,
	pdErrInternal	= pdErrOS + 1,
	pdErrUnexpected	= pdErrInternal + 1,
	pdErrInputOutput	= pdErrUnexpected + 1,
	pdErrCannotCreateOutput	= pdErrInputOutput + 1,
	pdErrNoFilesSelected	= pdErrCannotCreateOutput + 1,
	pdErrNoBookmarks	= pdErrNoFilesSelected + 1
    }	PDErrorType;


EXTERN_C const IID IID_IPDCat;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("11E3A678-D3DD-11D3-9E7B-0060080C087D")
    IPDCat : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddParameter( 
            /* [in] */ BSTR Parameter) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Execute( 
            /* [retval][out] */ PDErrorType __RPC_FAR *res) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetErrorCode( 
            /* [retval][out] */ int __RPC_FAR *res) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IPDCatVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IPDCat __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IPDCat __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IPDCat __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IPDCat __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IPDCat __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IPDCat __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IPDCat __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *AddParameter )( 
            IPDCat __RPC_FAR * This,
            /* [in] */ BSTR Parameter);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Execute )( 
            IPDCat __RPC_FAR * This,
            /* [retval][out] */ PDErrorType __RPC_FAR *res);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetErrorCode )( 
            IPDCat __RPC_FAR * This,
            /* [retval][out] */ int __RPC_FAR *res);
        
        END_INTERFACE
    } IPDCatVtbl;

    interface IPDCat
    {
        CONST_VTBL struct IPDCatVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPDCat_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IPDCat_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IPDCat_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IPDCat_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IPDCat_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IPDCat_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IPDCat_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IPDCat_AddParameter(This,Parameter)	\
    (This)->lpVtbl -> AddParameter(This,Parameter)

#define IPDCat_Execute(This,res)	\
    (This)->lpVtbl -> Execute(This,res)

#define IPDCat_GetErrorCode(This,res)	\
    (This)->lpVtbl -> GetErrorCode(This,res)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDCat_AddParameter_Proxy( 
    IPDCat __RPC_FAR * This,
    /* [in] */ BSTR Parameter);


void __RPC_STUB IPDCat_AddParameter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDCat_Execute_Proxy( 
    IPDCat __RPC_FAR * This,
    /* [retval][out] */ PDErrorType __RPC_FAR *res);


void __RPC_STUB IPDCat_Execute_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDCat_GetErrorCode_Proxy( 
    IPDCat __RPC_FAR * This,
    /* [retval][out] */ int __RPC_FAR *res);


void __RPC_STUB IPDCat_GetErrorCode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IPDCat_INTERFACE_DEFINED__ */


#ifndef __IPDSplit_INTERFACE_DEFINED__
#define __IPDSplit_INTERFACE_DEFINED__

/* interface IPDSplit */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IPDSplit;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BDF31A23-ABD0-11D4-B1AA-00104BB05033")
    IPDSplit : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddParameter( 
            /* [in] */ BSTR Parameter) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Execute( 
            /* [retval][out] */ PDErrorType __RPC_FAR *res) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetErrorCode( 
            /* [retval][out] */ int __RPC_FAR *res) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IPDSplitVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IPDSplit __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IPDSplit __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IPDSplit __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IPDSplit __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IPDSplit __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IPDSplit __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IPDSplit __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *AddParameter )( 
            IPDSplit __RPC_FAR * This,
            /* [in] */ BSTR Parameter);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Execute )( 
            IPDSplit __RPC_FAR * This,
            /* [retval][out] */ PDErrorType __RPC_FAR *res);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetErrorCode )( 
            IPDSplit __RPC_FAR * This,
            /* [retval][out] */ int __RPC_FAR *res);
        
        END_INTERFACE
    } IPDSplitVtbl;

    interface IPDSplit
    {
        CONST_VTBL struct IPDSplitVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPDSplit_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IPDSplit_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IPDSplit_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IPDSplit_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IPDSplit_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IPDSplit_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IPDSplit_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IPDSplit_AddParameter(This,Parameter)	\
    (This)->lpVtbl -> AddParameter(This,Parameter)

#define IPDSplit_Execute(This,res)	\
    (This)->lpVtbl -> Execute(This,res)

#define IPDSplit_GetErrorCode(This,res)	\
    (This)->lpVtbl -> GetErrorCode(This,res)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDSplit_AddParameter_Proxy( 
    IPDSplit __RPC_FAR * This,
    /* [in] */ BSTR Parameter);


void __RPC_STUB IPDSplit_AddParameter_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDSplit_Execute_Proxy( 
    IPDSplit __RPC_FAR * This,
    /* [retval][out] */ PDErrorType __RPC_FAR *res);


void __RPC_STUB IPDSplit_Execute_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IPDSplit_GetErrorCode_Proxy( 
    IPDSplit __RPC_FAR * This,
    /* [retval][out] */ int __RPC_FAR *res);


void __RPC_STUB IPDSplit_GetErrorCode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IPDSplit_INTERFACE_DEFINED__ */



#ifndef __PDAPPLib_LIBRARY_DEFINED__
#define __PDAPPLib_LIBRARY_DEFINED__

/* library PDAPPLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_PDAPPLib;

EXTERN_C const CLSID CLSID_PDCat;

#ifdef __cplusplus

class DECLSPEC_UUID("11E3A679-D3DD-11D3-9E7B-0060080C087D")
PDCat;
#endif

EXTERN_C const CLSID CLSID_PDSplit;

#ifdef __cplusplus

class DECLSPEC_UUID("BDF31A24-ABD0-11D4-B1AA-00104BB05033")
PDSplit;
#endif
#endif /* __PDAPPLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
