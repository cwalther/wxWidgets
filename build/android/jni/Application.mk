# This is here to force the creation of wx static libraries
# without specifying any dependent library.
APP_MODULES := wxbased wxbase wxnetd wxnet wxxmld wxxml wxjpegd wxjpeg

# This can be set via the command line as well: ndk-build TARGET_PLATFORM=android-9
APP_PLATFORM := android-9

APP_STL := gnustl_static
