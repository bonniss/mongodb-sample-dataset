#!/bin/bash
# vim:sw=4:ts=4:et:ai:ci:sr:nu:syntax=sh
##############################################################
# Usage ( * = optional ):                                    #
# ./script.sh <action (-d|--dump|-r|--restore)> *<db-address> *<db-port> *<username> *<password> #
##############################################################

dump() {
  echo Dumping...

  if [ ! -z "$4" ]; then
      if [ ! -z "$5" ]; then
          echo "Using password authentication!"
          auth="--authenticationDatabase admin -u $4 -p $5"
      fi
  fi

  HOST=${2:-localhost} # default server is the localhost
  PORT=${3:-27017}     # default port for MongoDB is 27017

  for directory in *; do
      if [ -d "${directory}" ] ; then
          echo "$directory"

          # Moving back and forth to output directory,
          # as you cannot use the `--archive` option with the `--out` option.
          mongodump --archive="$directory.gz" --gzip --host $HOST --port $PORT --db "$directory" $auth
      fi
  done

  echo "Done dumping."
}

restore() {
  echo Restoring from gzip files...

  if [ ! -z "$4" ]; then
      if [ ! -z "$5" ]; then
          echo "Using password authentication!"
          auth="--authenticationDatabase admin -u $4 -p $5"
      fi
  fi

  HOST=${2:-localhost} # default server is the localhost
  PORT=${3:-27017}     # default port for MongoDB is 27017

  for gz_file in *.gz; do
      if [ -f "${gz_file}" ] ; then
          echo "$gz_file"
          fname=$(basename "$gz_file" .gz)
          mongorestore --drop --archive="./$gz_file" --gzip --nsInclude="$fname.*" --host $HOST --port $PORT $auth
      fi
  done

  echo "Done restore."
}


if [ ! -z "$1" ]; then
  if [ "$1" = '-d' ] || [ "$1" = '--dump' ]; then
    dump
    exit 0
  elif [ "$1" = '-r' ] || [ "$1" = '--restore' ]; then
    restore
    exit 0
  else
    echo "Invalid action, expects: -d or --dump or -r or--restore"
    exit 1
  fi
fi
echo "Action is required: -d or --dump or -r or--restore"
exit 1
