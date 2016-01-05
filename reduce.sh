#!/bin/sh

function print_help {
echo "Use -bw to convert to black and white"
echo "Use -res XX to set the resolution default 144"
}

res=144

while [[ $# > 1 ]]
do
	key="$1"

	case $key in
		-res|--resolution)
			res=$2
			shift # past argument
			;;
		-h|--help)
			print_help
			exit 0
			;;
		-bw|--blackandwhite)
			BLACK_AND_WHITE=YES
			;;
		*)
			# unknown option
			;;
	esac
	shift # past argument or value
done

if [ "xx$BLACK_AND_WHITE" = "xxYES" ]; then
	echo "Black and white"

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
else
	gs  -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
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

fi
