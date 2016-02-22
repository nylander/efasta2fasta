#!/usr/bin/perl 
#===============================================================================
=pod

=head1

         FILE: efasta2fasta.pl

        USAGE: ./efasta2fasta.pl file.efasta 

  DESCRIPTION: Convert efasta to fasta by taking the first item in the
               list {,,,} for every ambiguity. 

               Input:  efasta file(s)

               Output: fasta file named from the input (with added
                       file ending ".fas")

      OPTIONS: ---

 REQUIREMENTS: ---

         BUGS: ---

        NOTES: ---

       AUTHOR: Johan Nylander (JN), Johan.Nylander@bils.se

      COMPANY: BILS/NRM

      VERSION: 1.0

      CREATED: 09/22/2015 02:53:00 PM

     REVISION: ---

=cut

#===============================================================================

use strict;
use warnings;

exec('perldoc', $0) unless (@ARGV);

while(my $infile = shift(@ARGV)) {
    my $outfile = $infile . ".fas";
    my $term    = $/;
    open my $INFILE, "<", $infile or die "Could not open infile $infile : $! \n";
    open my $OUTFILE, ">", $outfile or die "Could not open outfile $outfile for printing: $! \n";
    $/ = ">";
    while(<$INFILE>) {
        chomp;
        next if($_ eq '');
        my ($id, @sequencelines) = split /\n/;
        print $OUTFILE ">$id\n";
        my $seq = q{};
        foreach my $line (@sequencelines) {
            $seq .= $line;
        }
        $seq =~ s/{([\s|\w]*),[^}]*}/$1/g;
        $seq =~ s/(.{60})/$1\n/g;
        print $OUTFILE $seq, "\n";
    }
    $/ = $term;
    close($INFILE);
    close($OUTFILE);
}
