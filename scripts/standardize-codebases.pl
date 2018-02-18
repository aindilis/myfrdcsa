#!/usr/bin/perl -w

my $mapping = {
	       "doc" => "frdcsa/doc",
	       "cpan" => "frdcsa/perl",
	       "debian" => "frdcsa/debian",
	       "el" => "frdcsa/emacs",
	      };

my $icodebasedir = "/var/lib/myfrdcsa/codebases/internal";
foreach my $dir (split /\n/, `ls $icodebasedir`) {
  # print "$icodebasedir/$dir\n";
  foreach my $item (keys %$mapping) {
    if (-d "$icodebasedir/$dir/$item") {
      my $command = "mv $icodebasedir/$dir/$item $icodebasedir/$dir/".$mapping->{$item};
      print $command."\n";
      system $command;
    }
  }
}
