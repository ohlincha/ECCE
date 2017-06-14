#!/bin/bash
cp ${ECCE_HOME}/build/3rdparty-dists/wxPython-src-2.8.12.1.tar.bz2 ${ECCE_HOME}/3rdparty/build/
cd ${ECCE_HOME}/3rdparty/build/
tar xvf wxPython-src-2.8.12.1.tar.bz2
rm wxPython-src-2.8.12.1.tar.bz2
cd ${ECCE_HOME}/3rdparty/build/wxPython-src-2.8.12.1/wxPython
grep -rsl "PyErr_Format(PyExc_RuntimeError, mesg)" *|xargs -I {} sed -i 's/PyErr_Format(PyExc_RuntimeError, mesg)/PyErr_Format(PyExc_RuntimeError, "%s", mesg)/g' {}
cd ${ECCE_HOME}/3rdparty/build/wxPython-src-2.8.12.1/wxPython/src/gtk/
sed -i 's/wxLogFatalError(m)/wxLogFatalError("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogError(m)/wxLogError("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogWarning(m)/wxLogWarning("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogMessage(m)/wxLogMessage("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogInfo(m)/wxLogInfo("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogDebug(m)/wxLogDebug("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogVerbose(m)/wxLogVerbose("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogStatus(pFrame, m)/wxLogStatus(pFrame, "%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogStatus(m)/wxLogStatus("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogSysError(m)/wxLogSysError("%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogGeneric(level, m)/wxLogGeneric(level, "%s", m.c_str())/g' _misc_wrap.cpp
sed -i 's/wxLogTrace(mask, m)/wxLogTrace(mask, "%s", m.c_str())/g' _misc_wrap.cpp
cd ${ECCE_HOME}/src
grep -srl "<freetype/freetype.h>" |xargs -I {} sed -i 's,<freetype/freetype.h>,FT_FREETYPE_H,g' {}
grep -srl "<ftoutln.h>" |xargs -I {} sed -i 's,<ftoutln.h>,<freetype/ftoutln.h>,g' {}
grep -srl "freetype/" |xargs -I {} sed -i 's,freetype/,,g' {}
cd ${ECCE_HOME}/build
