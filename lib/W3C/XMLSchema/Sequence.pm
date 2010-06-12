package W3C::XMLSchema::Sequence;
use Moose;
with 'XML::Rabbit::Node';

has 'items' => (
    traits      => ['XPathObjectList'],
    xpath_query => './*',
    isa_map     => {
        'xsd:group'   => 'W3C::XMLSchema::Group',
        'xsd:element' => 'W3C::XMLSchema::Element',
    },
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 NAME

W3C::XMLSchema::Sequence - XMLSchema Sequence Definition


=head1 SYNOPSIS

    # Later...


=head1 DESCRIPTION

Sequence, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.


=head1 METHODS


=over 12


=item C<items>

List of items in this sequence. Instances of L<W3C::XMLSchema::Group> or
L<W3C::XMLSchema::Element>.


=item C<new>

Standard Moose constructor.


=item C<meta>

Moose meta object.


=item C<node>

Inherited from L<XML::Rabbit::Node>.


=item C<xpc>

Inherited from L<XML::Rabbit::Node>.


=item C<namespace_map>

Inherited from L<XML::Rabbit::Node>.


=back


=head1 BUGS

See L<W3C::XMLSchema/BUGS>.


=head1 SUPPORT

See L<W3C::XMLSchema/SUPPORT>.


=head1 AUTHOR

See L<W3C::XMLSchema/AUTHOR>.


=head1 COPYRIGHT

See L<W3C::XMLSchema/COPYRIGHT>.

=head1 LICENSE

See L<W3C::XMLSchema/LICENSE>.


=cut
