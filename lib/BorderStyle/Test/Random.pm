package BorderStyle::Test::Random;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;
use parent 'BorderStyleBase';

our %THEME = (
    v => 2,
    summary => 'A border style that uses random characters',
    dynamic => 1,
    args => {
        cache => {
            schema => 'bool*',
            default => 1,
        },
    },
);

my @chars = map {chr($_)} 32 .. 127;

sub get_border_char {
    my ($self, $y, $x, $n, $args) = @_;
    $n = 1 unless defined $n;

    my $c;
    if ($self->{args}{cache}) {
        if (defined $self->{_cache}) {
            $c = $self->{_cache};
        } else {
            $self->{_cache} = $c = $chars[@chars * rand()];
        }
    } else {
        $c = $chars[@chars * rand()];
    }

    $c x $n;
}

1;
# ABSTRACT:
