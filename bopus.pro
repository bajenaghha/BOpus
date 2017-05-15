#-------------------------------------------------
#
# Project created by QtCreator 2017-05-15T21:12:37
#
#-------------------------------------------------

QT       -= gui
QT       += multimedia
TARGET = bopus
TEMPLATE = lib

DEFINES += BOPUS_LIBRARY

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += bopus.cpp

HEADERS += bopus.h\
        bopus_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}

unix:INCLUDEPATH += /usr/include/opus
unix:LIBS         += /usr/lib/x86_64-linux-gnu/libopus.so

# Set the destination directory of the shared libraries
# MYDLLDIR is a name something I made up myself, DESTDIR is a QMake variable.
# $$IN_PWD expands to the directory your .pro file is in.
# This example copies the final build output to ../dlls (one level above your project).
MYDLLDIR = $$IN_PWD/../opuslib

# We need quotes around the path in order to support whitespaces in the path
# for Windows. e.g. (''C:\Users\Gert van Dijk\...'').
# For some strange reason $$quote(...) does not seem to work for Windows here.
DESTDIR = \"$$MYDLLDIR\"

#
# Here's some magic to move all of the project's header files to the same DLL directory.
#

DDIR = \"$$MYDLLDIR/\"
SDIR = \"$$IN_PWD/\"
# Replace slashes in paths with backslashes for Windows
win32:file ~= s,/,\\,g
win32:DDIR ~= s,/,\\,g
win32:SDIR ~= s,/,\\,g
# For-loop to copy all header files to DDIR.
for(file, HEADERS) {
    QMAKE_POST_LINK += $$QMAKE_COPY $$quote($${SDIR}$${file}) $$quote($$DDIR) $$escape_expand(\\n\\t)
}
