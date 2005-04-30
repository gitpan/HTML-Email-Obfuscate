use inc::Module::Install;

name          ( 'HTML-Email-Obfuscate'        );
abstract      ( 'Your suitcase nuke in the fight against email scraping' );
author        ( 'Adam Kennedy <cpan@ali.as>'  );
version_from  ( 'lib/HTML/Email/Obfuscate.pm' );
license       ( 'perl'                        );

requires      ( 'perl'             => '5.005' );
requires      ( 'HTML::Parser'     => '2.25'  );

build_requires( 'Test::More'       => '0.47'  );
build_requires( 'File::Spec'       => '0.82'  );

auto_install();

&WriteAll;
