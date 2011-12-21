#!/bin/bash
# $Id: de_Setup.sh 113 2010-05-31 14:44:11Z carsten $

WORKSPACE=/var/lib/jenkins/jobs/adempiere361/workspace
ADEMPIEREHOME=$WORKSPACE/adempiere
GERMANHOME=/var/lib/jenkins/jobs/GermanLocalisation/workspace

#APPLY MIGRATION SCRIPTS
$WORKSPACE/adempiere/Adempiere/migration/migrate_postgresql.sh \
$GERMANHOME/workspace/migration/postgresql commit \
|psql -U adempiere -d adempiere 

cd $ADEMPIEREHOME/Adempiere 
echo == COMMENT: get de_DE language xml files
rm -R data/de_DE
mkdir data/de_DE
echo == COMMENT: Copy Translation files and import language...
cp $GERMANHOME/data/de_DE/*.xml $ADEMPIEREHOME/Adempiere/data/de_DE
cp $ADEMPIEREHOME/Adempiere/utils/myEnvironment.sh $GERMANHOME
echo
cd $GERMANHOME
sh ./utils/RUN_TrlImport.sh
echo == COMMENT ... Language import done!
$WAITFORINPUT

echo
echo == COMMENT - DONE
