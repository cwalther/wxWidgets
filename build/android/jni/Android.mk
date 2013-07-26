LOCAL_PATH := $(call my-dir)/../../../src

# Create dirs and files
$(shell mkdir -p "$(LOCAL_PATH)/../lib/android_lib/androidud/wx")
$(shell mkdir -p "$(LOCAL_PATH)/../lib/android_lib/androidu/wx")
$(shell cp -fr "$(LOCAL_PATH)/../include/wx/android/setup.h" "$(LOCAL_PATH)/../lib/android_lib/androidud/wx/setup.h")
$(shell cp -fr "$(LOCAL_PATH)/../include/wx/android/setup.h" "$(LOCAL_PATH)/../lib/android_lib/androidu/wx/setup.h")


# Set parameters once, settings for each project will be simpler then.
MY_CFLAGS := -DWXBUILDING -DwxUSE_GUI=0 -DwxUSE_BASE=1
MY_CFLAGS_DEBUG := $(MY_CFLAGS) -D_DEBUG
MY_CFLAGS_RELEASE := $(MY_CFLAGS) -DNDEBUG
MY_CPP_FEATURES := rtti exceptions
MY_C_INCLUDES := \
    $(LOCAL_PATH)/../include
MY_C_INCLUDES_DEBUG := $(MY_C_INCLUDES) $(LOCAL_PATH)/../lib/android_lib/androidud
MY_C_INCLUDES_RELEASE := $(MY_C_INCLUDES) $(LOCAL_PATH)/../lib/android_lib/androidu
MY_SRC_FILES_WXBASE := \
    common/any.cpp \
    common/appbase.cpp \
    common/arcall.cpp \
    common/arcfind.cpp \
    common/archive.cpp \
    common/arrstr.cpp \
    common/base64.cpp \
    common/clntdata.cpp \
    common/cmdline.cpp \
    common/config.cpp \
    common/convauto.cpp \
    common/datetime.cpp \
    common/datetimefmt.cpp \
    common/datstrm.cpp \
    common/dircmn.cpp \
    common/dynarray.cpp \
    common/dynlib.cpp \
    common/dynload.cpp \
    common/encconv.cpp \
    common/event.cpp \
    common/evtloopcmn.cpp \
    common/extended.c \
    common/fdiodispatcher.cpp \
    common/ffile.cpp \
    common/file.cpp \
    common/fileback.cpp \
    common/fileconf.cpp \
    common/filefn.cpp \
    common/filename.cpp \
    common/filesys.cpp \
    common/filtall.cpp \
    common/filtfind.cpp \
    common/fmapbase.cpp \
    common/fs_arc.cpp \
    common/fs_filter.cpp \
    common/fs_mem.cpp \
    common/fswatchercmn.cpp \
    common/hash.cpp \
    common/hashmap.cpp \
    common/init.cpp \
    common/intl.cpp \
    common/ipcbase.cpp \
    common/languageinfo.cpp \
    common/list.cpp \
    common/log.cpp \
    common/longlong.cpp \
    common/memory.cpp \
    common/mimecmn.cpp \
    common/module.cpp \
    common/msgout.cpp \
    common/mstream.cpp \
    common/numformatter.cpp \
    common/object.cpp \
    common/platinfo.cpp \
    common/powercmn.cpp \
    common/process.cpp \
    common/regex.cpp \
    common/selectdispatcher.cpp \
    common/sstream.cpp \
    common/stdpbase.cpp \
    common/stdstream.cpp \
    common/stopwatch.cpp \
    common/strconv.cpp \
    common/stream.cpp \
    common/string.cpp \
    common/stringimpl.cpp \
    common/stringops.cpp \
    common/strvararg.cpp \
    common/sysopt.cpp \
    common/tarstrm.cpp \
    common/textbuf.cpp \
    common/textfile.cpp \
    common/time.cpp \
    common/timercmn.cpp \
    common/timerimpl.cpp \
    common/tokenzr.cpp \
    common/translation.cpp \
    common/txtstrm.cpp \
    common/unichar.cpp \
    common/uri.cpp \
    common/ustring.cpp \
    common/utilscmn.cpp \
    common/variant.cpp \
    common/wfstream.cpp \
    common/wxcrt.cpp \
    common/wxprintf.cpp \
    common/xlocale.cpp \
    common/xti.cpp \
    common/xtistrm.cpp \
    common/zipstrm.cpp \
    common/zstream.cpp \
    generic/fswatcherg.cpp \
    unix/appunix.cpp \
    unix/dialup.cpp \
    unix/dir.cpp \
    unix/dlunix.cpp \
    unix/epolldispatcher.cpp \
    unix/evtloopunix.cpp \
    unix/fdiounix.cpp \
    unix/fswatcher_inotify.cpp \
    unix/fswatcher_kqueue.cpp \
    unix/joystick.cpp \
    unix/mediactrl.cpp \
    unix/mimetype.cpp \
    unix/snglinst.cpp \
    unix/sound.cpp \
    unix/sound_sdl.cpp \
    unix/stackwalk.cpp \
    unix/stdpaths.cpp \
    unix/threadpsx.cpp \
    unix/timerunx.cpp \
    unix/utilsunx.cpp
MY_SRC_FILES_WXNET := \
    common/fs_inet.cpp \
    common/ftp.cpp \
    common/http.cpp \
    common/protocol.cpp \
    common/sckaddr.cpp \
    common/sckfile.cpp \
    common/sckipc.cpp \
    common/sckstrm.cpp \
    common/socket.cpp \
    common/socketiohandler.cpp \
    common/url.cpp \
    unix/sockunix.cpp
MY_SRC_FILES_XML := \
    common/xtixml.cpp \
    xml/xml.cpp
MY_SRC_FILES_JPEG := \
    jpeg/jcapimin.c \
    jpeg/jcapistd.c \
    jpeg/jccoefct.c \
    jpeg/jccolor.c \
    jpeg/jcdctmgr.c \
    jpeg/jchuff.c \
    jpeg/jcinit.c \
    jpeg/jcmainct.c \
    jpeg/jcmarker.c \
    jpeg/jcmaster.c \
    jpeg/jcomapi.c \
    jpeg/jcparam.c \
    jpeg/jcphuff.c \
    jpeg/jcprepct.c \
    jpeg/jcsample.c \
    jpeg/jctrans.c \
    jpeg/jdapimin.c \
    jpeg/jdapistd.c \
    jpeg/jdatadst.c \
    jpeg/jdatasrc.c \
    jpeg/jdcoefct.c \
    jpeg/jdcolor.c \
    jpeg/jddctmgr.c \
    jpeg/jdhuff.c \
    jpeg/jdinput.c \
    jpeg/jdmainct.c \
    jpeg/jdmarker.c \
    jpeg/jdmaster.c \
    jpeg/jdmerge.c \
    jpeg/jdphuff.c \
    jpeg/jdpostct.c \
    jpeg/jdsample.c \
    jpeg/jdtrans.c \
    jpeg/jerror.c \
    jpeg/jfdctflt.c \
    jpeg/jfdctfst.c \
    jpeg/jfdctint.c \
    jpeg/jidctflt.c \
    jpeg/jidctfst.c \
    jpeg/jidctint.c \
    jpeg/jidctred.c \
    jpeg/jmemmgr.c \
    jpeg/jmemnobs.c \
    jpeg/jquant1.c \
    jpeg/jquant2.c \
    jpeg/jutils.c




# wxbase static debug
include $(CLEAR_VARS)
LOCAL_MODULE := wxbased
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_DEBUG)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_DEBUG)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES:= $(MY_SRC_FILES_WXBASE)
include $(BUILD_STATIC_LIBRARY)

# wxbase static release
include $(CLEAR_VARS)
LOCAL_MODULE := wxbase
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_RELEASE)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_RELEASE)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES:= $(MY_SRC_FILES_WXBASE)
include $(BUILD_STATIC_LIBRARY)


# wxnet static debug
include $(CLEAR_VARS)
LOCAL_MODULE := wxnetd
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_DEBUG)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_DEBUG)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_WXNET)
include $(BUILD_STATIC_LIBRARY)

# wxnet static release
include $(CLEAR_VARS)
LOCAL_MODULE := wxnet
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_RELEASE)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_RELEASE)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_WXNET)
include $(BUILD_STATIC_LIBRARY)


# wxxml static debug
include $(CLEAR_VARS)
LOCAL_MODULE := wxxmld
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_DEBUG)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_DEBUG)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_XML)
include $(BUILD_STATIC_LIBRARY)

# wxxml static release
include $(CLEAR_VARS)
LOCAL_MODULE := wxxml
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_RELEASE)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_RELEASE)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_XML)
include $(BUILD_STATIC_LIBRARY)


# wxjpeg static debug
include $(CLEAR_VARS)
LOCAL_MODULE := wxjpegd
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_DEBUG)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_DEBUG)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_JPEG)
include $(BUILD_STATIC_LIBRARY)

# wxjpeg static release
include $(CLEAR_VARS)
LOCAL_MODULE := wxjpeg
LOCAL_MODULE_FILENAME := $(LOCAL_MODULE)
LOCAL_CFLAGS := $(MY_CFLAGS_RELEASE)
LOCAL_C_INCLUDES := $(MY_C_INCLUDES_RELEASE)
LOCAL_CPP_FEATURES := $(MY_CPP_FEATURES)
LOCAL_SRC_FILES := $(MY_SRC_FILES_JPEG)
include $(BUILD_STATIC_LIBRARY)


# TODO: copy libraries to their wx-conformant place _after_ build.
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")
#$(shell cp -fr "$(LOCAL_PATH)/../build/android/obj/local/$(TARGET_ARCH_ABI)/lib$(LOCAL_MODULE).a" "$(LOCAL_PATH)/../lib/android_lib/$(LOCAL_MODULE).a")


# If adding new libraries here, be sure to specify them in Application.mk too,
# otherwise, they will not build, because nothing depends on them.
