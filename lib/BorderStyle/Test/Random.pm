package BorderStyle::Test::Random;

use strict;
use warnings;

use Role::Tiny::With;
with 'BorderStyleRole::Spec::Basic';

# AUTHORITY
# DATE
# DIST
# VERSION

our %BORDER = (
    v => 3,
    summary => 'A border style that uses random characters',
    args => {
        cache => {
            schema => 'bool*',
            default => 1,
        },
    },
);

my @chars = map {chr($_)} 32 .. 127;

sub get_border_char {
    my ($self, %args) = @_;
    my $char = $args{char};
    my $repeat = $args{repeat} // 1;

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

    $c x $repeat;
}

1;
# ABSTRACT:
