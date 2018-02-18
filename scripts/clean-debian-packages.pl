#!/usr/bin/perl -w

use Manager::Dialog qw(ApproveCommands);

my $icodebasedir = "/var/lib/myfrdcsa/codebases/internal";
my @commands;
foreach my $dir (split /\n/, `ls $icodebasedir`) {
  my $dir2 = `chase $icodebasedir/$dir`;
  chomp $dir2;
  my $size = `du -k -s $dir2`;
  if ($size =~ /^(\d+)\s+/) {
    print "$1\t<$dir2>\n";
    # now let's find the stupid things and remove them

    # all debian dirs
    push @commands, "mv $dir2/debian ~/mistakes/debian-${dir}";

    # all packages
    foreach my $file (split /\n/, `ls $dir2/..`) {
      push @commands, "mv $dir2/../${dir}_* ~/mistakes";
    }
  }
}

ApproveCommands
  (
   Commands => \@commands,
   Method => "parallel",
  );
