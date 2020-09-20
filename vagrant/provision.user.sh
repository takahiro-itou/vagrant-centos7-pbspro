#! /bin/bash  -xue

echo  Provisioning  ${USER} for ${HOSTNAME}
test  -f  ${HOME}/.provision.user  &&  exit 0

for srcDir in  /tmp/data/common/config  ; do
    if  test -d ${srcDir} ; then
        pushd  ${srcDir}
        chmod  -R   755  *.sh
        popd
        rsync  -av  ${srcDir}/  ${HOME}/
    fi
done

date  >  ${HOME}/.provision.user