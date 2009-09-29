package MyAPP::Web::Controller::Root;
use Kamui;

sub dispatch_index {
    my ($class, $c, $args) = @_;
    $c->stash->{nick} = $c->req->param('nick') || 'nekokak';
    $c->stash->{name} = 'コバヤシアツシ';
    if ($args->{p} eq 'do_redirect') {
        return $c->redirect('/redirect_done');
    } else {
        $c->stash->{args} = $args->{p};
    }
}

sub dispatch_json {
    my ($class, $c) = @_;
    $c->stash->{json} = +{name => 'nekokak'};
    $c->view('JSON');
}

1;
