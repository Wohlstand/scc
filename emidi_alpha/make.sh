#!/bin/bash

CXX_SRCS="CEnvelope.cpp CSMF.cpp CMIDIModule.cpp CSccDevice.cpp CPSGDrum.cpp CMIDIMessage.cpp COpllDevice.cpp CSMFPlay.cpp main_sdl.cpp"
C_SRCS="device/emu2212.c device/emu2149.c device/emu2413.c"

if [ ! -d tmp ]; then
    mkdir tmp
    mkdir tmp/device
fi

TOLINK=""

for s in $C_SRCS; do
    OBJ=tmp/$s.o
    gcc -c $s -o $OBJ
    TOLINK="${TOLINK} $OBJ"
done

for s in $CXX_SRCS; do
    OBJ=tmp/$s.o
    g++ -c $s -o $OBJ
    TOLINK="${TOLINK} $OBJ"
done

g++ $TOLINK -lSDL2 -o emidi

