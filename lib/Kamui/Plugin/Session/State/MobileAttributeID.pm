package Kamui::Plugin::Session::State::MobileAttributeID;
use Kamui;
use base 'Kamui::Plugin::Session::State';
use HTTP::MobileAttribute  plugins => [
    'UserID',
    'CIDR',
];

sub new {
    my $class = shift;

    bless +{
        c        => undef,
        check_ip => 1,
        @_
    }, $class,
}

sub get_session_id {
    my $self = shift;

    my $ma = $self->{c}->mobile;
    if ($ma->can('user_id') and (my $user_id = $ma->user_id)) {
        if ($self->{check_ip}) {
            my $ip = $ENV{REMOTE_ADDR} || $self->{c}->req->address || die "cannot get address";
            if (!$ma->isa_cidr($ip)) {
                die "SECURITY: invalid ip($ip, $ma, $user_id)";
            }
        }
        return $user_id;
    } else {
        return '';
    }
}

sub generate_session_id { $_[0]->get_session_id }
sub set_session_id {}
sub remove_session_id {}
sub finalize {}

1;

