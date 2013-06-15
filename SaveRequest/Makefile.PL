use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::SaveRequest',
  VERSION_FROM => 'lib/Mojolicious/Plugin/SaveRequest.pm',
  AUTHOR       => 'Brian Medley <bpmedley@cpan.org>',
  PREREQ_PM    => {'Mojolicious' => '4.07'},
  test         => {TESTS => 't/*.t'}
);
