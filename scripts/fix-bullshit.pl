#!/usr/bin/perl -w

my @dirs = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/internal`;
foreach my $dir (@dirs) {
  my $thisdir = "/var/lib/myfrdcsa/codebases/internal/$dir/data/$dir";
  if (-d $thisdir) {
    my $chase = `chase $thisdir`;
    chomp $chase;
    if ($chase eq "/s1/temp/myfrdcsa/codebases/data/$dir") {
      my $c = "rm $thisdir";
      print $c."\n";
      system $c;
    }
  }
}

my @dirs2 = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/minor`;
foreach my $dir (@dirs2) {
  my $thisdir = "/var/lib/myfrdcsa/codebases/minor/$dir/data/$dir";
  if (-d $thisdir) {
    my $chase = `chase $thisdir`;
    chomp $chase;
    if ($chase eq "/s1/temp/myfrdcsa/codebases/minor-data/$dir") {
      my $c = "rm $thisdir";
      print $c."\n";
      system $c;
    }
  }
}
