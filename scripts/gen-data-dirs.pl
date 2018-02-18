#!/usr/bin/perl -w

# this program is to find all the perl links from within the
# directories

# some things we know about these

# they all are rooted in the base directory, such that their name corresponds to that

my @commands1;
my @dirs = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/minor`;
foreach my $dir (@dirs) {
  if (! -d "/var/lib/myfrdcsa/codebases/minor-data/$dir") {
    push @commands1, "mkdir -p /var/lib/myfrdcsa/codebases/minor-data/$dir";
  }
}
@dirs = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/internal`;
foreach my $dir (@dirs) {
  if (! -d "/var/lib/myfrdcsa/codebases/data/$dir") {
    push @commands1, "mkdir -p /var/lib/myfrdcsa/codebases/data/$dir";
  }
}

foreach my $command (@commands1) {
  print $command."\n";
  system $command;
}


my @commands2;
my @dirs = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/minor`;
foreach my $dir (@dirs) {
  if (! -d "/var/lib/myfrdcsa/codebases/minor/$dir/data") {
    push @commands2, "ln -s /var/lib/myfrdcsa/codebases/minor-data/$dir /var/lib/myfrdcsa/codebases/minor/$dir/data";
  }
}
@dirs = split /\n/, `ls -1 /var/lib/myfrdcsa/codebases/internal`;
foreach my $dir (@dirs) {
  if (! -e "/var/lib/myfrdcsa/codebases/internal/$dir/data") {
    push @commands2, "ln -s /var/lib/myfrdcsa/codebases/data/$dir /var/lib/myfrdcsa/codebases/internal/$dir/data";
  }
}

foreach my $command (@commands2) {
  print $command."\n";
  system $command;
}
