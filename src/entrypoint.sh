#!/bin/bash

# print executed ARG1s to terminal
#set -x

function main {
  ARG1=$1
  ARG2=$2
  ARG3=$3
  # shift;
  case $ARG1 in
    fetch)
      case $ARG2 in
        action1)
          python launch_app.py --argkey1 argval1 --argkey2 argval2
          ;;
        action2)
          case $ARG3 in
            single)
              python launch_app.py --argkey1 argval1 --argkey2 argval2 --argkey3 argval3
              ;;
            *)
              python launch_app.py --argkey1 argval1 --argkey2 argval2 --argkey3 argval3
              ;;
          esac
      esac
      ;;
    *)
      echo "Nothing to do or args parsing failed"
      ;;
  esac
}


main $@
