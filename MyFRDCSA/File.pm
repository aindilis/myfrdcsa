package MyFRDCSA::File;

# use File::Spec;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw ( ConcatDir RelativeToPath IsaFile IsaDirectory IsAbsolute );

sub ConcatDir {
  my (@files) = (@_);
  my @new = @files;
  my $result;
  foreach my $file (@new) {
    $file =~ s/^\/+//;
    $file =~ s/\/+$//;
  }
  $result = join("/",@new);
  if ($files[0] =~ /^\//) {
    $result = "/$result";
  }
  if ($files[$#files] =~ /\/$/) {
    $result .= "/";
  }
  $result =~ s/.*\/\/+/\//;
  return $result;
}

sub IsaFile {
  my ($file) = (shift);
  return -f $file;
}

sub IsaDirectory {
  my ($file) = (shift);
  return -d $file;
}

sub IsAbsolute {

}

sub RelativeToPath {
  my ($path,@paths) = (shift,@_);
  my @a = split /\//,$path;
  my @results;
  foreach my $target (@paths) {
    my @b = split /\//,$target;
    my @c = @a;
    while (@b and @c and $b[0] eq $c[0]) {
      shift @b;
      shift @c;
    }
    push @results, ConcatDir("../" x scalar @c, @b);
  }
  if (@paths <= 1) {
    return $results[0];
  } else {
    return @results;
  }
}

1;
