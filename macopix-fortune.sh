#!/bin/sh

MASCOT=/path/to/mascot.mcpx
COMMAND=fortune

sed 's/^click_word.*$/click_word='"$($COMMAND | sed ':a;N;$!ba;s/\n/ /g')"'/' $MASCOT >$MASCOT.tmp &&
mv $MASCOT.tmp $MASCOT

kill $(pidof macopix)
macopix -s $MASCOT &
