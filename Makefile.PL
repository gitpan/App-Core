#!/usr/bin/perl -w
use strict;
use ExtUtils::MakeMaker;
require 5.006;
my @basics = ( AUTHOR       => 'David Helkowski <cpan@codechild.com>',
               ABSTRACT     => 'Application server with modules, logs, sessions, api, and more.',
               NAME         => 'App::Core',
               VERSION_FROM => 'Core.pm',
               PREREQ_PM    => {
                    Carp => 0, 
                    Exporter => 0, 
                    "Test::More" => 0, 
                    "XML::Bare" => "0.45", 
                    "Class::Core" => "0.03",
                    "Term::ANSIColor" => 0,
                    "URI::Escape" => 0
               }
             );
if( $ExtUtils::MakeMaker::VERSION >= 6.31 ) {
  push( @basics, LICENSE => 'perl' );
}

if( !eval('use XML::Bare;') ) {
    my $ver = $XML::Bare::VERSION;
    if( $ver gt "0.45" ) {
        print STDERR "Your version of XML::Bare is not 0.45. 0.45 is the only version supported by this module.\n";
        exit 1;
    }
}

WriteMakefile( @basics );
