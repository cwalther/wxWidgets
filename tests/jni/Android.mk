LOCAL_PATH := $(call my-dir)/..

# Set parameters once, settings for each project will be simpler then.
MY_CFLAGS := -DwxUSE_GUI=0 -DwxUSE_BASE=1
MY_CFLAGS_DEBUG := $(MY_CFLAGS) -D_DEBUG
MY_CFLAGS_RELEASE := $(MY_CFLAGS) -DNDEBUG
MY_CPP_FEATURES := rtti exceptions
MY_LDLIBS := -lz -ldl -llog
MY_STATIC_LIBS_DEBUG := wxjpegd wxnetd wxbased cppunit
MY_STATIC_LIBS_RELEASE := wxjpeg wxnet wxbase cppunit
MY_C_INCLUDES := \
    ../include \
    ../../cppunit/cppunit/include \
    $(NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/include \
    $(NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/libs/$(TARGET_ARCH_ABI)/include
MY_C_INCLUDES_DEBUG := $(MY_C_INCLUDES) ../lib/android_lib/androidud
MY_C_INCLUDES_RELEASE := $(MY_C_INCLUDES) ../lib/android_lib/androidu

MY_TEST_FILES_BASE := \
    test.cpp \
    any/anytest.cpp \
    archive/archivetest.cpp \
    archive/ziptest.cpp \
    archive/tartest.cpp \
    arrays/arrays.cpp \
    base64/base64.cpp \
    config/fileconf.cpp \
    config/regconf.cpp \
    datetime/datetimetest.cpp \
    events/evthandler.cpp \
    events/evtsource.cpp \
    events/stopwatch.cpp \
    exec/exec.cpp \
    file/dir.cpp \
    file/filefn.cpp \
    file/filetest.cpp \
    filekind/filekind.cpp \
    filename/filenametest.cpp \
    filesys/filesystest.cpp \
    fontmap/fontmaptest.cpp \
    formatconverter/formatconvertertest.cpp \
    hashes/hashes.cpp \
    interactive/input.cpp \
    intl/intltest.cpp \
    lists/lists.cpp \
    log/logtest.cpp \
    longlong/longlongtest.cpp \
    mbconv/convautotest.cpp \
    misc/environ.cpp \
    misc/metatest.cpp \
    misc/misctests.cpp \
    misc/module.cpp \
    misc/pathlist.cpp \
    misc/typeinfotest.cpp \
    net/ipc.cpp \
    regex/regextest.cpp \
    regex/wxregextest.cpp \
    scopeguard/scopeguardtest.cpp \
    strings/iostream.cpp \
    strings/stdstrings.cpp \
    strings/tokenizer.cpp \
    strings/unichar.cpp \
    strings/unicode.cpp \
    strings/vararg.cpp \
    strings/crt.cpp \
    strings/vsnprintf.cpp \
    streams/bstream.cpp \
    streams/datastreamtest.cpp \
    streams/ffilestream.cpp \
    streams/fileback.cpp \
    streams/filestream.cpp \
    streams/iostreams.cpp \
    streams/largefile.cpp \
    streams/memstream.cpp \
    streams/socketstream.cpp \
    streams/sstream.cpp \
    streams/stdstream.cpp \
    streams/tempfile.cpp \
    streams/textstreamtest.cpp \
    streams/zlibstream.cpp \
    textfile/textfiletest.cpp \
    thread/atomic.cpp \
    thread/misc.cpp \
    thread/queue.cpp \
    thread/tls.cpp \
    uris/ftp.cpp \
    uris/uris.cpp \
    uris/url.cpp \
    vectors/vectors.cpp \
    weakref/evtconnection.cpp \
    weakref/weakref.cpp \


# These test should compile, but have erros now.
# May be just some ifdefs are missing.
#    interactive/output.cpp \
#    strings/numformatter.cpp \  - locale not supported
#    strings/strings.cpp \ - locale not supported
#    net/socket.cpp \  - no eventloop yet
#    mbconv/mbconvtest.cpp \
#    events/timertest.cpp \ - undefined rfeference to wcstombs, mbstowcs
#    xml/xmltest.cpp


# These are not yet supported by wxAndroid.
#    misc/dynamiclib.cpp \
#    fswatcher/fswatchertest.cpp \


# These are not supported under Android.
#    cmdline/cmdlinetest.cpp \ - no cmdline
#    xlocale/xlocale.cpp \ - locale not supported


# We need to list wx libraries here, otherwise we get linker errors.
include $(CLEAR_VARS)
LOCAL_MODULE := wxbased
LOCAL_SRC_FILES := ../lib/android_lib/wxbased.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := wxbase
LOCAL_SRC_FILES := ../lib/android_lib/wxbase.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := wxnetd
LOCAL_SRC_FILES := ../lib/android_lib/wxnetd.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := wxnet
LOCAL_SRC_FILES := ../lib/android_lib/wxnet.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := wxjpegd
LOCAL_SRC_FILES := ../lib/android_lib/wxjpegd.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := wxjpeg
LOCAL_SRC_FILES := ../lib/android_lib/wxjpeg.a
include $(PREBUILT_STATIC_LIBRARY)

# Similarly, we need to list cppunit library too.
include $(CLEAR_VARS)
LOCAL_MODULE := cppunit
LOCAL_SRC_FILES := ../../cppunit/cppunit/src/cppunit/obj/local/armeabi/libcppunit.a
include $(PREBUILT_STATIC_LIBRARY)

# Unit tests (wxBase)
include $(CLEAR_VARS)
LOCAL_MODULE := test
LOCAL_CFLAGS := $(MY_CFLAGS_DEBUG)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_DEBUG)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_LDLIBS := $(MY_LDLIBS)
LOCAL_STATIC_LIBRARIES := $(MY_STATIC_LIBS_DEBUG)
LOCAL_SRC_FILES:= $(MY_TEST_FILES_BASE)
include $(BUILD_SHARED_LIBRARY)

