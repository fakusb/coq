#!/usr/bin/env bash

. ../template/init.sh

cat > _CoqProject <<EOF
-R ./theories/ ""
theories/b.v
theories/a.v
theories/noSuchFile.v
EOF
touch theories/a.v
cat > theories/b.v <<EOF
Require a.
EOF

coq_makefile -f _CoqProject -o Makefile
make 2> stdErr.log || true
msg="noSuchFile.v"
grep -q $msg "stdErr.log"
