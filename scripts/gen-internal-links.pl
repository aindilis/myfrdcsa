#!/usr/bin/perl -w

chdir "/var/lib/myfrdcsa/codebases";
mkdir "internal";

my $highest = {};

foreach my $file (split /\n/,`ls -1 /var/lib/myfrdcsa/codebases/releases`) {
  print $file."\n";
  if ($file =~ /(.*)-(.*)/) {
    if (exists $highest->{$1}) {
      if ($highest->{$1} < $2) {
	$highest->{$1} = $2;
      }
    } else {
      $highest->{$1} = $2;
    }
  }
}

foreach my $key (keys %{$highest}) {
  my $version = $highest->{$key};
  my $c = "ln -s /var/lib/myfrdcsa/codebases/releases/$key-$version/$key-$version /var/lib/myfrdcsa/codebases/internal/$key";
  print "$c\n";
  system $c;
}
