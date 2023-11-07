#!/bin/bash

declare -A vuln_versions=(
    ["19.x"]="19.2.7.62195"
    ["20.x"]="20.1.4.57927"
    ["21.x"]="21.2.10.62186"
    ["22.x"]="22.0.1.62695"
)

declare -A non_vuln_versions=(
    ["20.x"]="20.1.8.66704"
    ["21.x"]="21.2.12.66701"
    ["22.x"]="22.0.12.66453"
)

function build_image() {
    echo -n "Building image version: ${2}"
    output=`docker build --force-rm --rm --quiet \
        --build-arg="PAPERCUT_MAJOR_VER=${1}" \
        --build-arg="PAPERCUT_VERSION=${2}" \
        --tag ghcr.io/isaac-gc/papercut_ng_mf:${2} .`
    echo " --> ${output}"
}

echo -e "\n"
echo "##############################################"
echo "##############################################"
echo "###    Papercut Docker Images Builder      ###"
echo "##############################################"
echo "##############################################"

echo -e "\n[*] Building Vulnerable Image versions"
for key in ${!vuln_versions[@]}
    do build_image $key ${vuln_versions[$key]}
done

echo -e "\n[*] Building Non-Vulnerable Image versions"
for key in ${!non_vuln_versions[@]}
    do build_image $key ${non_vuln_versions[$key]}
done

echo -e "\n[*] Done!"
