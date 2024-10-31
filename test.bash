#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Yamato Nunomura
ng () {
	 echo ${1}行目が違うよ
	 res=1
}

res=0
### 正常 ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### 変な状態 ###
out=$(echo あ | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
