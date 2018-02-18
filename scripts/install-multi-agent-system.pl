#!/usr/bin/perl -w

use IO::File;
use Data::Dumper;

use IPC::Run3 'run3';

my $seen = {};

my %args = ();

$! = 1;

KillUniLang();

my $whoami = `whoami`;
chomp $whoami;
die "Must be root\n" unless $whoami eq 'root';

foreach my $script ("Installation of UniLang") {
  print "SCRIPT: <$script>\n";
  while (1) {

    my $res;
    my @cmd = ($^X, '/var/lib/myfrdcsa/codebases/internal/unilang/start','-s','-u','localhost','9000','-c','-W','5000');
    run3(\@cmd, undef, \$res, \$res);

    print "<<<$res>>>\n";
    if ($res =~ /^(Couldn't require [[:alnum:]:]+: )?Can't locate (.+?).pm /sm) {
      my $module = $2;
      if (exists $seen->{$module}) {
	print "Already seen $module, exiting!\n";
	exit(1);
      } else {
	print $res."\n";
	$seen->{$module} = 1;
	$module =~ s|/|::|g;
	# since radar isn't available necessarily, install by hand
	print $module."\n";
	my $copyofscript = $script;
	$copyofscript =~ s/[^[:alnum:]]/_/sg;
	my $fh = IO::File->new;
	$fh->open('>>/var/lib/myfrdcsa/codebases/internal/myfrdcsa/data/install.log');
	print $fh "$module - $script\n";
	$fh->close();
	# my $res = `echo '$module - $copyofscript' >> /var/lib/myfrdcsa/codebases/internal/myfrdcsa/data/install.log`;

	$debianpackage = $module;
	$debianpackage =~ s/::/-/g;
	$debianpackage = "lib".lc($debianpackage)."-perl";
	print $debianpackage."\n";
	my $res2 = `apt-cache search $debianpackage`;
	if ($res2 =~ /./) {
	  my $addition = "";
	  if (exists $ENV{NONINTERACTIVE} and $ENV{NONINTERACTIVE} eq "true") {
	    $addition = " -y";
	  }
	  system "sudo apt-get$addition install $debianpackage";
	} else {
	  # install via cpan
	  print "CPAN!\n";
	  my $force = $args{Force} ? " -f " : "";
	  if (0) {
	    my $c = "sudo cpan $force $module";
	    print "$c\n";
	    system $c;
	  } else {
	    my $perlmmusedefault = $ENV{PERL_MM_USE_DEFAULT};
	    $ENV{PERL_MM_USE_DEFAULT} = 1;
	    my $c = "sudo cpanm $force $module";
	    print "$c\n";
	    system $c;
	    $ENV{PERL_MM_USE_DEFAULT} = $perlmmusedefault
	  }
	}
      }
    } else {
      print "Nothing left to install, exiting!\n";
      exit(0);
    }

    KillUniLang();
  }
}

sub KillUniLang {
  system "/etc/init.d/unilang stop";
  system "killall start unilang unilang-client";
}
