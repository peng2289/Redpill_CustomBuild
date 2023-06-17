#!/bin/bash

function beginArray() {

  case $1 in
  DS3615xs)
    permanent="LWN"
    serialstart="1130 1230 1330 1430"
    ;;
  DS3617xs)
    permanent="ODN"
    serialstart="1130 1230 1330 1430"
    ;;
  DS916+)
    permanent="NZN"
    serialstart="1130 1230 1330 1430"
    ;;
  DS918+)
    permanent="PDN"
    serialstart="1780 1790 1860 1980"
    ;;
  DS1019+)
    permanent="PDN"
    serialstart="1780 1790 1860 1980"
    ;;
  DS720+)
    permanent="SBR"
    serialstart="2030 2040 20C0 2150"
    ;;
  DS920+)
    permanent="SBR"
    serialstart="2030 2040 20C0 2150"
    ;;
  DS1520+)
    permanent="TRR"
    serialstart="2270"
    ;;
  DS3622xs+)
    permanent="SQR"
    serialstart="2030 2040 20C0 2150"
    ;;
  DS1621xs+)
    permanent="S7R"
    serialstart="2080"
    ;;
  DS1823xs+)
    permanent="V5R"
    serialstart="2280"
    ;;
  DS923+)
    permanent="TQR"
    serialstart="2270"
    ;;
  DS1522+)
    permanent="TRR"
    serialstart="2270"
    ;;
  DS723+)
    permanent="TQR"
    serialstart="2270"
    ;;
  DS1621+)
    permanent="S7R"
    serialstart="2080"
    ;;
  DS2422+)
    permanent="S7R"
    serialstart="2080"
    ;;
  FS2500)
    permanent="PSN"
    serialstart="1960"
    ;;
  FS6400)
    permanent="PSN"
    serialstart="1960"
    ;;
  DVA3219)
    permanent="RFR"
    serialstart="1930 1940"
    ;;
  DVA3221)
    permanent="SJR"
    serialstart="2030 2040 20C0 2150"
    ;;
  DVA1622)
    permanent="UBR"
    serialstart="2030 2040 20C0 2150"
    ;;
  RS1221+)
    permanent="RWR"
    serialstart="20B0"
    ;;
  RS1619xs+)
    permanent="QPR"
    serialstart="1920"
    ;;
  RS3618xs)
    permanent="ODN"
    serialstart="1130 1230 1330 1430"
    ;;
  RS3413xs+)
    permanent="S7R"
    serialstart="2080"
    ;;
  RS3621xs+)
    permanent="SZR"
    serialstart="20A0"
    ;;
  RS4021xs+)
    permanent="T2R"
    serialstart="2250"
    ;;
  SA3400)
    permanent="RJR"
    serialstart="1920"
    ;;
  SA6400)
    permanent="TQR"
    serialstart="2270"
    ;;
  *)
    permanent=""
    serialstart=""
    ;;
  esac

}

function random() {
    printf "%06d" $(($RANDOM % 30000 + 1))
}
function randomhex() {
    val=$(($RANDOM % 255 + 1))
    echo "obase=16; $val" | bc
}

function generateRandomLetter() {
    for i in a b c d e f g h j k l m n p q r s t v w x y z; do
        echo $i
    done | sort -R | tail -1
}

function generateRandomValue() {
    for i in 0 1 2 3 4 5 6 7 8 9 a b c d e f g h j k l m n p q r s t v w x y z; do
        echo $i
    done | sort -R | tail -1
}

function toupper() {

    echo $1 | tr '[:lower:]' '[:upper:]'

}

function generateMacAddress() {

    #toupper "Mac Address: 00:11:32:$(randomhex):$(randomhex):$(randomhex)"
    if [ "$1" = "DS923+" ] || [ "$1" = "DS1522+" ] || [ "$1" = "RS4021xs+" ]; then
        # DS1522+ and DS923+ Mac starts with 90:09:d0
        printf '90:09:d0:%02X:%02X:%02X' $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256))
    else
        printf '00:11:32:%02X:%02X:%02X' $((RANDOM % 256)) $((RANDOM % 256)) $((RANDOM % 256))
    fi

}

function generateSerial() {

  beginArray $1

  case $1 in

  DS3615xs)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  DS3617xs)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  DS916+)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  DS918+)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  DS1019+)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  FS2500)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  FS6400)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  DS720+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS920+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS923+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS1522+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS723+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS1520+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS3622xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS1621xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS1823xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS1621+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DS2422+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DVA3219)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DVA3221)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  DVA1622)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  RS1221+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  RS1619xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  RS3621xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  RS4021xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  RS3618xs)
    serialnum="$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(random)
    ;;
  RS3413xs+)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  SA3400)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  SA6400)
    serialnum=$(toupper "$(echo "$serialstart" | tr ' ' '\n' | sort -R | tail -1)$permanent"$(generateRandomLetter)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomValue)$(generateRandomLetter))
    ;;
  *)
    serialnum=""
    ;;
  esac

  echo $serialnum

}

function showhelp() {

    cat <<EOF
$(basename ${0})

----------------------------------------------------------------------------------------
Usage: ${0} <model>

Available models :
----------------------------------------------------------------------------------------
DS916+ DS918+ DS920+ DS923+ DS1520+ DS1621+ DS2422+ DS3615xs DS3617xs DS3622xs+ DVA1622 DVA3219 DVA3221 FS6400 RS4021xs+

e.g. $(basename ${0}) DS3615xs
----------------------------------------------------------------------------------------
EOF

}

if [ -z "$1" ]; then
    showhelp
else
    echo $(generateMacAddress)
    echo $(generateSerial $1)
fi
