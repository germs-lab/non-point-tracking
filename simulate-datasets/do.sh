spike='30'
ln -s /mnt/data1/lakelanier/16S-data/scenarios/epa-star-simulation/data/all.cleaned_rc.cleaned.fasta .
for n in {1..5}; do subsample_fasta.py -i all.cleaned_rc.cleaned.fasta -p .30 -o all.subsample$n.fa ; head -n 10000 all.subsample$n.fa > all.subsample.1000.rep$n.fa; rm all.subsample$n.fa; done
ln -s /mnt/data1/lakelanier/16S-data/scenarios/epa-star-simulation/data/16S.vulgatus.fa .
#edit below appropriately
for x in *rep*fa; do python add-spike.py 16S.vulgatus.fa $x 300 > ${x%*.fa}.$spike.fa; done
for x in *rep*$spike*fa; do python get-to-qiime-format.py $x ${x%.fa} > ${x%.fa}.renamed.fa; done
cat *renamed.fa >> all-lake-lanier.$spike.fa
pick_closed_reference_otus.py -o lakelanier-$spike/ -i all-lake-lanier.$spike.fa -r ../gg_13_8_otus/rep_set/97_otus.fasta