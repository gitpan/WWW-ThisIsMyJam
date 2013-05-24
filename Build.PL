
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Synchronous and asynchronous interfaces to This Is My Jam",
  "dist_author" => [
    "Sanko Robinson <sanko\@cpan.org>"
  ],
  "dist_name" => "WWW-ThisIsMyJam",
  "dist_version" => "v0.0.3",
  "license" => "artistic_2",
  "module_name" => "WWW::ThisIsMyJam",
  "recommends" => {
    "AnyEvent" => 0,
    "AnyEvent::HTTP" => 0
  },
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "HTTP::Tiny" => 0,
    "JSON::Tiny" => 0,
    "Moo" => 0,
    "Try::Tiny" => 0,
    "Type::Utils" => 0,
    "Types::Standard" => 0,
    "URI" => 0,
    "URI::QueryParam" => 0,
    "perl" => "5.010",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::Fatal" => 0,
    "Test::More" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
