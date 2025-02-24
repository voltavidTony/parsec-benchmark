# Makefile for Mesa for VMS
# contributed by Jouk Jansen  joukj@hrem.stm.tudelft.nl

.include [-]mms-config

all :
	set default [.mesa]
	$(MMS)$(MMSQUALIFIERS)
	set default [-]
.ifdef SHARE
	$(MMS)$(MMSQUALIFIERS) [-.lib]$(GL_SHAR)
.endif
	set default [.glu]
	$(MMS)$(MMSQUALIFIERS)
	set default [-.glut.glx]
	$(MMS)$(MMSQUALIFIERS)
	set default [--]

[-.lib]$(GL_SHAR) : [-.lib]$(GL_LIB)
	@ WRITE_ SYS$OUTPUT "  generating libmesa.opt"
	@ library/extract=* [-.lib]$(GL_LIB)
	@ OPEN_/WRITE FILE  libmesa.opt
	@ WRITE_ FILE "!"
	@ WRITE_ FILE "! libmesa.opt generated by DESCRIP.$(MMS_EXT)" 
	@ WRITE_ FILE "!"
	@ WRITE_ FILE "IDENTIFICATION=""mesa5.1"""
	@ WRITE_ FILE "GSMATCH=LEQUAL,5,1
	@ WRITE_ FILE "libmesagl.obj"
	@ write_ file "sys$share:decw$xextlibshr/share"
	@ write_ file "sys$share:decw$xlibshr/share"
	@ write_ file "sys$share:pthread$rtl/share"
	@ CLOSE_ FILE
	@ $(MMS)$(MMSQUALIFIERS)/ignore=warning mesa_vms
	@ WRITE_ SYS$OUTPUT "  linking ..."
	@ LINK_/NODEB/SHARE=[-.lib]$(GL_SHAR)/MAP=libmesa.map/FULL libmesa.opt/opt,\
	mesa_vms.opt/opt
	@ delete libmesagl.obj;*

mesa_vms :
	@ WRITE_ SYS$OUTPUT "  generating libmesa.map ..."
	@ LINK_/NODEB/NOSHARE/NOEXE/MAP=libmesa.map/FULL libmesa.opt/OPT
	@ WRITE_ SYS$OUTPUT "  analyzing libmesa.map ..."
	@ @[-.vms]analyze_map.com libmesa.map mesa_vms.opt
