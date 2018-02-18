package MyFRDCSA;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw ( Dir ConcatDir Head Body );
@EXPORT_OK = qw ( Dir ConcatDir Head Body );

use MyFRDCSA::File;

use strict;
use Carp;
use vars qw($VERSION);

$VERSION = '1.00';

use Class::MethodMaker new_with_init => 'new',
  get_set => [ qw / Dirs / ];

{
  my %dirs;
  $dirs{"home"} = "/var/lib/myfrdcsa";
  $dirs{"codebases"} =
    ConcatDir($dirs{"home"},"codebases");
  $dirs{"packages"} =
    ConcatDir($dirs{"home"},"packages");
  $dirs{"sandbox"} =
    ConcatDir($dirs{"home"},"sandbox");
  $dirs{"projects"} =
    ConcatDir($dirs{"home"},"projects");
  $dirs{"internal codebases"} =
    ConcatDir($dirs{"codebases"},"internal");
  $dirs{"minor codebases"} =
    ConcatDir($dirs{"codebases"},"minor");
  $dirs{"source hatchery"} =
    ConcatDir($dirs{"codebases"},"internal","source-hatchery");
  $dirs{"external codebases"} =
    ConcatDir($dirs{"codebases"},"external");
  $dirs{"releases"} =
    ConcatDir($dirs{"codebases"},"releases");
  $dirs{"binary packages"} =
    ConcatDir($dirs{"packages"},"binary");
  $dirs{"source packages"} =
    ConcatDir($dirs{"packages"},"source");
  $dirs{"partial packages"} =
    ConcatDir($dirs{"packages"},"partial");
  $dirs{"datasets"} =
    ConcatDir($dirs{"home"},"datasets");
  $dirs{"collections"} =
    ConcatDir($dirs{"home"},"collections");
  $dirs{"repositories"} =
    ConcatDir($dirs{"home"},"repositories");
  $dirs{"cvs repositories"} =
    ConcatDir($dirs{"repositories"},"cvs");
  $dirs{"git repositories"} =
    ConcatDir($dirs{"repositories"},"git");
  $dirs{"svn repositories"} =
    ConcatDir($dirs{"repositories"},"svn");
  $dirs{"private"} =
    ConcatDir($dirs{"home"},'private');
  $dirs{"private systems"} =
    ConcatDir($dirs{"private"},'systems');

  sub init {
    my ($self,%args) = (shift,@_);
    $self->Dirs(\%dirs);
  }

  sub Dir {
    my $key = shift;
    return $dirs{$key};
  }

}

sub ConcatDir {
  MyFRDCSA::File::ConcatDir(@_);
}

sub Head {
  my $file = shift;
  $file =~ s/^.*\/(.*)\/?$/$1/;
  return $file;
}

sub Body {
  my $file = shift;
  $file =~ s/^(.*)\/.*\/?$/$1/;
  return $file;
}

1;

