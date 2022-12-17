if(MSVC OR APPLE OR EMSCRIPTEN)
	set(README_INSTALL_DESTINATION ".")
	set(DATA_INSTALL_DESTINATION "Content")
	set(SHADERS_INSTALL_DESTINATION "Content/Shaders")
else()
	set(PACKAGE_DIRECTORY ${NCINE_APP_NAME})
	if(NCINE_LINUX_PACKAGE)
		set(PACKAGE_DIRECTORY ${NCINE_LINUX_PACKAGE})
	endif()
	set(README_INSTALL_DESTINATION "share/doc/${PACKAGE_DIRECTORY}")
	set(DATA_INSTALL_DESTINATION "share/${PACKAGE_DIRECTORY}/Content")
	set(SHADERS_INSTALL_DESTINATION "share/${PACKAGE_DIRECTORY}/Content/Shaders")
endif()

#get_target_property(CPACK_EXECUTABLE_NAME ${NCINE_APP} OUTPUT_NAME)
set(CPACK_EXECUTABLE_NAME ${NCINE_APP})
if(WIN32 AND NOT WINDOWS_PHONE AND NOT WINDOWS_STORE)
	set(CPACK_EXECUTABLE_NAME "Jazz2")
endif()

set(CPACK_PACKAGE_VENDOR ${NCINE_APP_VENDOR})
set(CPACK_PACKAGE_DESCRIPTION ${NCINE_APP_DESCRIPTION})
#set(CPACK_PACKAGE_HOMEPAGE_URL ${NCINE_HOMEPAGE})
set(CPACK_PACKAGE_VERSION ${NCINE_VERSION})
set(CPACK_PACKAGE_VERSION_MAJOR ${NCINE_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${NCINE_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${NCINE_VERSION_PATCH})

set(CPACK_PACKAGE_INSTALL_DIRECTORY "${NCINE_APP_NAME}")
if(EXISTS "${CMAKE_SOURCE_DIR}/LICENSE")
	set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")
endif()
set(CPACK_PACKAGE_CHECKSUM MD5)

string(TIMESTAMP CPACK_PACKAGE_VERSION_YEAR "%Y")

if(MSVC)
	if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
		set(CMAKE_INSTALL_PREFIX "C:/Games/${NCINE_APP_NAME}/" CACHE PATH "..." FORCE)
	endif()
	message(STATUS "Default installation path: ${CMAKE_INSTALL_PREFIX}")

	set(CPACK_GENERATOR NSIS ZIP)
	set(CPACK_NSIS_MUI_ICON "${NCINE_SOURCE_DIR}/Icons/Main.ico")
	set(CPACK_NSIS_COMPRESSOR "/SOLID lzma")
	# Custom NSIS commands needed in order to set the "Start in" property of the start menu shortcut
	set(CPACK_NSIS_CREATE_ICONS_EXTRA
		"CreateShortCut '$SMPROGRAMS\\\\$STARTMENU_FOLDER\\\\${NCINE_APP_NAME}.lnk' '$INSTDIR\\\\${CPACK_EXECUTABLE_NAME}.exe'
		CreateShortCut '$DESKTOP\\\\${NCINE_APP_NAME}.lnk' '$INSTDIR\\\\${CPACK_EXECUTABLE_NAME}.exe'")
	set(CPACK_NSIS_DELETE_ICONS_EXTRA
		"Delete '$SMPROGRAMS\\\\$MUI_TEMP\\\\${NCINE_APP_NAME}.lnk'
		Delete '$DESKTOP\\\\${NCINE_APP_NAME}.lnk'")

	if(NCINE_INSTALL_SYSLIBS)
		include(InstallRequiredSystemLibraries)
	endif()

	set(NCINE_SYSTEM_NAME "Win64")
	if("${CMAKE_GENERATOR}" STREQUAL "Visual Studio 17 2022")
		set(NCINE_COMPILER "VS2022")
	elseif("${CMAKE_GENERATOR}" STREQUAL "Visual Studio 16 2019")
		set(NCINE_COMPILER "VS2019")
	elseif("${CMAKE_GENERATOR}" STREQUAL "Visual Studio 15 2017")
		set(NCINE_COMPILER "VS2017")
	endif()
elseif(APPLE)
	set(CPACK_GENERATOR "Bundle")
	set(CPACK_BUNDLE_NAME ${NCINE_APP_NAME})
	set(FRAMEWORKS_INSTALL_DESTINATION "../Frameworks")

	configure_file(${NCINE_ROOT}/Info.plist.in ${CMAKE_BINARY_DIR}/Info.plist @ONLY)
	set(CPACK_BUNDLE_PLIST ${CMAKE_BINARY_DIR}/Info.plist)

	file(RELATIVE_PATH RELPATH_TO_BIN ${CMAKE_INSTALL_PREFIX}/MacOS ${CMAKE_INSTALL_PREFIX}/Resources/bin)
	file(WRITE ${CMAKE_BINARY_DIR}/bundle_executable "#!/usr/bin/env sh\ncd \"$(dirname \"$0\")\" \ncd ${RELPATH_TO_BIN} && ./${CPACK_EXECUTABLE_NAME}")
	install(FILES ${CMAKE_BINARY_DIR}/bundle_executable DESTINATION ../MacOS/ RENAME ${CPACK_BUNDLE_NAME}
		PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/1024px.png)
		add_custom_command(
			OUTPUT ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset
			COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset
			COMMAND ${CMAKE_COMMAND} -E copy_if_different ${NCINE_SOURCE_DIR}/Icons/1024px.png ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_512x512@2x.png
			COMMAND sips -z 512 512 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_512x512.png
			COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_512x512.png ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_256x256@2x.png
			COMMAND sips -z 256 256 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_256x256.png
			COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_256x256.png ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_128x128@2x.png
			COMMAND sips -z 128 128 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_128x128.png
			COMMAND sips -z 64 64 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_32x32@2x.png
			COMMAND sips -z 32 32 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_32x32.png
			COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_32x32.png ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_16x16@2x.png
			COMMAND sips -z 16 16 ${NCINE_SOURCE_DIR}/Icons/1024px.png --out ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset/icon_16x16.png
			COMMAND iconutil --convert icns --output ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.icns ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset)
		add_custom_target(iconutil_convert ALL DEPENDS ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.iconset)
		set(CPACK_BUNDLE_ICON ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.icns)
	endif()
elseif(EMSCRIPTEN)
	if(CMAKE_HOST_WIN32)
		set(CPACK_GENERATOR ZIP)
	else()
		set(CPACK_GENERATOR TGZ)
	endif()
elseif(UNIX)
	set(CPACK_GENERATOR TGZ)
	set(ICONS_INSTALL_DESTINATION share/icons/hicolor)

	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/1024px.png)
		install(FILES ${NCINE_SOURCE_DIR}/Icons/1024px.png DESTINATION ${ICONS_INSTALL_DESTINATION}/1024x1024/apps/ RENAME ${CPACK_EXECUTABLE_NAME}.png COMPONENT data)
	endif()
	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/192px.png)
		install(FILES ${NCINE_SOURCE_DIR}/Icons/192px.png DESTINATION ${ICONS_INSTALL_DESTINATION}/192x192/apps/ RENAME ${CPACK_EXECUTABLE_NAME}.png COMPONENT data)
	endif()
	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/96px.png)
		install(FILES ${NCINE_SOURCE_DIR}/Icons/96px.png DESTINATION ${ICONS_INSTALL_DESTINATION}/96x96/apps/ RENAME ${CPACK_EXECUTABLE_NAME}.png COMPONENT data)
	endif()
	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/72px.png)
		install(FILES ${NCINE_SOURCE_DIR}/Icons/72px.png DESTINATION ${ICONS_INSTALL_DESTINATION}/72x72/apps/ RENAME ${CPACK_EXECUTABLE_NAME}.png COMPONENT data)
	endif()
	if(EXISTS ${NCINE_SOURCE_DIR}/Icons/48px.png)
		install(FILES ${NCINE_SOURCE_DIR}/Icons/48px.png DESTINATION ${ICONS_INSTALL_DESTINATION}/48x48/apps/ RENAME ${CPACK_EXECUTABLE_NAME}.png COMPONENT data)
	endif()

	set(NCINE_DESKTOP_FILE ${NCINE_REVERSE_DNS}.desktop)
	configure_file(${NCINE_ROOT}/project.desktop ${CMAKE_BINARY_DIR}/${NCINE_DESKTOP_FILE} @ONLY)
	install(FILES ${CMAKE_BINARY_DIR}/${NCINE_DESKTOP_FILE} DESTINATION share/applications)

	set(NCINE_SYSTEM_NAME "Linux")
	if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
		set(NCINE_COMPILER "GCC")
	elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		set(NCINE_COMPILER "Clang")
	endif()
elseif(MINGW)
	set(CPACK_GENERATOR TGZ)

	set(NCINE_SYSTEM_NAME "MinGW")
	if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
		set(NCINE_COMPILER "GCC")
	elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		set(NCINE_COMPILER "Clang")
	endif()
endif()

# Custom override of CPack package name
if(DEFINED NCINE_SYSTEM_NAME)
	if(DEFINED NCINE_COMPILER)
		set(CPACK_PACKAGE_FILE_NAME ${NCINE_APP_NAME}-${CPACK_PACKAGE_VERSION}-${NCINE_SYSTEM_NAME}-${NCINE_COMPILER})
	else()
		set(CPACK_PACKAGE_FILE_NAME ${NCINE_APP_NAME}-${CPACK_PACKAGE_VERSION}-${NCINE_SYSTEM_NAME})
	endif()
endif()

include(CPack)

install(TARGETS ${NCINE_APP} RUNTIME DESTINATION ".")
install(FILES README.md DESTINATION ${README_INSTALL_DESTINATION})
if((MSVC OR APPLE) AND EXISTS "${CMAKE_SOURCE_DIR}/LICENSE")
	install(FILES LICENSE DESTINATION . RENAME LICENSE.txt)
endif()

if(NOT EMSCRIPTEN)
	install(DIRECTORY ${NCINE_ROOT}/Content/ DESTINATION ${DATA_INSTALL_DESTINATION})
else()
	install(FILES ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.html DESTINATION ".")
	install(FILES ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.data DESTINATION ".")
	install(FILES ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.wasm DESTINATION ".")
	if(EXISTS ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.worker.js)
		install(FILES ${CMAKE_BINARY_DIR}/${CPACK_EXECUTABLE_NAME}.worker.js DESTINATION ".")
	endif()
	if(EXISTS ${CMAKE_BINARY_DIR}/favicon.ico)
		install(FILES ${CMAKE_BINARY_DIR}/favicon.ico DESTINATION ".")
	endif()
endif()
install(FILES ${NCINE_ROOT}/README.md DESTINATION ${DATA_INSTALL_DESTINATION})
if(IS_DIRECTORY ${NCINE_SHADERS_DIR})
	install(DIRECTORY ${NCINE_SHADERS_DIR} DESTINATION ${SHADERS_INSTALL_DESTINATION})
endif()

if(MSVC)
	if(NCINE_DYNAMIC_LIBRARY)
		install(FILES ${NCINE_LOCATION} DESTINATION ".")
	endif()

	if(EXISTS ${NCINE_CONFIG_H})
		if(ANGLE_FOUND AND NCINE_WITH_ANGLE)
			get_target_property(EGL_IMPORTED_LOCATION EGL::EGL IMPORTED_LOCATION)
			install(FILES ${EGL_IMPORTED_LOCATION} DESTINATION ".")
			get_target_property(GLES_IMPORTED_LOCATION OpenGLES::GLES IMPORTED_LOCATION)
			install(FILES ${GLES_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		if(GLEW_FOUND AND NCINE_WITH_GLEW)
			get_target_property(GLEW_IMPORTED_LOCATION GLEW::GLEW IMPORTED_LOCATION)
			install(FILES ${GLEW_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		if(GLFW_FOUND AND NCINE_WITH_GLFW)
			get_target_property(GLFW_IMPORTED_LOCATION GLFW::GLFW IMPORTED_LOCATION)
			install(FILES ${GLFW_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		if(SDL2_FOUND AND NCINE_WITH_SDL)
			get_target_property(SDL2_IMPORTED_LOCATION SDL2::SDL2 IMPORTED_LOCATION)
			install(FILES ${SDL2_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		#if(PNG_FOUND AND NCINE_WITH_PNG)
		#	get_target_property(ZLIB_IMPORTED_LOCATION ZLIB::ZLIB IMPORTED_LOCATION)
		#	install(FILES ${ZLIB_IMPORTED_LOCATION} DESTINATION ".")
		#	get_target_property(PNG_IMPORTED_LOCATION PNG::PNG IMPORTED_LOCATION)
		#	install(FILES ${PNG_IMPORTED_LOCATION} DESTINATION ".")
		#endif()
		if(LIBDEFLATE_FOUND)
			get_target_property(LIBDEFLATE_IMPORTED_LOCATION libdeflate::libdeflate IMPORTED_LOCATION)
			install(FILES ${LIBDEFLATE_IMPORTED_LOCATION} DESTINATION ".")
		elseif(ZLIB_FOUND)
			get_target_property(ZLIB_IMPORTED_LOCATION ZLIB::ZLIB IMPORTED_LOCATION)
			install(FILES ${ZLIB_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		
		if(WEBP_FOUND AND NCINE_WITH_WEBP)
			get_target_property(WEBP_IMPORTED_LOCATION WebP::WebP IMPORTED_LOCATION)
			install(FILES ${WEBP_IMPORTED_LOCATION} DESTINATION ".")
		endif()
		if(OPENAL_FOUND AND NCINE_WITH_AUDIO)
			get_target_property(OPENAL_IMPORTED_LOCATION OpenAL::AL IMPORTED_LOCATION)
			install(FILES ${OPENAL_IMPORTED_LOCATION} DESTINATION ".")

			if(VORBIS_FOUND AND NCINE_WITH_VORBIS)
				get_target_property(OGG_IMPORTED_LOCATION Ogg::Ogg IMPORTED_LOCATION)
				install(FILES ${OGG_IMPORTED_LOCATION} DESTINATION ".")
				get_target_property(VORBIS_IMPORTED_LOCATION Vorbis::Vorbis IMPORTED_LOCATION)
				install(FILES ${VORBIS_IMPORTED_LOCATION} DESTINATION ".")
				get_target_property(VORBISFILE_IMPORTED_LOCATION Vorbis::Vorbisfile IMPORTED_LOCATION)
				install(FILES ${VORBISFILE_IMPORTED_LOCATION} DESTINATION ".")
			endif()
			
			if(OPENMPT_FOUND AND NOT OPENMPT_DYNAMIC_LINK)
				get_target_property(OPENMPT_IMPORTED_LOCATION libopenmpt::libopenmpt IMPORTED_LOCATION)
				install(FILES ${OPENMPT_IMPORTED_LOCATION} DESTINATION ".")
			endif()
		endif()
		if(LUA_FOUND AND NCINE_WITH_LUA)
			get_target_property(LUA_IMPORTED_LOCATION Lua::Lua IMPORTED_LOCATION)
			install(FILES ${LUA_IMPORTED_LOCATION} DESTINATION ".")
		endif()
	else()
		install(DIRECTORY ${MSVC_BINDIR}/ DESTINATION "." FILES_MATCHING PATTERN "*.dll")
	endif()
elseif(APPLE)
	file(RELATIVE_PATH RELPATH_TO_FRAMEWORKS ${CMAKE_INSTALL_PREFIX}/lib ${CMAKE_INSTALL_PREFIX}/${FRAMEWORKS_INSTALL_DESTINATION})
	set_target_properties(${NCINE_APP} PROPERTIES INSTALL_RPATH "@loader_path/${RELPATH_TO_FRAMEWORKS}")

	if(GLEW_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/glew.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
	if(GLFW_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/glfw.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
	if(SDL2_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/sdl2.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
	if(PNG_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/zlib.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/png.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
	if(WEBP_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/webp.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
	if(OPENAL_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/openal.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})

		if(VORBIS_FOUND)
			install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/ogg.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
			install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/vorbis.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
			install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/vorbisfile.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
		endif()
	endif()
	if(LUA_FOUND)
		install(DIRECTORY ${CMAKE_FRAMEWORK_PATH}/lua.framework DESTINATION ${FRAMEWORKS_INSTALL_DESTINATION})
	endif()
endif()