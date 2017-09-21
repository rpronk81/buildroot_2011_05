#! /bin/sh
# Copyright (C) 1996-2001, 2002, 2003 Free Software Foundation, Inc.
# This file is part of the GNU C Library.

# The GNU C Library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.

# The GNU C Library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with the GNU C Library; if not, write to the Free
# Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
# 02111-1307 USA.


# This is the `ldd' command, which lists what shared libraries are
# used by given dynamically-linked executables.  It works by invoking the
# run-time dynamic linker as a command and setting the environment
# variable LD_TRACE_LOADED_OBJECTS to a non-empty value.

# We should be able to find the translation right at the beginning.
TEXTDOMAIN=libc
TEXTDOMAINDIR=/usr/share/locale

RTLDLIST=/lib/ld-linux.so.3
warn=
bind_now=
verbose=

while test $# -gt 0; do
  case "$1" in
  --vers | --versi | --versio | --version)
    echo 'ldd (GNU libc) 2.3.2'
    echo $"Copyright (C) 2003 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Roland McGrath and Ulrich Drepper."
    exit 0
    ;;
  --h | --he | --hel | --help)
    echo $"Usage: ldd [OPTION]... FILE...
      --help              print this help and exit
      --version           print version information and exit
  -d, --data-relocs       process data relocations
  -r, --function-relocs   process data and function relocations
  -v, --verbose           print all information
Report bugs using the \`glibcbug' script to <bugs@gnu.org>."
    exit 0
    ;;
  -d | --d | --da | --dat | --data | --data- | --data-r | --data-re | \
  --data-rel | --data-relo | --data-reloc | --data-relocs)
    warn=yes
    shift
    ;;
  -r | --f | --fu | --fun | --func | --funct | --functi | --functio | \
  --function | --function- | --function-r | --function-re | --function-rel | \
  --function-relo | --function-reloc | --function-relocs)
    warn=yes
    bind_now=yes
    shift
    ;;
  -v | --verb | --verbo | --verbos | --verbose)
    verbose=yes
    shift
    ;;
  --v | --ve | --ver)
    echo >&2 $"ldd: option \`$1' is ambiguous"
    exit 1
    ;;
  --)		# Stop option processing.
    shift; break
    ;;
  -*)
    echo >&2 'ldd:' $"unrecognized option" "\`$1'"
    echo >&2 $"Try \`ldd --help' for more information."
    exit 1
    ;;
  *)
    break
    ;;
  esac
done

nonelf ()
{
  # Maybe extra code for non-ELF binaries.
  return 1;
}

add_env="LD_TRACE_LOADED_OBJECTS=1 LD_WARN=$warn LD_BIND_NOW=$bind_now"
add_env="$add_env LD_VERBOSE=$verbose"
case $# in
0)
  echo >&2 'ldd:' $"missing file arguments"
  echo >&2 $"Try \`ldd --help' for more information."
  exit 1
  ;;
1)
  single_file=t
  ;;
*)
  single_file=f
  ;;
esac

result=0
for file do
  # We don't list the file name when there is only one.
  test $single_file = t || echo "${file}:"
  case $file in
  */*) :
       ;;
  *) file=./$file
     ;;
  esac
  if test ! -f "$file"; then
    echo "ldd: ${file}:" $"No such file or directory" >&2
    result=1
  elif test -r "$file"; then
    test -x "$file" || echo 'ldd:' $"\
warning: you do not have execution permission for" "\`$file'" >&2
    RTLD=
    for rtld in ${RTLDLIST}; do
      if test -x $rtld; then
	verify_out=`${rtld} --verify "$file"`
        ret=$?
	case $ret in
	[02]) RTLD=${rtld}; break;;
	esac
      fi
    done
    if test -z "${RTLD}"; then
      set ${RTLDLIST}
      RTLD=$1
      verify_out=`${RTLD} --verify "$file"`
      ret=$?
    fi
    case $ret in
    0)
      eval $add_env '"$file"' || result=1
      ;;
    1)
      # This can be a non-ELF binary or no binary at all.
      nonelf "$file" || {
	echo $"	not a dynamic executable"
	result=1
      }
      ;;
    2)
      eval $add_env \${RTLD} '"$file"' || result=1
      ;;
    *)
      echo 'ldd:' ${RTLD} $"exited with unknown exit code" "($ret)" >&2
      exit 1
      ;;
    esac
  else
    echo 'ldd:' $"error: you do not have read permission for" "\`$file'" >&2
    result=1
  fi
done

exit $result
# Local Variables:
#  mode:ksh
# End:
