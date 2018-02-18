#!/usr/bin/perl -w

use Manager::Dialog qw(Choose SubsetSelect);

use Data::Dumper;

my $act = 0;

my @commands;
my $choice = Choose("internal", "minor");
if ($choice eq "minor") {
  my @dirs = SubsetSelect
    (Set => [split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/minor`],
     Selection => {});
  foreach my $dir (@dirs) {
    if (! -d "/var/lib/myfrdcsa/codebases/minor-data/$dir") {
      push @commands, "mkdir /var/lib/myfrdcsa/codebases/minor-data/$dir";
    }
    if (! -d "/var/lib/myfrdcsa/codebases/minor/$dir/data") {
      push @commands, "ln -s /var/lib/myfrdcsa/codebases/minor-data/$dir /var/lib/myfrdcsa/codebases/minor/$dir/data";
    }
  }
} elsif ($choice eq "internal") {
  my @dirs = SubsetSelect
    (Set => [split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/internal`],
     Selection => {});
  foreach my $dir (@dirs) {
    if (! -d "/var/lib/myfrdcsa/codebases/data/$dir") {
      push @commands, "mkdir /var/lib/myfrdcsa/codebases/data/$dir";
    }
    if (! -d "/var/lib/myfrdcsa/codebases/internal/$dir/data") {
      push @commands, "ln -s /var/lib/myfrdcsa/codebases/data/$dir /var/lib/myfrdcsa/codebases/internal/$dir/data";
    }
  }
}

my $c = join("; ", @commands);
print $c."\n";
system $c if $act;
