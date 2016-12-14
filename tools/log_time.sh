ps -ef | grep "cmd_id" *.log > cmd.log
awk -F "[=,]" 'BEGIN {count=0;} {name[count]=$2;esp[count]=$6 count++;}; NR>=2{print $2,$4,$6}' cmd.log > rst.log
awk -F ' ' 'BEGIN{count=0;} {a[$1]+=$3; t[$1]+=$2} END{for(i in a) printf"%d\t%d\t%f\t%f\t\n", i, t[i], a[i],(a[i]/t[i])}' rst.log>total.log