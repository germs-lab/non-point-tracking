python list-samples.py otus.txt
python otus-significant.py otu.proportions.txt
python get-otu-sequences.py > ids.txt
#combine all original fastas
#cat *combined*fa >> all-combined.fa
python retrieve-fasta.py > ids.fa
pick_de_novo_otus.py -i ids.fa -o denovo-select -p /mnt/data1/lakelanier/16S-4/param.txt