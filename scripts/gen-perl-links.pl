#!/usr/bin/perl -w

# this program is to find all the perl links from within the
# directories

# some things we know about these

# they all are rooted in the base directory, such that their name corresponds to that

chdir "/var/lib/myfrdcsa/codebases";

my @res;
my $links = {};
foreach my $maindir (qw(internal minor)) {
  mkdir "$maindir";
  foreach my $dir (split /\n/, `ls $maindir`) {
    print "<$dir>\n";
    foreach my $file (split /\n/, `find $maindir/$dir/`) {
      if ($file =~ /\.pm$/) {
	print "<$file>\n";
	# now extract its name
	my $name = `grep package "$file"`;
	# print "$name\n";
	if ($name =~ /^\s*package\s*(.+);/) {
	  $packagename = $1;
	  $fn = $packagename;
	  $fn =~ s/::/\//g;
	  $fn .= ".pm";
	  if ($file eq "$maindir/$dir/$fn") {
	    print "\t$file\n";
	    if ($fn =~ /^(.+?)(\/.+)?$/) {
	      my $t1 = $1;
	      if ($t1 =~ /(.+).pm$/) {
				# there may be a file including this in the home dir, grep it
		foreach my $line (split /\n/, `grep "use $1;" $maindir/$dir/* 2>\&1 | grep -vE '^grep: .+: Is a directory\$'`) { 
		  if ($line =~ /(.+)?:use.*/) {
		    my $exec = $1;
		    if ($exec !~ /~/) {
		      Do("sudo ln -s /var/lib/myfrdcsa/codebases/$exec /usr/bin/");
		    }
		  }
		}
	      }
	      $links->{$maindir}->{$dir}->{$t1} = 1;
	    }
	  }
	}
      }
    }
  }
}

foreach my $k1 (sort keys %$links) {
  foreach my $k2 (sort keys %{$links->{$k1}}) {
    foreach my $k3 (sort keys %{$links->{$k1}->{$k2}}) {
      Do("sudo ln -s /var/lib/myfrdcsa/codebases/$k1/$k2/$k3 /usr/share/perl5/");
    }
  }
}

sub Do {
  my $c = shift;
  print "$c\n";
  system $c;
}
