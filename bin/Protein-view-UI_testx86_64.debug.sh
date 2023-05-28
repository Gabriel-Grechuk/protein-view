#!/bin/sh
echo -ne '\033c\033]0;Protein-view\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Protein-view-UI_testx86_64.debug.x86_64" "$@"
