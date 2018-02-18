#!/usr/bin/perl -w

use MyFRDCSA;
use Data::Dumper;

if ($ENV{PATH} !~ q{/var/lib/myfrdcsa/codebases/}) {
  my @list;
  foreach my $place ("minor codebases", "internal codebases","private systems") {
    my $dir = Dir($place);
    foreach my $item (split /\n+/, `ls -d $dir/*/scripts`) {
      if (length $item and -d $item) {
	push @list, $item;
      }
    }
  }

  my @newlist;
  foreach my $element (@list) {
    if ($element ne '') {
      push @newlist, $element;
    }
  }

  print join(":",@newlist);

  # print join(":",@list);
}
