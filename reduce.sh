#!/bin/sh

res=144

gs  -q -dNOPAUSE -dBATCH -dSAFER \
	-sDEVICE=pdfwrite \
	-sColorConversionStrategy=Gray \
	-dProcessColorModel=/DeviceGray \
	-dCompatibilityLevel=1.3 \
	-dPDFSETTINGS=/screen \
	-dEmbedAllFonts=true \
	-dSubsetFonts=true \
	-dColorImageDownsampleType=/Bicubic \
	-dColorImageResolution=$res \
	-dGrayImageDownsampleType=/Bicubic \
	-dGrayImageResolution=$res \
	-dMonoImageDownsampleType=/Bicubic \
	-dMonoImageResolution=$res \
	-sOutputFile=out.pdf \
	$1
