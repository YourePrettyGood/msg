#!/bin/awk -f
#Expects a SAM on STDIN, feeds through header lines, and only outputs the
# first max_reads alignment records. This replicates the original MSG
# truncation procedure in parent1or2-hmm.sh.
#In the future, we could consider performing something like reservoir
# sampling on the alignment records, rather than taking the head.
BEGIN{
   FS="\t";
   OFS=FS;
   if (length(max_reads) == 0) {
      max_reads=0;
   };
   n=1;
}
#Feed through any header lines:
/^@/{
   print;
}
#
!/^@/{
   if (n <= max_reads || max_reads == 0) {
      print;
   };
   n+=1;
}
