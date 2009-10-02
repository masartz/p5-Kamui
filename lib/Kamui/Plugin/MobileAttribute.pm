package Kamui::Plugin::MobileAttribute;
use Kamui;
use base 'Kamui::Plugin';
use HTTP::MobileAttribute;

sub register_method {
    +{
        mobile_attribute => sub {
            my $c = shift;
            HTTP::MobileAttribute->new($c->req->headers);
        },
    };
}

1;
