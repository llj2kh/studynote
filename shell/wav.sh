#!/bin/bash

cd /samba/DLNA/Music/wav
for mu in *.wav;do
	aplay -D bluealsa:DEV=88:00:00:00:03:E5,PROFILE=A2DP $mu
done

