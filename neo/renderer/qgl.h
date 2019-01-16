/*
===========================================================================

Doom 3 GPL Source Code
Copyright (C) 1999-2011 id Software LLC, a ZeniMax Media company.

This file is part of the Doom 3 GPL Source Code ("Doom 3 Source Code").

Doom 3 Source Code is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Doom 3 Source Code is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Doom 3 Source Code.  If not, see <http://www.gnu.org/licenses/>.

In addition, the Doom 3 Source Code is also subject to certain additional terms. You should have received a copy of these additional terms immediately following the terms and conditions of the GNU General Public License which accompanied the Doom 3 Source Code.  If not, please request a copy in writing from id Software at the address below.

If you have questions concerning this license or the applicable additional terms, you may contact in writing id Software LLC, c/o ZeniMax Media Inc., Suite 120, Rockville, Maryland 20850 USA.

===========================================================================
*/
/*
** QGL.H
*/

#ifndef __QGL_H__
#define __QGL_H__

#ifdef USEREGAL
#ifndef GLAPI
#define GLAPI extern
#endif

#ifndef GLAPIENTRY
#define GLAPIENTRY
#endif

#ifndef APIENTRY
#define APIENTRY GLAPIENTRY
#endif

/* "P" suffix to be used for a pointer to a function */
#ifndef APIENTRYP
#define APIENTRYP APIENTRY *
#endif

#ifndef GLAPIENTRYP
#define GLAPIENTRYP GLAPIENTRY *
#endif
#include <GL/Regal.h>

#else
#include <SDL_opengl.h>
#endif

typedef void (*GLExtension_t)(void);

#ifdef __cplusplus
	extern "C" {
#endif

GLExtension_t GLimp_ExtensionPointer( const char *name );

#ifdef __cplusplus
	}
#endif

// declare qgl functions
#define QGLPROC(name, rettype, args) extern rettype (APIENTRYP q##name) args;
#include "renderer/qgl_proc.h"

// multitexture
extern	void ( APIENTRY * qglActiveTextureARB )( GLenum texture );
extern	void ( APIENTRY * qglClientActiveTextureARB )( GLenum texture );

// ARB_vertex_buffer_object
extern PFNGLBINDBUFFERARBPROC qglBindBufferARB;
extern PFNGLGENBUFFERSARBPROC qglGenBuffersARB;
extern PFNGLBUFFERDATAARBPROC qglBufferDataARB;
extern PFNGLBUFFERSUBDATAARBPROC qglBufferSubDataARB;

// GLSL Shaders
extern PFNGLENABLEVERTEXATTRIBARRAYPROC    qglEnableVertexAttribArray;
extern PFNGLDISABLEVERTEXATTRIBARRAYPROC   qglDisableVertexAttribArray;
extern PFNGLVERTEXATTRIBPOINTERPROC        qglVertexAttribPointer;
extern PFNGLUSEPROGRAMPROC                 qglUseProgram;
extern PFNGLUNIFORM1FVPROC                 qglUniform1fv;
extern PFNGLUNIFORM4FVPROC                 qglUniform4fv;
extern PFNGLUNIFORMMATRIX4FVPROC           qglUniformMatrix4fv;
extern PFNGLLINKPROGRAMPROC								 qglLinkProgram;
extern PFNGLGETPROGRAMIVPROC							 qglGetProgramiv;
extern PFNGLGETPROGRAMINFOLOGPROC					 qglGetShaderInfoLog;
extern PFNGLBINDATTRIBLOCATIONPROC         qglBindAttribLocation;
extern PFNGLATTACHSHADERPROC               qglAttachShader;
extern PFNGLCREATESHADERPROC               qglCreateShader;
extern PFNGLSHADERSOURCEPROC               qglShaderSource;
extern PFNGLCOMPILESHADERPROC              qglCompileShader;
extern PFNGLGETUNIFORMLOCATIONPROC         qglGetUniformLocation;
extern PFNGLCREATEPROGRAMPROC              qglCreateProgram;
extern PFNGLVALIDATEPROGRAMPROC            qglValidateProgram;
extern PFNGLGETATTRIBLOCATIONPROC          qglGetAttribLocation;
extern PFNGLUNIFORM1IPROC                  qglUniform1i;

#endif
