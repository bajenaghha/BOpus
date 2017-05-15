#ifndef BOPUS_GLOBAL_H
#define BOPUS_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(BOPUS_LIBRARY)
#  define BOPUSSHARED_EXPORT Q_DECL_EXPORT
#else
#  define BOPUSSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // BOPUS_GLOBAL_H
