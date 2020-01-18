#/bin/bash

if [[ -z $(which kipart) ]]; then
    >&2 echo "kipart not found. Install using \"pip install kipart\""
fi

READER="generic"
SORT="row"
SIDE="left"
OUTPUT="$(basename `pwd`).lib"

OPTS=("-a")
FILES=()
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
	-h|--help)
	    echo "$0 [options] file..."
	    exit 0
	    ;;
	-r|--reader)
            READER="$2"
	    shift 2
	    ;;
	-s|--sort)
	    SORT="$2"
	    shift 2
	    ;;
	--side)
	    SIDE="$2"
	    shift 2
	    ;;
	-o|--output)
	    OUTPUT="$2"
	    shift 2
	    ;;
	-*)
	    OPTS+=("$1" "$2")
	    shift 2
	    ;;
	*)
	    FILES+=("$1")
	    shift
	    ;;
    esac
done

kipart -r $READER -s $SORT --side $SIDE -o $OUTPUT ${OPTS[*]} ${FILES[*]}
