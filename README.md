# efasta2fasta
Convert extended fasta (efasta) to fasta

## The one-liner:

    perl -0076 -ne 'chomp;($h,@r)=split/\n/;$s=join("",@r);$s=~s/{([\s|\w]*),[^}]*}/$1/g;$s=~s/(.{60})/$1\n/g;print">$h\n$s\n" unless(!$h);' file.efasta

#### USAGE

    ./efasta2fasta.pl file.efasta 

#### DESCRIPTION

Convert efasta to fasta by taking the first item in the list {,,,} for every ambiguity.

**efasta** - extended fasta format (from [Allpath-LG](http://broadinstitute.org/crd/computational-research-and-development)):

"ALLPATHS-LG introduces efasta output format, which extends fasta
format to capture ambiguities within the assembly which might
otherwise be lost.  These ambiguities may arise from biological
sources (e.g., SNPs & CNVs) or from uncertainties in the data.  In
efasta format, ambiguities are represented as a comma-separated list
of alternatives within curly braces ("{}").  For example, an A/T SNP
would become: ATGTC{A,T}TGTCG.  An unresolved homopolymer run where
the evidence suggested there should be 6, 7, or 8 Ts would become:
GTCACTTTTTT{,T,TT}.  Within the braces, alternatives are ordered in
terms of decreasing likelihood."

##### Input:
efasta file(s)

##### Output:
fasta file named from the input (with added file ending `.fas`)

#### AUTHOR

Johan Nylander (JN), Johan.Nylander@bils.se

##### COMPANY

BILS/NRM

##### VERSION

1.0

#### CREATED

09/22/2015 02:53:00 PM


