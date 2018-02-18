#!/usr/bin/perl -w

use MyFRDCSA qw(ConcatDir);
use PerlLib::SwissArmyKnife;

my $file = ConcatDir($ENV{HOME},'.bash_history');
{
  my $lines = {};
  my $i = 0;
  if (-f $file) {
    my $c = read_file($file);
    foreach my $line (split /\n/, $c) {
      $lines->{$line}++;
      if ($i++ > 1000) {
	last;
      }
    }
  }
  sub mylines {
    my $line = shift;
    print Dumper({Under => $line});
    return $lines->{$_};
  }
}

print Dumper(SortBy(
		    Processor => sub {$mylines($_)},
		    Values => [keys %$lines],
		   ));

# foreach my $item () {
#   print $lines->{$item}."\t".$item."\n";
# }
