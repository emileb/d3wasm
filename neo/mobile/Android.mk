LOCAL_PATH := $(call my-dir)/../


include $(CLEAR_VARS)

LOCAL_MODULE := doom3


LOCAL_C_INCLUDES :=  \
$(TOP_DIR) \
$(TOP_DIR)/Doom/d3es/neo/mobile \
$(SDL_INCLUDE_PATHS) \
$(TOP_DIR)/AudioLibs_OpenTouch/openal/include/ \
$(TOP_DIR)/AudioLibs_OpenTouch/liboggvorbis/include \
$(TOP_DIR)/MobileTouchControls \
$(TOP_DIR)/Clibs_OpenTouch \
$(TOP_DIR)/Clibs_OpenTouch/idtech1 \



LOCAL_CPPFLAGS :=  -DUSE_GLES2 -O2 -fno-unsafe-math-optimizations -fno-math-errno -fno-trapping-math -fomit-frame-pointer -fvisibility=hidden

LOCAL_CPPFLAGS += -std=gnu++11 -D__DOOM_DLL__ -frtti -fexceptions  -Wno-error=format-security


LOCAL_CPPFLAGS += -Wno-sign-compare \
                  -Wno-switch \
                  -Wno-format-security \

LOCAL_CPPFLAGS += -DD3ES -DENGINE_NAME=\"d3es\"


# Not avaliable in Android untill N
LOCAL_CFLAGS := -DIOAPI_NO_64


SRC_ANDROID = mobile/game_interface.cpp \
              ../../../Clibs_OpenTouch/idtech1/android_jni.cpp \
              ../../../Clibs_OpenTouch/idtech1/touch_interface.cpp \


src_renderer = \
	renderer/Cinematic.cpp \
	renderer/GuiModel.cpp \
	renderer/Image_files.cpp \
	renderer/Image_init.cpp \
	renderer/Image_load.cpp \
	renderer/Image_process.cpp \
	renderer/Image_program.cpp \
	renderer/Interaction.cpp \
	renderer/Material.cpp \
	renderer/MegaTexture.cpp \
	renderer/Model.cpp \
	renderer/ModelDecal.cpp \
	renderer/ModelManager.cpp \
	renderer/ModelOverlay.cpp \
	renderer/Model_beam.cpp \
	renderer/Model_ase.cpp \
	renderer/Model_liquid.cpp \
	renderer/Model_lwo.cpp \
	renderer/Model_ma.cpp \
	renderer/Model_md3.cpp \
	renderer/Model_md5.cpp \
	renderer/Model_prt.cpp \
	renderer/Model_sprite.cpp \
	renderer/RenderEntity.cpp \
	renderer/RenderSystem.cpp \
	renderer/RenderSystem_init.cpp \
	renderer/RenderWorld.cpp \
	renderer/RenderWorld_demo.cpp \
	renderer/RenderWorld_load.cpp \
	renderer/RenderWorld_portals.cpp \
	renderer/VertexCache.cpp \
	renderer/draw_arb2.cpp \
	renderer/draw_common.cpp \
	renderer/tr_backend.cpp \
	renderer/tr_deform.cpp \
	renderer/tr_font.cpp \
	renderer/tr_guisurf.cpp \
	renderer/tr_light.cpp \
	renderer/tr_lightrun.cpp \
	renderer/tr_main.cpp \
	renderer/tr_orderIndexes.cpp \
	renderer/tr_polytope.cpp \
	renderer/tr_render.cpp \
	renderer/tr_rendertools.cpp \
	renderer/tr_shadowbounds.cpp \
	renderer/tr_stencilshadow.cpp \
	renderer/tr_subview.cpp \
	renderer/tr_trace.cpp \
	renderer/tr_trisurf.cpp \
	renderer/tr_turboshadow.cpp \

src_framework = \
	framework/CVarSystem.cpp \
	framework/CmdSystem.cpp \
	framework/Common.cpp \
	framework/Compressor.cpp \
	framework/Console.cpp \
	framework/DemoFile.cpp \
	framework/DeclAF.cpp \
	framework/DeclEntityDef.cpp \
	framework/DeclFX.cpp \
	framework/DeclManager.cpp \
	framework/DeclParticle.cpp \
	framework/DeclPDA.cpp \
	framework/DeclSkin.cpp \
	framework/DeclTable.cpp \
	framework/EditField.cpp \
	framework/EventLoop.cpp \
	framework/File.cpp \
	framework/FileSystem.cpp \
	framework/KeyInput.cpp \
	framework/UsercmdGen.cpp \
	framework/Session_menu.cpp \
	framework/Session.cpp \
	framework/async/AsyncClient.cpp \
	framework/async/AsyncNetwork.cpp \
	framework/async/AsyncServer.cpp \
	framework/async/MsgChannel.cpp \
	framework/async/NetworkSystem.cpp \
	framework/async/ServerScan.cpp \
	framework/minizip/ioapi.c \
	framework/minizip/unzip.cpp \


src_cm = \
    cm/CollisionModel_contacts.cpp \
	cm/CollisionModel_contents.cpp \
	cm/CollisionModel_debug.cpp \
	cm/CollisionModel_files.cpp \
	cm/CollisionModel_load.cpp \
	cm/CollisionModel_rotate.cpp \
	cm/CollisionModel_trace.cpp \
	cm/CollisionModel_translate.cpp \



src_dmap = \
	tools/compilers/dmap/dmap.cpp \
	tools/compilers/dmap/facebsp.cpp \
	tools/compilers/dmap/gldraw.cpp \
	tools/compilers/dmap/glfile.cpp \
	tools/compilers/dmap/leakfile.cpp \
	tools/compilers/dmap/map.cpp \
	tools/compilers/dmap/optimize.cpp \
	tools/compilers/dmap/output.cpp \
	tools/compilers/dmap/portals.cpp \
	tools/compilers/dmap/shadowopt3.cpp \
	tools/compilers/dmap/tritjunction.cpp \
	tools/compilers/dmap/tritools.cpp \
	tools/compilers/dmap/ubrush.cpp \
	tools/compilers/dmap/usurface.cpp \



src_aas = \
	tools/compilers/aas/AASBuild.cpp \
	tools/compilers/aas/AASBuild_file.cpp \
	tools/compilers/aas/AASBuild_gravity.cpp \
	tools/compilers/aas/AASBuild_ledge.cpp \
	tools/compilers/aas/AASBuild_merge.cpp \
	tools/compilers/aas/AASCluster.cpp \
	tools/compilers/aas/AASFile.cpp \
	tools/compilers/aas/AASFile_optimize.cpp \
	tools/compilers/aas/AASFile_sample.cpp \
	tools/compilers/aas/AASReach.cpp \
	tools/compilers/aas/AASFileManager.cpp \
	tools/compilers/aas/Brush.cpp \
	tools/compilers/aas/BrushBSP.cpp \



src_roq = \
	tools/compilers/roqvq/NSBitmapImageRep.cpp \
	tools/compilers/roqvq/codec.cpp \
	tools/compilers/roqvq/roq.cpp \
	tools/compilers/roqvq/roqParam.cpp \


src_renderbump = \
	tools/compilers/renderbump/renderbump.cpp \


src_snd = \
	sound/snd_cache.cpp \
	sound/snd_decoder.cpp \
	sound/snd_efxfile.cpp \
	sound/snd_emitter.cpp \
	sound/snd_shader.cpp \
	sound/snd_system.cpp \
	sound/snd_wavefile.cpp \
	sound/snd_world.cpp \



src_ui = \
	ui/BindWindow.cpp \
	ui/ChoiceWindow.cpp \
	ui/DeviceContext.cpp \
	ui/EditWindow.cpp \
	ui/FieldWindow.cpp \
	ui/GameBearShootWindow.cpp \
	ui/GameBustOutWindow.cpp \
	ui/GameSSDWindow.cpp \
	ui/GuiScript.cpp \
	ui/ListGUI.cpp \
	ui/ListWindow.cpp \
	ui/MarkerWindow.cpp \
	ui/RegExp.cpp \
	ui/RenderWindow.cpp \
	ui/SimpleWindow.cpp \
	ui/SliderWindow.cpp \
	ui/UserInterface.cpp \
	ui/Window.cpp \
	ui/Winvar.cpp \


src_idlib = \
	idlib/bv/Bounds.cpp \
	idlib/bv/Frustum.cpp \
	idlib/bv/Sphere.cpp \
	idlib/bv/Box.cpp \
	idlib/geometry/DrawVert.cpp \
	idlib/geometry/Winding2D.cpp \
	idlib/geometry/Surface_SweptSpline.cpp \
	idlib/geometry/Winding.cpp \
	idlib/geometry/Surface.cpp \
	idlib/geometry/Surface_Patch.cpp \
	idlib/geometry/TraceModel.cpp \
	idlib/geometry/JointTransform.cpp \
	idlib/hashing/CRC32.cpp \
	idlib/hashing/MD4.cpp \
	idlib/hashing/MD5.cpp \
	idlib/math/Angles.cpp \
	idlib/math/Lcp.cpp \
	idlib/math/Math.cpp \
	idlib/math/Matrix.cpp \
	idlib/math/Ode.cpp \
	idlib/math/Plane.cpp \
	idlib/math/Pluecker.cpp \
	idlib/math/Polynomial.cpp \
	idlib/math/Quat.cpp \
	idlib/math/Rotation.cpp \
	idlib/math/Simd.cpp \
	idlib/math/Simd_Generic.cpp \
	idlib/math/Simd_AltiVec.cpp \
	idlib/math/Simd_MMX.cpp \
	idlib/math/Simd_3DNow.cpp \
	idlib/math/Simd_SSE.cpp \
	idlib/math/Simd_SSE2.cpp \
	idlib/math/Simd_SSE3.cpp \
	idlib/math/Vector.cpp \
	idlib/BitMsg.cpp \
	idlib/LangDict.cpp \
	idlib/Lexer.cpp \
	idlib/Lib.cpp \
	idlib/containers/HashIndex.cpp \
	idlib/Dict.cpp \
	idlib/Str.cpp \
	idlib/Parser.cpp \
	idlib/MapFile.cpp \
	idlib/CmdArgs.cpp \
	idlib/Token.cpp \
	idlib/Base64.cpp \
	idlib/Timer.cpp \
	idlib/Heap.cpp \


src_sys_base = \
		sys/cpu.cpp \
		sys/threads.cpp \
		sys/events.cpp \
		sys/sys_local.cpp \
		sys/posix/posix_net.cpp \
		sys/posix/posix_main.cpp \
		sys/linux/main.cpp \


src_sys_core =\
		sys/glimp.cpp \



src_core = \
    	${src_renderer} \
    	$(src_framework) \
        ${src_cm} \
        ${src_dmap} \
        ${src_aas} \
        ${src_roq} \
        ${src_renderbump} \
        ${src_snd} \
        ${src_ui} \
        ${src_tools} \
        $(src_idlib) \


LOCAL_SRC_FILES = $(SRC_ANDROID) \
                  $(src_core) \
                  $(src_sys_base) \
                  $(src_sys_core) \




LOCAL_SHARED_LIBRARIES := openal touchcontrols core_shared SDL2 libvorbis libogg

LOCAL_STATIC_LIBRARIES := logwritter jpeg

LOCAL_LDLIBS :=  -llog -lm  -lEGL -lGLESv2
include $(BUILD_SHARED_LIBRARY)
