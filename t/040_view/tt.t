use t::Utils;
use Test::Declare;
use Kamui::Web::Context;
use Mock::Container;
use Mock::Web::Handler;

plan tests => blocks;

describe 'view tt tests' => run {
    test 'render' => run {
        my $c = Kamui::Web::Context->new(
            dispatch_rule => {
                controller => 'Mock::Web::Controller::Root',
                action     => 'fillin',
                is_static  => 0,
                args       => {},
            },
            app  => 'Mock::Web::Handler',
            view => 'Kamui::View::TT',
            conf => container('conf'),
        );
        my $res = $c->render;
        isa_ok $res, 'Kamui::Web::Response';
        is $res->status, 200;
        is $res->body, 'my name is <input type="text" name="name" value="" />.' . "\n";
    };
};

