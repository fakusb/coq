#!/usr/bin/env bash

. ../template/init.sh

cat > _CoqProject <<EOF
-R ./theories/ "Lib"
theories/a.v
EOF
cat > theories/a.v <<EOF
Require Lib.noSuchFile.
EOF

coq_makefile -f _CoqProject -o Makefile
make 2> stdErr.log || true
msg="noSuchFile"
grep -q $msg "stdErr.log"
