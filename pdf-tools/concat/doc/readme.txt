PDCAT COM DLL for Windows
=========================

Version 3.0  November 21, 2005

Copyright (C) 1995-2005 PDF Tools AG

http://www.pdf-tools.com
pdfsupport@pdf-tools.com

File list
=========

readme.txt                  This file
bin/pdapp.dll               Dynamic link library
bin/pdapp.pdf               Documentation
bin/pdf-license-v1.4.pdf    License terms for binary pdf tools
include/pdapp.h             Include file for C Programs
include/pdapp.idl           COM interface definition (for documentation purposes)
include/pdapp_i.c           GUID definitions for C Programs
lib/pdapp.lib               Stub library for C Programs
lib/pdapp.tlb               COM type library

Installation
============

1. Unpack the archive in an installation directory, i.e. C:/Program Files/pdf-tools/
2. Register the dll with regsvr32.exe bin/pdapp.dll
3. For C programming only: add the include and lib directories to the INCLUDE and LIB environment variables.
