package Mojolicious::Plugin::Auth;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app) = @_;

    # authentication
    $app->helper(auth => sub {
        my ($self, $user) = @_;

        # load schema
        my $schema = $self->schema;

        # load user valid
        my $username_rs = $schema->resultset('User')->search( { username => $user->{user}, password => $user->{pass} } )->first;

        return $username_rs if $username_rs;
        return 0;
    });

    # logout
    $app->helper( is_auth => sub {
        my ( $self, $token ) = @_;

        # testar se o token é válido
        # se for válido, testar se está dentro do tempo limite
        # retornar 1 se estiver ok
        # retornar 0 se não estiver okay
    });
};

1;
