#!/bin/bash

##log on
ssh -i "CpgSite.pem" ec2-user@ec2-34-203-200-196.compute-1.amazonaws.com


## clean non-standard chromosome 
sed -i "/chrUn/d" Conserved_TFBS
sed -i "/hap[1-9]\t/d" Conserved_TFBS
sed -i "/random\t/d" Conserved_TFBS
