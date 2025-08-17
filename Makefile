PREFIX = /usr

CC = cc
AR = ar
CFLAGS = -Wno-deprecated-non-prototype -Wno-parentheses -Wno-format -Wno-format-security -Wno-knr-promoted-parameter -Wno-pointer-to-int-cast -Wno-stringop-overflow -Wno-int-to-pointer-cast -Wno-discarded-qualifiers -std=gnu89 `pkg-config --cflags x11` -fcommon -Isrc/jpeg -Isrc/tiff -Isrc/tiff -Isrc/png -DDOJPEG -DDOTIFF -DDOPNG $(DEFS)
LDFLAGS =
LIBS = `pkg-config --libs x11` -lm

.PHONY: all clean install
.SUFFIXES: .c .o

OBJS += src/xv/vprintf.o src/xv/xv.o src/xv/xv24to8.o src/xv/xvalg.o src/xv/xvbmp.o src/xv/xvbrowse.o src/xv/xvbutt.o src/xv/xvcolor.o src/xv/xvctrl.o src/xv/xvcut.o src/xv/xvdflt.o src/xv/xvdial.o src/xv/xvdir.o src/xv/xvevent.o src/xv/xvfits.o src/xv/xvgam.o src/xv/xvgif.o src/xv/xvgifwr.o src/xv/xvgrab.o src/xv/xvgraf.o src/xv/xvhips.o src/xv/xviff.o src/xv/xvimage.o src/xv/xvinfo.o src/xv/xviris.o src/xv/xvjp2k.o src/xv/xvjpeg.o src/xv/xvmag.o src/xv/xvmaki.o src/xv/xvmgcsfx.o src/xv/xvmisc.o src/xv/xvml.o src/xv/xvpbm.o src/xv/xvpcd.o src/xv/xvpcx.o src/xv/xvpds.o src/xv/xvpi.o src/xv/xvpic.o src/xv/xvpic2.o src/xv/xvpm.o src/xv/xvpng.o src/xv/xvpopup.o src/xv/xvps.o src/xv/xvrle.o src/xv/xvroot.o src/xv/xvscrl.o src/xv/xvsmooth.o src/xv/xvsunras.o src/xv/xvtarga.o src/xv/xvtext.o src/xv/xvtiff.o src/xv/xvtiffwr.o src/xv/xvvd.o src/xv/xvwbmp.o src/xv/xvxbm.o src/xv/xvxpm.o src/xv/xvxwd.o src/xv/xvzx.o
OBJS += libjpeg.a libpng.a libtiff.a libz.a

JPEG_OBJS = \
	src/jpeg/jcapi.o src/jpeg/jccoefct.o src/jpeg/jccolor.o src/jpeg/jcdctmgr.o src/jpeg/jchuff.o src/jpeg/jcmainct.o \
	src/jpeg/jcmarker.o src/jpeg/jcmaster.o src/jpeg/jcomapi.o src/jpeg/jcparam.o src/jpeg/jcprepct.o src/jpeg/jcsample.o \
	src/jpeg/jdapi.o src/jpeg/jdatasrc.o src/jpeg/jdatadst.o src/jpeg/jdcoefct.o src/jpeg/jdcolor.o src/jpeg/jddctmgr.o \
	src/jpeg/jdhuff.o src/jpeg/jdmainct.o src/jpeg/jdmarker.o src/jpeg/jdmaster.o src/jpeg/jdpostct.o src/jpeg/jdsample.o \
	src/jpeg/jerror.o src/jpeg/jutils.o src/jpeg/jfdctfst.o src/jpeg/jfdctflt.o src/jpeg/jfdctint.o src/jpeg/jidctfst.o \
	src/jpeg/jidctflt.o src/jpeg/jidctint.o src/jpeg/jidctred.o src/jpeg/jquant1.o src/jpeg/jquant2.o src/jpeg/jdmerge.o \
	src/jpeg/jmemmgr.o src/jpeg/jmemnobs.o

PNG_OBJS = src/png/png.o src/png/pngerror.o src/png/pngget.o src/png/pngmem.o src/png/pngpread.o src/png/pngread.o src/png/pngrio.o src/png/pngrtran.o src/png/pngrutil.o src/png/pngset.o src/png/pngtrans.o src/png/pngwio.o src/png/pngwrite.o src/png/pngwtran.o src/png/pngwutil.o

TIFF_OBJS = src/tiff/tif_fax3.o src/tiff/tif_fax4.o src/tiff/tif_aux.o src/tiff/tif_ccittrle.o src/tiff/tif_close.o src/tiff/tif_compress.o src/tiff/tif_dir.o src/tiff/tif_dirinfo.o src/tiff/tif_dirread.o src/tiff/tif_dirwrite.o src/tiff/tif_dumpmode.o src/tiff/tif_error.o src/tiff/tif_getimage.o src/tiff/tif_jpeg.o src/tiff/tif_flush.o src/tiff/tif_lzw.o src/tiff/tif_next.o src/tiff/tif_open.o src/tiff/tif_packbits.o src/tiff/tif_print.o src/tiff/tif_read.o src/tiff/tif_swab.o src/tiff/tif_strip.o src/tiff/tif_thunder.o src/tiff/tif_tile.o src/tiff/tif_unix.o src/tiff/tif_version.o src/tiff/tif_warning.o src/tiff/tif_write.o

ZLIB_OBJS = src/zlib/adler32.o src/zlib/crc32.o src/zlib/deflate.o src/zlib/infback.o src/zlib/inffast.o src/zlib/inflate.o src/zlib/inftrees.o src/zlib/trees.o src/zlib/zutil.o

all: xv

xv: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

libjpeg.a: $(JPEG_OBJS)
	$(AR) rcs $@ $(JPEG_OBJS)

libpng.a: $(PNG_OBJS)
	$(AR) rcs $@ $(PNG_OBJS)

libtiff.a: $(TIFF_OBJS)
	$(AR) rcs $@ $(TIFF_OBJS)

libz.a: $(ZLIB_OBJS)
	$(AR) rcs $@ $(ZLIB_OBJS)

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

install: all
	mkdir -p $(PREFIX)/bin
	cp xv $(PREFIX)/bin/

clean:
	rm -f src/*/*.o xv *.a
