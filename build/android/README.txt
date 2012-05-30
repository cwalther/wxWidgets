wxAndroid
=========

Right now, wxAndroid is in a very early stage. Quite a few classes in the base
and net library do work (more or less), but nothing was tested extensively.
A lot is still TODO - especialy all UI and events related stuff.
See <wx_dir>\include\wx\android\chkconf.h
Please note that a lot of UI-related stuff is not disabled here. This does not
mean these features do work (unfortunately), it just means that the base, the
net and the xml libs can be built without touching those settings.

There are now two ways to build wxAndroid:
- with the standalone toolchain,
- with vs-android and Visual C++ 2010.




Known problems
==============

There are probably serious problems with wxString because it seems like Android
does not really implement wchar_t functions.

If you do a 'rebuild' of any wx library with Visual C++, all wx libraries will
be erased.

When compiling:
    ../../include/wx/event.h: In member function 'virtual bool wxObjectEventFunctor::IsMatching(const wxEventFunctor&) const':
    D:\Develop\wx2_290\include\wx\event.h(231): warning : NULL used in arithmetic
But this is probably harmless.

When building with the standalone toolchain, wx libraries will not be placed
where expected, instead, they will be in <wx-dir>/build/android/obj/local/armeabi

wxHTTP: GetResult() returns 0.
wxFTP: not yet tested.
wxSocket read: not yet tested.




Changes to wxWidgets
====================

There are two small changes in wx\platform.h:
- defining __WXANDROID__ 
- including include\wx\android\config_android.h

And a few additions:
- include\wx\android\config_android.h - contains necessary defines
- include\wx\android\chkconf.h - disabled wx features (as mentioned above)
- in build\android - files needed to build wxAndroid
- in test and tests\jni - makefiles to build unit tests (does not compile yet!)




Compiling with the standalone toolchain
=======================================

You should have all these:

- Java SDK
  (http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase6-419409.html)
  This is version 6 which I used, but I don't know about any problems with v.7.
  Use the x86 version - problems are reported with the x64 version. 
  Check and set the JAVA_HOME enviroment variable.
  
- Android SDK (http://developer.android.com/sdk/index.html)
  You only need the ADT Plugin if you use Eclipse (you don't need to).
  Run the 'SDK Manager' and install at least one platform you are going to
  target. If you want to test on a real device, you probably want to target the
  device's API level (or something compatible).
  If you'll only use the emulator, api level 8 or 9 seems to be a good choice. 
  You can install emulators with the Android 'AVD manager'.

- Android NDK (http://developer.android.com/sdk/ndk/index.html)
  Check and set the ANDROID_NDK_ROOT enviroment variable.

- Apache ANT (http://ant.apache.org/bindownload.cgi)
  Check and set the ANT_HOME enviroment variable.

- If you're under Windows, you'll need cygwin (http://www.cygwin.com/).
  For setup details see for example this: http://www.pocketmagic.net/?p=1332
  If I remember correctly, the 'autotools' package is needed as well.
  Also, when under Vista or higher, you might need to set permissions with
  chmod (for example: chmod 777 -R *) on these directories:
  <wx-dir>/include/android (because of setup.h being copied to <wx-dir>/lib...)
  <wx-dir>/lib/android_lib (when building an app using wx libs)
  <android-ndk-dir>/sources/cxx-stl (when using stl libs)
  Background: 'cp' (cygwin's file copy command) doesn't handle Windows
  permissions, and files have no posix permissions by default, so copied files
  will have no permissions (they won't even be readable).

- wxWidgets 2.9 trunk from SVN + the wxAndroid patch.


Building wxWidgets:

- Set your target API level in <wx-dir>/build/android/jni/Application.mk
  Alternatively, you can specify it when building (see below).
- Go to <wx-dir>/build/android
  Use the cygwin prompt if under Windows.
- Issue this command:
  ndk-build
  Or, if you want to specify the target API level here:
  ndk-build TARGET_PLATFORM=android-9
- You need to manually copy the wx libraries from
  <wx-dir>/build/android/obj/local/armeabi
  to their standard place, which is:
  <wx-dir>/lib/android_lib


Sample app:

Well, there is no real sample yet, but you can check out android makefiles for
unit tests, which can be found under <wx-dir>/tests/jni.
Please note that unit tests will not yet compile because of errors in test.cpp
when compiling for android.




Compiling with vs-android
=========================

You should have all these (see previous section for missing details):

- Visual C++ 2010 (or Visual Studio 2010)
  You need version 2010 (it has MSBuild support for native code). The
  free Express edition will do fine.
  (http://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-cpp-express)
  
- Java SDK
  
- Android SDK (http://developer.android.com/sdk/index.html)

- Android NDK (http://developer.android.com/sdk/ndk/index.html)

- Apache ANT (http://ant.apache.org/bindownload.cgi)

- vs-android (http://code.google.com/p/vs-android/downloads/list)
  Instructions: http://code.google.com/p/vs-android/wiki/Installation

- wxWidgets 2.9 trunk from SVN + the wxAndroid patch.


Building wxWidgets:

- Go to <wx-dir>\build\android\
- Open wx_vc10.sln (don't panic if doubleclick doesn't work, just use
  drag-and-drop or the menu/toolbar in Visual Studio).
- Decide whether you'd like a debug or a release lib. At this early stage, I
  think it doesn't really matter what you choose.
- Inside Visual Studio, in Solution Explorer (usually the left pane),
  right-click the project 'base' and click properties, go to
  Configuration Properties / General / Target Android API level
  and set it accordingly.
- Do the same for project 'net', 'jpeg' and 'xml'.
- Right-click the project 'base' and click build.
- When finished, do the same for project 'net', 'jpeg' and 'xml'.
- Ready! You should have wxbase.a, wxnet.a, wxjpeg.a and wxxml.a libraries
  in <wx-dir>\lib\android\ (or wxbased.a wxnetd.a wxjpeg.a and xmld.a if doing
  a debug build).


Sample app:

Sorry, there is no sample app yet which can be compiled using vs-android.




Got problems?
=============

There is lot of helpful info on the vs-android page:
http://code.google.com/p/vs-android/

If you get heap errors while building, add the following enviroment variable:
_JAVA_OPTIONS=-Xmx512M
In theory, it's possible to add this setting inside VS under project's
Configuration Properties / Ant Build, but that didn't work for me.

If using Visual C++, and deploying to the emulator never finishes, issue the
following command from the command line in the adb dir: 'adb kill-server'.
Probably you also will have to kill and restart Visual Studio. You might need
to repeat this multiple times, but once it starts working, it works reliable.

When you build under cygwin and you get 'permission denied' errors, check the
section about cygwin above, under 'Compiling - with the standalone toolchain'.

When building with the standalone toolchain, you can get a more verbose output:
ndk-build V=1
For example, you'll see the compiler's command line parameters.




2012.05.30.
