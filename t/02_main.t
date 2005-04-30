#!/usr/bin/perl -w

# Main testing (such as it is) for HTML::Email::Obfuscate

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}

use Test::More tests => 21;
use HTML::Email::Obfuscate ();

my $email = "obfuscate\@ali.as";

my @objects = ();
$objects[0] = HTML::Email::Obfuscate->new;
$objects[1] = HTML::Email::Obfuscate->new( lite => 1 );
$objects[2] = HTML::Email::Obfuscate->new( javascript => 1 );
foreach my $object ( @objects ) {
	isa_ok( $object, 'HTML::Email::Obfuscate' );
	my $rv1 = $object->escape_html_lite( $email );
	ok( defined($rv1), '->escape_html_lite returns defined' );
	ok( ! ref($rv1),   '->escape_html_lite returns a string' );
	ok( length($rv1) > length($email), '->escape_html_lite returns a longer string' );
	my $rv2 = $object->escape_html( $email );
	ok( defined($rv2), '->escape_html returns defined' );
	ok( ! ref($rv2),   '->escape_html returns a string' );
	ok( length($rv2) > length($email), '->escape_html returns a longer string' );
}

exit(0);
