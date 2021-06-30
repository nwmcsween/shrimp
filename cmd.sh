#!/bin/sh

cmd_exists() {
  type "$1" > /dev/null 2>&1
}
