#!/usr/bin/perl -w

use Manager::Dialog qw(SubsetSelect Approve);

use Data::Dumper;

my $servers =
  {
   'andrewdo@justin.frdcsa.org' => 1,
   'andrewdo@columbcille.frdcsa.org' => 1,
   'andrewdo@box.posithon.org' => 1,
   'andrewdo@al.frdcsa.org' => 1,
   'andrewdo@frdcsa.onshore.net' => 1,
   'administrator@www.oicom.net' => 1,
   'koha@eolas.frdcsa.org' => 1,
  };

my @tosync = SubsetSelect
  (
   Set => [keys %$servers],
   Selection => $servers,
  );

# (need to figure out how to sync data that is used by things like
#  CPM across multiple machines 
#  (or not, just have a backup strategy))


# do we use expect here?, how do we do this?

# get access to the machine serving the passwords, and get the
# passwords for each of these

# make use of the password ring or whatever, see if there are API
# bindings for that

print Dumper(\@tosync);

# I believe the pattern is this, first run everything once, that
# ensures that the main box.posithon.org repo has everybody's stuff,
# then run it again, that propagates everything back to the clients.
# Perhaps we can skip the pulls, when we are pushing, and skip the
# pushes when we are pulling.  that should save time.

# figure out whether this is this server
# system "ssh $server bash -c /usr/bin/update-frdcsa-git";
