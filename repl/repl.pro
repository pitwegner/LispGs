TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += -lgcits-3.5.0-64
LIBS += -L$(GS_HOME)/shared/downloads/products/GemStone64Bit3.5.0-x86_64.Linux/lib

INCLUDEPATH += $(GS_HOME)/shared/downloads/products/GemStone64Bit3.5.0-x86_64.Linux/include


SOURCES += repl.cpp
