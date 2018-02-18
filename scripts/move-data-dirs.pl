#!/usr/bin/perl -w

use Data::Dumper;
use Manager::Dialog qw(ApproveCommands);

my @commands;
my $icodebasedir = "/var/lib/myfrdcsa/codebases/internal";
foreach my $dir (split /\n/,`ls $icodebasedir`) {
  print "<$dir>\n";
  if (-d "$icodebasedir/$dir/data") {
    my $res =`chase $icodebasedir/$dir/data`;
    print $res."\n";
    if ($res =~ q|/var/lib/myfrdcsa/codebases/data/|) {
      # do not move it
    } else {
      # move it
      my $c = [
	       "mv $icodebasedir/$dir/data /var/lib/myfrdcsa/codebases/data/$dir",
	       "ln -s /var/lib/myfrdcsa/codebases/data/$dir $icodebasedir/$dir/data",
	      ];
      push @commands, @$c;
    }
  } else {
    # create it and add symlink
    my $c = [
	     "mkdir /var/lib/myfrdcsa/codebases/data/$dir",
	     "ln -s /var/lib/myfrdcsa/codebases/data/$dir $icodebasedir/$dir/data",
	    ];
    push @commands, @$c;
  }
  if (-d "$icodebasedir/$dir/.incoming") {
    my $c = [
	     "mv $icodebasedir/$dir/.incoming $icodebasedir/$dir/data",
	    ];
    push @commands, @$c;
  }
}

ApproveCommands
  (
   Commands => \@commands,
   Method => "parallel",
  );
