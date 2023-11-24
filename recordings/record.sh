#! /usr/bin/env bash
##
## Copyright (c) 2023 by Sebastian Pipping
## Apache License 2.0
##

set -e -u

vhs_bin_dir="${HOME}/go/bin"
self_dir="$(dirname "$(realpath "$(type -P "$0")")")"
ttyplot_bin_dir="${self_dir}/.."  # i.e. the local build

export PATH="${ttyplot_bin_dir}:${vhs_bin_dir}:${PATH}"

# Consistent prompt for reproducibility (e.g. without ${USER})
export PS1="\n\$ "

# Consistent clock display for reproducibility
export FAKETIME=yesplease


cd "${self_dir}"

# Check for and report on runtime dependencies and their locations
which bash ffmpeg realpath seq ttyd ttyplot vhs || { sed 's,:,\n,g' <<<"${PATH}"; false; }

exec vhs ttyplot.tape
