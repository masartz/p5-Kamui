use t::Utils;
use Test::Declare;
use Mock::Web::Dispatcher;

plan tests => blocks;

describe 'dispatcher tests' => run {
    test 'maping' => run {
        my $env = +{
            REQUEST_METHOD => 'GET',
            SCRIPT_NAME    => '/',
            PATH_INFO      => '/',
        };

        my $map = Mock::Web::Dispatcher->determine($env);
        is_deeply $map, {
            controller => 'Mock::Web::Controller::Root',
            action     => 'index',
            is_static  => 0,
            args       => {},
        };
    };
    test 'maping' => run {
        my $env = +{
            REQUEST_METHOD => 'GET',
            SCRIPT_NAME    => '/foo',
            PATH_INFO      => '/foo',
        };

        my $map = Mock::Web::Dispatcher->determine($env);
        is_deeply $map, {
            controller => 'Mock::Web::Controller::Root',
            action     => 'index',
            is_static  => 0,
            args       => { p => 'foo'},
        };
    };
};


