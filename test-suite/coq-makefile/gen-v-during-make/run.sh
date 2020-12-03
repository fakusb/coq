#!/usr/bin/env bash

. ../template/init.sh

cat > _CoqProject <<EOF
-R ./theories/ ""
theories/generatedInPreAll.v
EOF
touch Makefile.local
echo -e "theories/generatedInPreAll.v:\n\ttouch theories/generatedInPreAll.v" > Makefile.local

coq_makefile -f _CoqProject -o Makefile
make 2> stdErr.log
[ -s stdErr.log ]
