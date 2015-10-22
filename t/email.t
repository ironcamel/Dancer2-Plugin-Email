use Test::More;

use strict;
use warnings;

use lib 't/lib';

use EmailTest;
use Test::More;

use Test::WWW::Mechanize::PSGI;

my $mech = Test::WWW::Mechanize::PSGI->new(
    app =>  EmailTest->to_app
);

$mech->get_ok( '/contact' );
$mech->content_like( qr'Email sent.' );

done_testing;
