package Mojolicious::Plugin::SaveParam;

use Mojo::Base 'Mojolicious::Plugin';

our $VERSION = '0.01';

sub register {
    my ($self, $app) = @_;

    $app->routes->add_condition(save => \&_save);
}

sub _save {
    my ($r, $c, $captures, $params) = @_;
    
    $DB::single = 1;

    # All parameters need to exist
    my $p = $c->req->params;
    
    if (ref $params eq 'ARRAY') {
      foreach my $name (@{ $params }) {
        return unless _check(scalar $p->param($name), undef);
      }
    }
    elsif (ref $params eq 'HASH') {
      keys %$params;
      while (my ($name, $pattern) = each %$params) {
        return unless _check(scalar $p->param($name), $pattern);
      }
    }
    
    return 1;
}

1;

__END__

=head1 NAME

Mojolicious::Plugin::SaveParam - Save request state

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('SaveParam');

  # Mojolicious::Lite
  plugin 'SaveParam';

  # Save request state to $dir
  get '/' => (save => $dir) => sub {...};

=head1 DESCRIPTION

L<Mojolicious::Plugin::SaveParam> is a L<Mojolicious> plugin.

=head1 METHODS

L<Mojolicious::Plugin::SaveParam> inherits all methods from
L<Mojolicious::Plugin> and implements the following new ones.

=head2 register

  $plugin->register(Mojolicious->new);

Register plugin in L<Mojolicious> application.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
