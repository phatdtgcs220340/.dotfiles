#!/bin/sh
engine=$(ibus engine 2>/dev/null)

if [[ $engine == Bamboo* ]]; then
    echo "VI"
elif [[ $engine == "xkb:us:intl:eng" || $engine == "xkb:us::eng" ]]; then
    echo "EN"
else
    # fallback: just show whatever ibus reports
    echo "$engine"
fi

