# Makefile for GLU for VMS
# contributed by Jouk Jansen  joukj@hrem.stm.tudelft.nl

.first
	define gl [---.include.gl]

.include [---]mms-config

##### MACROS #####

VPATH = RCS

INCDIR =([-.include],[.include],[.internals],[.libnurbs.internals],\
       [.libnurbs.interface],[.libnurbs.nurbtess])
LIBDIR = [---.lib]
CFLAGS = /include=$(INCDIR)/name=(as_is,short)/float=ieee/ieee=denorm

LU_OBJECTS=\
	[.libutil]error.obj,	\
	[.libutil]glue.obj,	\
	[.libutil]mipmap.obj,\
	[.libutil]project.obj,\
	[.libutil]quad.obj,	\
	[.libutil]registry.obj

LT_OBJECTS=[.libtess]dict.obj,	\
	[.libtess]geom.obj,	\
	[.libtess]memalloc.obj,\
	[.libtess]mesh.obj,	\
	[.libtess]normal.obj,\
	[.libtess]priorityq.obj,\
	[.libtess]render.obj,\
	[.libtess]sweep.obj,	\
	[.libtess]tess.obj,	\
	[.libtess]tessmono.obj

LI_OBJECTS=[.libnurbs.interface]bezierEval.obj,	\
	[.libnurbs.interface]bezierPatch.obj,	\
	[.libnurbs.interface]bezierPatchMesh.obj,	\
	[.libnurbs.interface]glcurveval.obj,	\
	[.libnurbs.interface]glinterface.obj

LI_OBJECTS1=[.libnurbs.interface]glrenderer.obj,	\
	[.libnurbs.interface]glsurfeval.obj,	\
	[.libnurbs.interface]incurveeval.obj,	\
	[.libnurbs.interface]insurfeval.obj

LI2_OBJECTS=[.libnurbs.internals]arc.obj,		\
	[.libnurbs.internals]arcsorter.obj,		\
	[.libnurbs.internals]arctess.obj,		\
	[.libnurbs.internals]backend.obj,		\
	[.libnurbs.internals]basiccrveval.obj,	\
	[.libnurbs.internals]basicsurfeval.obj

LI2_OBJECTS1=[.libnurbs.internals]bin.obj,		\
	[.libnurbs.internals]bufpool.obj,		\
	[.libnurbs.internals]cachingeval.obj,	\
	[.libnurbs.internals]ccw.obj,		\
	[.libnurbs.internals]coveandtiler.obj,	\
	[.libnurbs.internals]curve.obj,		\
	[.libnurbs.internals]curvelist.obj

LI2_OBJECTS2=[.libnurbs.internals]curvesub.obj,		\
	[.libnurbs.internals]dataTransform.obj,	\
	[.libnurbs.internals]displaylist.obj,	\
	[.libnurbs.internals]flist.obj,		\
	[.libnurbs.internals]flistsorter.obj

LI2_OBJECTS3=[.libnurbs.internals]hull.obj,		\
	[.libnurbs.internals]intersect.obj,		\
	[.libnurbs.internals]knotvector.obj,	\
	[.libnurbs.internals]mapdesc.obj

LI2_OBJECTS4=[.libnurbs.internals]mapdescv.obj,		\
	[.libnurbs.internals]maplist.obj,		\
	[.libnurbs.internals]mesher.obj,		\
	[.libnurbs.internals]monoTriangulationBackend.obj,\
	[.libnurbs.internals]monotonizer.obj

LI2_OBJECTS5=[.libnurbs.internals]mycode.obj,		\
	[.libnurbs.internals]nurbsinterfac.obj,	\
	[.libnurbs.internals]nurbstess.obj,		\
	[.libnurbs.internals]patch.obj

LI2_OBJECTS6=[.libnurbs.internals]patchlist.obj,		\
	[.libnurbs.internals]quilt.obj,		\
	[.libnurbs.internals]reader.obj,		\
	[.libnurbs.internals]renderhints.obj,	\
	[.libnurbs.internals]slicer.obj

LI2_OBJECTS7=[.libnurbs.internals]sorter.obj,		\
	[.libnurbs.internals]splitarcs.obj,		\
	[.libnurbs.internals]subdivider.obj,	\
	[.libnurbs.internals]tobezier.obj

LI2_OBJECTS8=[.libnurbs.internals]trimline.obj,		\
	[.libnurbs.internals]trimregion.obj,	\
	[.libnurbs.internals]trimvertpool.obj,	\
	[.libnurbs.internals]uarray.obj,		\
	[.libnurbs.internals]varray.obj

LN_OBJECTS=[.libnurbs.nurbtess]directedLine.obj,	\
	[.libnurbs.nurbtess]gridWrap.obj,		\
	[.libnurbs.nurbtess]monoChain.obj,		\
	[.libnurbs.nurbtess]monoPolyPart.obj,	\
	[.libnurbs.nurbtess]monoTriangulation.obj

LN_OBJECTS1=[.libnurbs.nurbtess]partitionX.obj,		\
	[.libnurbs.nurbtess]partitionY.obj,		\
	[.libnurbs.nurbtess]polyDBG.obj

LN_OBJECTS2=[.libnurbs.nurbtess]polyUtil.obj,		\
	[.libnurbs.nurbtess]primitiveStream.obj,	\
	[.libnurbs.nurbtess]quicksort.obj,		\
	[.libnurbs.nurbtess]rectBlock.obj

LN_OBJECTS3=[.libnurbs.nurbtess]sampleComp.obj,		\
	[.libnurbs.nurbtess]sampleCompBot.obj,	\
	[.libnurbs.nurbtess]sampleCompRight.obj

LN_OBJECTS4=[.libnurbs.nurbtess]sampleCompTop.obj,	\
	[.libnurbs.nurbtess]sampleMonoPoly.obj,\
	[.libnurbs.nurbtess]sampledLine.obj,	\
	[.libnurbs.nurbtess]searchTree.obj

##### RULES #####

VERSION=MesaGlu V3.5

##### TARGETS #####

# Make the library:
$(LIBDIR)$(GLU_LIB) : $(LU_OBJECTS) $(LT_OBJECTS) $(LI_OBJECTS) $(LI_OBJECTS1)\
		    $(LI2_OBJECTS) $(LI2_OBJECTS1) $(LI2_OBJECTS2)\
		    $(LI2_OBJECTS3) $(LI2_OBJECTS4) $(LI2_OBJECTS5)\
		    $(LI2_OBJECTS6) $(LI2_OBJECTS7) $(LI2_OBJECTS8)\
		    $(LN_OBJECTS) $(LN_OBJECTS1) $(LN_OBJECTS2)\
		    $(LN_OBJECTS3) $(LN_OBJECTS4)
  @ $(MAKELIB) $(GLU_LIB)  $(LU_OBJECTS),$(LT_OBJECTS),$(LI_OBJECTS),\
	$(LI2_OBJECTS),$(LN_OBJECTS)
  @ rename $(GLU_LIB)* $(LIBDIR)
.ifdef SHARE
  @ WRITE_ SYS$OUTPUT "  generating mesagl1.opt"
  @ OPEN_/WRITE FILE  mesagl1.opt
  @ WRITE_ FILE "!"
  @ WRITE_ FILE "! mesagl1.opt generated by DESCRIP.$(MMS_EXT)" 
  @ WRITE_ FILE "!"
  @ WRITE_ FILE "IDENTIFICATION=""$(VERSION)"""
  @ WRITE_ FILE "GSMATCH=LEQUAL,3,5
  @ WRITE_ FILE "$(LU_OBJECTS)"
  @ WRITE_ FILE "$(LT_OBJECTS)"
  @ WRITE_ FILE "$(LI_OBJECTS)"
  @ WRITE_ FILE "$(LI_OBJECTS1)"
  @ WRITE_ FILE "$(LI2_OBJECTS)"
  @ WRITE_ FILE "$(LI2_OBJECTS1)"
  @ WRITE_ FILE "$(LI2_OBJECTS2)"
  @ WRITE_ FILE "$(LI2_OBJECTS3)"
  @ WRITE_ FILE "$(LI2_OBJECTS4)"
  @ WRITE_ FILE "$(LI2_OBJECTS5)"
  @ WRITE_ FILE "$(LI2_OBJECTS6)"
  @ WRITE_ FILE "$(LI2_OBJECTS7)"
  @ WRITE_ FILE "$(LI2_OBJECTS8)"
  @ WRITE_ FILE "$(LN_OBJECTS)"
  @ WRITE_ FILE "$(LN_OBJECTS1)"
  @ WRITE_ FILE "$(LN_OBJECTS2)"
  @ WRITE_ FILE "$(LN_OBJECTS3)"
  @ WRITE_ FILE "$(LN_OBJECTS4)"
  @ WRITE_ FILE "[---.lib]libmesagl.exe/SHARE"
  @ WRITE_ FILE "SYS$SHARE:DECW$XEXTLIBSHR/SHARE"
  @ WRITE_ FILE "SYS$SHARE:DECW$XLIBSHR/SHARE"
  @ CLOSE_ FILE
#  @ WRITE_ SYS$OUTPUT "  generating mesagl.map ..."
#  @ CXXLINK_/NODEB/NOSHARE/NOEXE/MAP=mesagl.map/FULL mesagl1.opt/OPT
#  @ WRITE_ SYS$OUTPUT "  analyzing mesagl.map ..."
#  @ @[-.vms]ANALYZE_MAP.COM mesagl.map mesagl.opt
  @ WRITE_ SYS$OUTPUT "  linking $(GLU_SHAR) ..."
#  @ CXXLINK_/noinform/NODEB/SHARE=$(GLU_SHAR)/MAP=mesagl.map/FULL mesagl1.opt/opt,mesagl.opt/opt
  @ CXXLINK_/noinform/NODEB/SHARE=$(GLU_SHAR)/MAP=mesagl.map/FULL mesagl1.opt/opt,mesaglu.opt/opt
  @ rename $(GLU_SHAR)* $(LIBDIR)
.endif

clean :
	delete [...]*.obj;*
	purge

[.libutil]error.obj : [.libutil]error.c
	$(CC) $(CFLAGS) /obj=[.libutil]error.obj [.libutil]error.c

[.libutil]glue.obj : [.libutil]glue.c
	$(CC) $(CFLAGS) /obj=[.libutil]glue.obj [.libutil]glue.c

[.libutil]mipmap.obj : [.libutil]mipmap.c
	$(CC) $(CFLAGS) /obj=[.libutil]mipmap.obj [.libutil]mipmap.c

[.libutil]project.obj : [.libutil]project.c
	$(CC) $(CFLAGS) /obj=[.libutil]project.obj [.libutil]project.c

[.libutil]quad.obj : [.libutil]quad.c
	$(CC) $(CFLAGS) /obj=[.libutil]quad.obj [.libutil]quad.c

[.libutil]registry.obj : [.libutil]registry.c
	$(CC) $(CFLAGS) /obj=[.libutil]registry.obj [.libutil]registry.c

[.libtess]dict.obj : [.libtess]dict.c
	$(CC) $(CFLAGS) /obj=[.libtess]dict.obj [.libtess]dict.c

[.libtess]geom.obj : [.libtess]geom.c
	$(CC) $(CFLAGS) /obj=[.libtess]geom.obj [.libtess]geom.c

[.libtess]memalloc.obj : [.libtess]memalloc.c
	$(CC) $(CFLAGS) /obj=[.libtess]memalloc.obj [.libtess]memalloc.c

[.libtess]mesh.obj : [.libtess]mesh.c
	$(CC) $(CFLAGS) /obj=[.libtess]mesh.obj [.libtess]mesh.c

[.libtess]normal.obj : [.libtess]normal.c
	$(CC) $(CFLAGS) /obj=[.libtess]normal.obj [.libtess]normal.c

[.libtess]priorityq.obj : [.libtess]priorityq.c
	$(CC) $(CFLAGS) /obj=[.libtess]priorityq.obj [.libtess]priorityq.c

[.libtess]render.obj : [.libtess]render.c
	$(CC) $(CFLAGS) /obj=[.libtess]render.obj [.libtess]render.c

[.libtess]sweep.obj : [.libtess]sweep.c
	$(CC) $(CFLAGS) /obj=[.libtess]sweep.obj [.libtess]sweep.c

[.libtess]tess.obj : [.libtess]tess.c
	$(CC) $(CFLAGS) /obj=[.libtess]tess.obj [.libtess]tess.c

[.libtess]tessmono.obj : [.libtess]tessmono.c
	$(CC) $(CFLAGS) /obj=[.libtess]tessmono.obj [.libtess]tessmono.c

[.libnurbs.interface]bezierEval.obj : [.libnurbs.interface]bezierEval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]bezierEval.obj [.libnurbs.interface]bezierEval.cc

[.libnurbs.interface]bezierPatch.obj : [.libnurbs.interface]bezierPatch.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]bezierPatch.obj [.libnurbs.interface]bezierPatch.cc

[.libnurbs.interface]bezierPatchMesh.obj : [.libnurbs.interface]bezierPatchMesh.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]bezierPatchMesh.obj [.libnurbs.interface]bezierPatchMesh.cc

[.libnurbs.interface]glcurveval.obj : [.libnurbs.interface]glcurveval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]glcurveval.obj [.libnurbs.interface]glcurveval.cc

[.libnurbs.interface]glinterface.obj : [.libnurbs.interface]glinterface.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]glinterface.obj [.libnurbs.interface]glinterface.cc

[.libnurbs.interface]glrenderer.obj : [.libnurbs.interface]glrenderer.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]glrenderer.obj [.libnurbs.interface]glrenderer.cc

[.libnurbs.interface]glsurfeval.obj : [.libnurbs.interface]glsurfeval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]glsurfeval.obj [.libnurbs.interface]glsurfeval.cc

[.libnurbs.interface]incurveeval.obj : [.libnurbs.interface]incurveeval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]incurveeval.obj [.libnurbs.interface]incurveeval.cc

[.libnurbs.interface]insurfeval.obj : [.libnurbs.interface]insurfeval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.interface]insurfeval.obj [.libnurbs.interface]insurfeval.cc

[.libnurbs.internals]arc.obj : [.libnurbs.internals]arc.cc
	$(CXX) $(CFLAGS)/list/show=all /obj=[.libnurbs.internals]arc.obj [.libnurbs.internals]arc.cc

[.libnurbs.internals]arcsorter.obj : [.libnurbs.internals]arcsorter.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]arcsorter.obj [.libnurbs.internals]arcsorter.cc

[.libnurbs.internals]arctess.obj : [.libnurbs.internals]arctess.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]arctess.obj [.libnurbs.internals]arctess.cc

[.libnurbs.internals]backend.obj : [.libnurbs.internals]backend.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]backend.obj [.libnurbs.internals]backend.cc

[.libnurbs.internals]basiccrveval.obj : [.libnurbs.internals]basiccrveval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]basiccrveval.obj [.libnurbs.internals]basiccrveval.cc

[.libnurbs.internals]basicsurfeval.obj : [.libnurbs.internals]basicsurfeval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]basicsurfeval.obj [.libnurbs.internals]basicsurfeval.cc

[.libnurbs.internals]bin.obj : [.libnurbs.internals]bin.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]bin.obj [.libnurbs.internals]bin.cc

[.libnurbs.internals]bufpool.obj : [.libnurbs.internals]bufpool.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]bufpool.obj [.libnurbs.internals]bufpool.cc

[.libnurbs.internals]cachingeval.obj : [.libnurbs.internals]cachingeval.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]cachingeval.obj [.libnurbs.internals]cachingeval.cc

[.libnurbs.internals]ccw.obj : [.libnurbs.internals]ccw.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]ccw.obj [.libnurbs.internals]ccw.cc

[.libnurbs.internals]coveandtiler.obj : [.libnurbs.internals]coveandtiler.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]coveandtiler.obj [.libnurbs.internals]coveandtiler.cc

[.libnurbs.internals]curve.obj : [.libnurbs.internals]curve.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]curve.obj [.libnurbs.internals]curve.cc

[.libnurbs.internals]curvelist.obj : [.libnurbs.internals]curvelist.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]curvelist.obj [.libnurbs.internals]curvelist.cc

[.libnurbs.internals]curvesub.obj : [.libnurbs.internals]curvesub.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]curvesub.obj [.libnurbs.internals]curvesub.cc

[.libnurbs.internals]dataTransform.obj : [.libnurbs.internals]dataTransform.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]dataTransform.obj [.libnurbs.internals]dataTransform.cc

[.libnurbs.internals]displaylist.obj : [.libnurbs.internals]displaylist.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]displaylist.obj [.libnurbs.internals]displaylist.cc

[.libnurbs.internals]flist.obj : [.libnurbs.internals]flist.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]flist.obj [.libnurbs.internals]flist.cc

[.libnurbs.internals]flistsorter.obj : [.libnurbs.internals]flistsorter.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]flistsorter.obj [.libnurbs.internals]flistsorter.cc

[.libnurbs.internals]hull.obj : [.libnurbs.internals]hull.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]hull.obj [.libnurbs.internals]hull.cc

[.libnurbs.internals]intersect.obj : [.libnurbs.internals]intersect.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]intersect.obj [.libnurbs.internals]intersect.cc

[.libnurbs.internals]knotvector.obj : [.libnurbs.internals]knotvector.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]knotvector.obj [.libnurbs.internals]knotvector.cc

[.libnurbs.internals]mapdesc.obj : [.libnurbs.internals]mapdesc.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]mapdesc.obj [.libnurbs.internals]mapdesc.cc

[.libnurbs.internals]mapdescv.obj : [.libnurbs.internals]mapdescv.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]mapdescv.obj [.libnurbs.internals]mapdescv.cc

[.libnurbs.internals]maplist.obj : [.libnurbs.internals]maplist.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]maplist.obj [.libnurbs.internals]maplist.cc

[.libnurbs.internals]mesher.obj : [.libnurbs.internals]mesher.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]mesher.obj [.libnurbs.internals]mesher.cc

[.libnurbs.internals]monoTriangulationBackend.obj : [.libnurbs.internals]monoTriangulationBackend.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]monoTriangulationBackend.obj [.libnurbs.internals]monoTriangulationBackend.cc

[.libnurbs.internals]monotonizer.obj : [.libnurbs.internals]monotonizer.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]monotonizer.obj [.libnurbs.internals]monotonizer.cc

[.libnurbs.internals]mycode.obj : [.libnurbs.internals]mycode.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]mycode.obj [.libnurbs.internals]mycode.cc

[.libnurbs.internals]nurbsinterfac.obj : [.libnurbs.internals]nurbsinterfac.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]nurbsinterfac.obj [.libnurbs.internals]nurbsinterfac.cc

[.libnurbs.internals]nurbstess.obj : [.libnurbs.internals]nurbstess.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]nurbstess.obj [.libnurbs.internals]nurbstess.cc

[.libnurbs.internals]patch.obj : [.libnurbs.internals]patch.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]patch.obj [.libnurbs.internals]patch.cc

[.libnurbs.internals]patchlist.obj : [.libnurbs.internals]patchlist.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]patchlist.obj [.libnurbs.internals]patchlist.cc

[.libnurbs.internals]quilt.obj : [.libnurbs.internals]quilt.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]quilt.obj [.libnurbs.internals]quilt.cc

[.libnurbs.internals]reader.obj : [.libnurbs.internals]reader.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]reader.obj [.libnurbs.internals]reader.cc

[.libnurbs.internals]renderhints.obj : [.libnurbs.internals]renderhints.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]renderhints.obj [.libnurbs.internals]renderhints.cc

[.libnurbs.internals]slicer.obj : [.libnurbs.internals]slicer.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]slicer.obj [.libnurbs.internals]slicer.cc

[.libnurbs.internals]sorter.obj : [.libnurbs.internals]sorter.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]sorter.obj [.libnurbs.internals]sorter.cc

[.libnurbs.internals]splitarcs.obj : [.libnurbs.internals]splitarcs.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]splitarcs.obj [.libnurbs.internals]splitarcs.cc

[.libnurbs.internals]subdivider.obj : [.libnurbs.internals]subdivider.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]subdivider.obj [.libnurbs.internals]subdivider.cc

[.libnurbs.internals]tobezier.obj : [.libnurbs.internals]tobezier.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]tobezier.obj [.libnurbs.internals]tobezier.cc

[.libnurbs.internals]trimline.obj : [.libnurbs.internals]trimline.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]trimline.obj [.libnurbs.internals]trimline.cc

[.libnurbs.internals]trimregion.obj : [.libnurbs.internals]trimregion.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]trimregion.obj [.libnurbs.internals]trimregion.cc

[.libnurbs.internals]trimvertpool.obj : [.libnurbs.internals]trimvertpool.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]trimvertpool.obj [.libnurbs.internals]trimvertpool.cc

[.libnurbs.internals]uarray.obj : [.libnurbs.internals]uarray.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]uarray.obj [.libnurbs.internals]uarray.cc

[.libnurbs.internals]varray.obj : [.libnurbs.internals]varray.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.internals]varray.obj [.libnurbs.internals]varray.cc

[.libnurbs.nurbtess]directedLine.obj : [.libnurbs.nurbtess]directedLine.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]directedLine.obj [.libnurbs.nurbtess]directedLine.cc

[.libnurbs.nurbtess]gridWrap.obj : [.libnurbs.nurbtess]gridWrap.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]gridWrap.obj [.libnurbs.nurbtess]gridWrap.cc

[.libnurbs.nurbtess]monoChain.obj : [.libnurbs.nurbtess]monoChain.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]monoChain.obj [.libnurbs.nurbtess]monoChain.cc

[.libnurbs.nurbtess]monoPolyPart.obj : [.libnurbs.nurbtess]monoPolyPart.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]monoPolyPart.obj [.libnurbs.nurbtess]monoPolyPart.cc

[.libnurbs.nurbtess]monoTriangulation.obj : [.libnurbs.nurbtess]monoTriangulation.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]monoTriangulation.obj [.libnurbs.nurbtess]monoTriangulation.cc

[.libnurbs.nurbtess]partitionX.obj : [.libnurbs.nurbtess]partitionX.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]partitionX.obj [.libnurbs.nurbtess]partitionX.cc

[.libnurbs.nurbtess]partitionY.obj : [.libnurbs.nurbtess]partitionY.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]partitionY.obj [.libnurbs.nurbtess]partitionY.cc

[.libnurbs.nurbtess]polyDBG.obj : [.libnurbs.nurbtess]polyDBG.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]polyDBG.obj [.libnurbs.nurbtess]polyDBG.cc

[.libnurbs.nurbtess]polyUtil.obj : [.libnurbs.nurbtess]polyUtil.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]polyUtil.obj [.libnurbs.nurbtess]polyUtil.cc

[.libnurbs.nurbtess]primitiveStream.obj : [.libnurbs.nurbtess]primitiveStream.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]primitiveStream.obj [.libnurbs.nurbtess]primitiveStream.cc

[.libnurbs.nurbtess]quicksort.obj : [.libnurbs.nurbtess]quicksort.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]quicksort.obj [.libnurbs.nurbtess]quicksort.cc

[.libnurbs.nurbtess]rectBlock.obj : [.libnurbs.nurbtess]rectBlock.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]rectBlock.obj [.libnurbs.nurbtess]rectBlock.cc

[.libnurbs.nurbtess]sampleComp.obj : [.libnurbs.nurbtess]sampleComp.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampleComp.obj [.libnurbs.nurbtess]sampleComp.cc

[.libnurbs.nurbtess]sampleCompBot.obj : [.libnurbs.nurbtess]sampleCompBot.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampleCompBot.obj [.libnurbs.nurbtess]sampleCompBot.cc

[.libnurbs.nurbtess]sampleCompRight.obj : [.libnurbs.nurbtess]sampleCompRight.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampleCompRight.obj [.libnurbs.nurbtess]sampleCompRight.cc

[.libnurbs.nurbtess]sampleCompTop.obj : [.libnurbs.nurbtess]sampleCompTop.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampleCompTop.obj [.libnurbs.nurbtess]sampleCompTop.cc

[.libnurbs.nurbtess]sampleMonoPoly.obj : [.libnurbs.nurbtess]sampleMonoPoly.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampleMonoPoly.obj [.libnurbs.nurbtess]sampleMonoPoly.cc

[.libnurbs.nurbtess]sampledLine.obj : [.libnurbs.nurbtess]sampledLine.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]sampledLine.obj [.libnurbs.nurbtess]sampledLine.cc

[.libnurbs.nurbtess]searchTree.obj : [.libnurbs.nurbtess]searchTree.cc
	$(CXX) $(CFLAGS) /obj=[.libnurbs.nurbtess]searchTree.obj [.libnurbs.nurbtess]searchTree.cc
