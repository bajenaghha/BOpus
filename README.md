BOpus library
=============

This repository has been created for Bajenaghha project. BOpus library is designed for Qt to implement opus library.

**Note:** decode and encode functions of *BOpus::Decoder* and *BOpus::Encoder* are not thread-safe in this version.

How to use
----------

    MYDLLDIR = $$IN_PWD/../opuslib
    
    # As our header files are in the same directory, we can make Qt Creator find it
    # by specifying it as INCLUDEPATH.
    INCLUDEPATH += $$MYDLLDIR
    
    # Dependency to library domain (libdomain.so for Unices or domain.dll on Win32)
    # Repeat this for more libraries if needed.
    win32:LIBS += $$quote($$MYDLLDIR/libbopus.dll)
     unix:LIBS += $$quote(-L$$MYDLLDIR) -llibbopus

