#pragma once

#include <jni.h>
#include <android/api-level.h>
#include <android_native_app_glue.h>

namespace nCine
{
	/// The class for setting up JNI and initialize requests classes
	class AndroidJniHelper
	{
	public:
		inline static unsigned int sdkVersion() { return sdkVersion_; }

		static JNIEnv *jniEnv;

	private:
		static JavaVM* javaVM_;
		static unsigned int sdkVersion_;

		/// Attaches the Java virtual machine to make use of JNI
		static void attachJVM(struct android_app* state);
		/// Detaches the Java virtual machine
		static void detachJVM();
		static void initClasses();

		/// Static class, no constructor
		AndroidJniHelper();
		/// Static class, no copy constructor
		AndroidJniHelper(const AndroidJniHelper& other);
		/// Static class, no assignement operator
		AndroidJniHelper& operator=(const AndroidJniHelper& other);

		friend class AndroidApplication;
	};

	/// The base class for the classes handling JNI requests to the Android API
	class AndroidJniClass
	{
	public:
		AndroidJniClass()
			: javaObject_(nullptr) {}
		explicit AndroidJniClass(jobject javaObject);
		virtual ~AndroidJniClass();

		/// Move constructor
		AndroidJniClass(AndroidJniClass&& other);
		/// Move assignment operator
		AndroidJniClass& operator=(AndroidJniClass&& other);

		/// Deleted copy constructor
		AndroidJniClass(const AndroidJniClass&) = delete;
		/// Deleted assignment operator
		AndroidJniClass& operator=(const AndroidJniClass&) = delete;

		inline bool isNull() const {
			return javaObject_ == nullptr;
		}

		static jclass findClass(const char* name);
		static jmethodID getStaticMethodID(jclass javaClass, const char* name, const char* signature);
		static jmethodID getMethodID(jclass javaClass, const char* name, const char* signature);
		static jfieldID getStaticFieldID(jclass javaClass, const char* name, const char* signature);

	protected:
		jobject javaObject_;

		friend class AndroidJniHelper;
	};

	/// A class to handle JNI requests to `android.os.Build.VERSION`
	class AndroidJniClass_Version : public AndroidJniClass
	{
	public:
		static void init();
		static int sdkInt();

	private:
		static jclass javaClass_;
		static jfieldID fidSdkInt_;
	};

	/// A class to handle JNI requests to `android.view.InputDevice.MotionRange`
	class AndroidJniClass_MotionRange : public AndroidJniClass
	{
	public:
		explicit AndroidJniClass_MotionRange(jobject javaObject);

	private:
		static jclass javaClass_;
	};

	/// A class to handle JNI requests to `android.view.InputDevice`
	class AndroidJniClass_InputDevice : public AndroidJniClass
	{
	public:
		static void init();
		explicit AndroidJniClass_InputDevice(jobject javaObject)
			: AndroidJniClass(javaObject) {}
		static AndroidJniClass_InputDevice getDevice(int deviceId);
		static int getDeviceIds(int* destination, int maxSize);
		int getName(char* destination, int maxStringSize) const;
		int getProductId() const;
		int getVendorId() const;
		AndroidJniClass_MotionRange getMotionRange(int axis) const;
		int getSources() const;
		void hasKeys(const int* buttons, const int length, bool* bools) const;

	private:
		static jclass javaClass_;
		static jmethodID midGetDevice_;
		static jmethodID midGetDeviceIds_;
		static jmethodID midGetName_;
		static jmethodID midGetVendorId_;
		static jmethodID midGetProductId_;
		static jmethodID midGetMotionRange_;
		static jmethodID midGetSources_;
		static jmethodID midHasKeys_;
	};

	/// A class to handle JNI requests to `android.view.KeyCharacterMap`
	class AndroidJniClass_KeyCharacterMap : public AndroidJniClass
	{
	public:
		static void init();
		explicit AndroidJniClass_KeyCharacterMap(jobject javaObject)
			: AndroidJniClass(javaObject) {}
		static bool deviceHasKey(int button);

	private:
		static jclass javaClass_;
		static jmethodID midDeviceHasKey_;
	};

	/// A class to handle JNI requests to `android.view.KeyEvent`
	class AndroidJniClass_KeyEvent : public AndroidJniClass
	{
	public:
		static void init();

		AndroidJniClass_KeyEvent(int action, int code);
		int getUnicodeChar(int metaState) const;
		inline int getUnicodeChar() const {
			return getUnicodeChar(0);
		}
		bool isPrintingKey() const;

	private:
		static jclass javaClass_;
		static jmethodID midConstructor_;
		static jmethodID midGetUnicodeCharMetaState_;
		static jmethodID midGetUnicodeChar_;
		static jmethodID midIsPrintingKey_;
	};
	
	/// A class to handle JNI requests to `android.view.Display.Mode`
	class AndroidJniClass_DisplayMode : public AndroidJniClass
	{
	public:
		static void init();

		AndroidJniClass_DisplayMode()
			: AndroidJniClass() {}
		explicit AndroidJniClass_DisplayMode(jobject javaObject)
			: AndroidJniClass(javaObject) {}

		int getPhysicalHeight() const;
		int getPhysicalWidth() const;
		float getRefreshRate() const;

	private:
		static jclass javaClass_;
		static jmethodID midGetPhysicalHeight_;
		static jmethodID midGetPhysicalWidth_;
		static jmethodID midGetRefreshRate_;
	};

	/// A class to handle JNI requests to `android.view.Display`
	class AndroidJniClass_Display : public AndroidJniClass
	{
	public:
		static void init();

		AndroidJniClass_Display()
			: AndroidJniClass() {}
		explicit AndroidJniClass_Display(jobject javaObject)
			: AndroidJniClass(javaObject) {}

		AndroidJniClass_DisplayMode getMode() const;
		int getName(char* destination, int maxStringSize) const;
		int getSupportedModes(AndroidJniClass_DisplayMode* destination, int maxSize) const;

	private:
		static jclass javaClass_;
		static jmethodID midGetMode_;
		static jmethodID midGetName_;
		static jmethodID midGetSupportedModes_;
	};

	/// A class to handle JNI requests to `android.app.Activity`
	class AndroidJniWrap_Activity
	{
	public:
		static void init(struct android_app* state);
		static void finishAndRemoveTask();

	private:
		static jobject activityObject_;
		static jmethodID midFinishAndRemoveTask_;
	};

	/// A class to handle JNI requests to `android.view.inputmethod.InputMethodManager`
	class AndroidJniWrap_InputMethodManager
	{
	public:
		static void init(struct android_app* state);
		static void shutdown();

		static void toggleSoftInput();

	private:
		static jobject inputMethodManagerObject_;
		static jmethodID midToggleSoftInput_;

		static const int SHOW_IMPLICIT = 1;
		static const int HIDE_IMPLICIT_ONLY = 1;
	};

	/// A class to handle JNI requests to `android.hardware.display.DisplayManager`
	class AndroidJniWrap_DisplayManager
	{
	public:
		static void init(struct android_app* state);
		static void shutdown();

		static AndroidJniClass_Display getDisplay(int displayId);
		static int getNumDisplays();
		static int getDisplays(AndroidJniClass_Display* destination, int maxSize);

	private:
		static jobject displayManagerObject_;
		static jmethodID midGetDisplay_;
		static jmethodID midGetDisplays_;
	};

}
