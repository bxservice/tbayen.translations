#!/bin/bash
# $Id: de_Setup.sh 113 2010-05-31 14:44:11Z carsten $

WORKSPACE=/var/lib/jenkins/jobs/adempiere361/workspace
ADEMPIEREHOME=$WORKSPACE/adempiere
GERMANHOME=/var/lib/jenkins/jobs/GermanLocalisation/workspace

cd $ADEMPIEREHOME/Adempiere 
echo ==== Copy Translation files and import language...
cp $GERMANHOME/data/de_DE/*.xml $ADEMPIEREHOME/Adempiere/data/de_DE/
cp $ADEMPIEREHOME/utils/myEnvironment.sh $GERMANHOME
echo
cd $GERMANHOME
sh ./utils/RUN_TrlImport.sh
echo ==== ... Language import done!
$WAITFORINPUT

echo
echo Done
