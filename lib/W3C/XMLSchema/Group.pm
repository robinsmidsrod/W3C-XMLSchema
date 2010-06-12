package W3C::XMLSchema::Group;
use Moose;
with 'XML::Rabbit::Node';

has 'name' => (
    traits      => ['XPathValue'],
    xpath_query => './@name',
);

has 'ref' => (
    traits      => ['XPathValue'],
    xpath_query => './@ref',
);

has 'sequence' => (
    isa         => 'W3C::XMLSchema::Sequence',
    traits      => ['XPathObject'],
    xpath_query => './xsd:sequence',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 NAME

W3C::XMLSchema::Group - XMLSchema Group Definition


=head1 SYNOPSIS

    # Later...


=head1 DESCRIPTION

Groups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.


=head1 METHODS


=over 12


=item C<name>

Name given to group.


=item C<ref>

Name of other group this group references.


=item C<sequence>

The sequence this group requires. Instance of L<W3C::XMLSchema::Sequence>.


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
