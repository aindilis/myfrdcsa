#!/usr/bin/perl

my @list =
  (
   "/var/lib/myfrdcsa/codebases/internal/packager/scripts/install-script-dependencies",
   "/var/lib/myfrdcsa/codebases/internal/myfrdcsa/scripts/update-frdcsa-git",
   "/var/lib/myfrdcsa/codebases/internal/myfrdcsa/scripts/create-data-dir.pl",
  );

foreach my $file (@list) {
  system "sudo ln -s $file /usr/bin";
}
