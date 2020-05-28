#!/usr/bin/bash

PARAMS=""

while (( "$#" )); do
  case "$1" in
    -t|--target)
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        TARGET=$2
        shift 2
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

if [[ "x${TARGET}" == "x" ]]
then
  echo "-t/--target (gke,generic) is mandatory"
  exit
fi

cp ${TARGET}/grafana/values.yaml.in ${TARGET}/grafana/values.yaml

cat ${TARGET}/grafana/dashboards/scylla-cpu.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-cpu.4.0.json.tmp
sed -i -e "/scylla-cpu-4.0:/r ${TARGET}/grafana/dashboards/scylla-cpu.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-cpu-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-cpu.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-cql.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-cql.4.0.json.tmp
sed -i -e "/scylla-cql-4.0:/r ${TARGET}/grafana/dashboards/scylla-cql.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-cql-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-cql.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-detailed.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-detailed.4.0.json.tmp
sed -i -e "/scylla-detailed-4.0:/r ${TARGET}/grafana/dashboards/scylla-detailed.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-detailed-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-detailed.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-errors.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-errors.4.0.json.tmp
sed -i -e "/scylla-errors-4.0:/r ${TARGET}/grafana/dashboards/scylla-errors.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-errors-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-errors.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-io.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-io.4.0.json.tmp
sed -i -e "/scylla-io-4.0:/r ${TARGET}/grafana/dashboards/scylla-io.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-io-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-io.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-os.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-os.4.0.json.tmp
sed -i -e "/scylla-os-4.0:/r ${TARGET}/grafana/dashboards/scylla-os.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-os-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-os.4.0.json.tmp

cat ${TARGET}/grafana/dashboards/scylla-overview.4.0.json | sed -e 's/^/          /' > ${TARGET}/grafana/dashboards/scylla-overview.4.0.json.tmp
sed -i -e "/scylla-overview-4.0:/r ${TARGET}/grafana/dashboards/scylla-overview.4.0.json.tmp" ${TARGET}/grafana/values.yaml
sed -i -e "/scylla-overview-4.0:/a\\      json: |" ${TARGET}/grafana/values.yaml
rm -f ${TARGET}/grafana/dashboards/scylla-overview.4.0.json.tmp
