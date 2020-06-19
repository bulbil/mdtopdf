#!/bin/bash
# ------------------------------------------------------------------
# [Author] mdtopdf
#          Wrapper for converting Markdown to pdf using Pandoc
#          and Weasyprint engine.
#
#          This script uses shFlags -- Advanced command-line flag
#          library for Unix shell scripts.
#          https://github.com/kward/shflags
#
# Dependency:
#     https://github.com/kward/shflags/blob/master/shflags
# ------------------------------------------------------------------
VERSION=0.1.0
SUBJECT=mdtopdf
USAGE="Usage: mdtopdf -pfise args"

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

BASE=/Users/nkashya1/.nkashya1/mdtopdf/
CURRDIR=$(pwd)

. "$BASE"shflags

DEFINE_string prefix '' 'output file prefix' p
DEFINE_string infile '*md' 'input file' f
DEFINE_string indir '' 'input directory' i
DEFINE_string style 'custom' 'stylesheet path' s
DEFINE_string engine 'weasyprint' 'css engine' e

# parse command line
FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"

shift $(($OPTIND - 1))

if [ "$FLAGS_prefix" != '' ]; then
    outfile="$FLAGS_prefix"-$(date '+%Y%m%d%S')
else
    outfile=$(date '+%Y%m%d%S')
fi

if [ "${FLAGS_indir:0:1}" == '/' ] || [ "${FLAGS_infile:0:1}" == '/' ]
then
    if [ "$FLAGS_indir" != '' ]; then
        in_files=$FLAGS_indir/$FLAGS_infile
    else
        in_files=$FLAGS_infile
    fi
else
    if [ "$FLAGS_indir" != '' ]; then
        in_files=$CURRDIR/$FLAGS_indir/$FLAGS_infile
    else
        in_files=$CURRDIR/$FLAGS_infile
    fi
fi

stylesheet="$BASE""$FLAGS_style".css

# --- Locks -------------------------------------------------------
LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
echo "Script is already running"
exit
fi

trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE

# -- Body ---------------------------------------------------------
echo -e '\n'
echo -e "\t\xf0\x9f\x91\x8c generating $CURRDIR/$outfile.pdf ... \xf0\x9f\x91\x8c"
echo -e "\t ... from $in_files"
echo -e '\n'
# -----------------------------------------------------------------

cd $BASE
pandoc --standalone --pdf-engine=$FLAGS_engine --css=$stylesheet \
--output $CURRDIR/$outfile.pdf $in_files

# -----------------------------------------------------------------
