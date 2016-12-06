#!/bin/bash

basedir=`pwd`

build_tex()
{
echo "--------------------------------------------------------------------------------------"
echo "---------- " $latexdoc".tex ->" $pdfdoc".pdf"
echo "--------------------------------------------------------------------------------------"
cd "${basedir}"
cd "${dir}"
pwd
rm -f $pdfdoc.pdf

echo "Version ${SW_VERSION} \\" > version.txt
echo "\normalsize" >> version.txt

echo "Build LaTeX files"
COUNTER=0
while [  $COUNTER -lt 3 ]; do
    pdflatex -jobname=$pdfdoc -interaction=nonstopmode $latexdoc.tex
    let COUNTER=COUNTER+1 
done
}

remove_renamed_pdfs()
{
   rm -f Anleitungen/Bedienungsanleitung/DeviceTypeDocu.pdf
}

echo "Shell Skript invoked"
remove_renamed_pdfs

dir=Anleitungen/Bedienungsanleitung
# USE WITHOUT EXTENSIONs
latexdoc=Bedienungsanleitung
pdfdoc=Bedienungsanleitung
build_tex

dir=Anleitungen/Bedienungsanleitung
latexdoc=DeviceTypeDocu
pdfdoc=Spenderdatenverwaltung
build_tex

dir=Spezifikationen/WLAN-Sticks
latexdoc=WLAN-Sticks
pdfdoc=WLAN-Sticks
build_tex

dir=Anleitungen/TechnischeDokumentation
latexdoc=TechnischeDokumentation
pdfdoc=TechnischeDokumentation
build_tex

# Return code for hudson
exit 0