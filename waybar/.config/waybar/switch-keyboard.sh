#!/bin/sh

if [ $(ibus engine) = Bamboo ]; 
    then ibus engine xkb:us:intl:eng; 
else ibus engine Bamboo; fi
