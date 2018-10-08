cmake_minimum_required (VERSION 3.2)
project(emidi C CXX)

set(EMIDI_SRC
    emidi_alpha/CEnvelope.cpp
    emidi_alpha/CSMF.cpp
    emidi_alpha/device/emu2413.c
    emidi_alpha/device/emu2212.c
    emidi_alpha/device/emu2149.c
    emidi_alpha/CMIDIModule.cpp
    emidi_alpha/CSccDevice.cpp
    emidi_alpha/CPSGDrum.cpp
    emidi_alpha/CMIDIMessage.cpp
    emidi_alpha/COpllDevice.cpp
    emidi_alpha/CSMFPlay.cpp
)

if(WIN32)
    set(EMIDI_EXE_SRC emidi_alpha/main_sdl.cpp)
else()
    set(EMIDI_EXE_SRC emidi_alpha/main_sdl.cpp)
endif()

add_executable(emidi ${EMIDI_SRC} ${EMIDI_EXE_SRC})

if(WIN32)
    target_link_libraries(emidi PUBLIC winmm user32 gdi32)
else()
    target_link_libraries(emidi PUBLIC SDL2)
endif()

