package MyFRDCSA::System;

use XML::Twig;

use strict;
use Carp;
use vars qw($VERSION);

$VERSION = '1.00';

use Class::MethodMaker new_with_init => 'new',
  get_set => [ qw / Conf Location Twig HomePage ClassConfigFile Classes ClassesOrdering / ];

sub init {
  my ($self,%args) = (shift,@_);
  #$self->Conf(Website::Conf->new);
  $self->Classes({});
  $self->ClassesOrdering([]);
  $self->Location($args{Location});
  $self->ClassConfigFile($args{ClassConfigFile});
  $self->ScanClasses;
  $self->HomePage
    (Website::HomePage->new
     (Website => $self,
      Location => $self->Location."/index.html"));
  $self->Twig
    (XML::Twig->new(pretty_print => 'indented'));
}

sub ScanClasses {
  my ($self,%args) = (shift,@_);
  my $t = XML::Twig->new(pretty_print => 'indented',
			 twig_handlers =>
			 {
			  class => sub { $self->HandleClass(Twig => $_) }
			 });
  $t->parsefile($self->ClassConfigFile);
  #my $classes = $t->root;
}

sub HandleClass {
  my ($self,%args) = (shift,@_);
  my $conf = $args{Twig};
  $conf->set_gi('class');
  my $from = $conf->first_child('from')->text;
  my $location = $from;
  $location =~ s/.*\/([\w-]+)$/$1/;
  my $class = Website::Class->new
      (Website => $self,
       Title => $conf->first_child('title')->text,
       From => $from,
       To => $conf->first_child('to')->text,
       Location => $self->Location."/frdcsa/$location");
  $self->AddClass(Name => $class->Title,
		  Class => $class);
}

sub AddClass {
  my ($self,%args) = (shift,@_);
  $self->Classes->{$args{Name}} = $args{Class};
  push @{$self->ClassesOrdering}, $args{Class};
}

sub ListClasses {
  my ($self,%args) = (shift,@_);
  #return values %{$self->Classes};
  return @{$self->ClassesOrdering};
}

sub CleanLocation {
  my ($self,%args) = (shift,@_);
}

1;
