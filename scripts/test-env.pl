#!/usr/bin/perl -w

# NONINTERACTIVE=true
if (exists $ENV{NONINTERACTIVE} and $ENV{NONINTERACTIVE} eq "true") {
  print "true\n";
} else {
  print "false\n";
}
