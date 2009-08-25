package W3C::XMLSchema::Element;
use Moose;
with 'Rabbit::Node';

has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);

has 'type' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@type',
);

has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);

has 'minOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@minOccurs',
);

has 'maxOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@maxOccurs',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 NAME

W3C::XMLSchema::Attribute - XMLSchema Attribute Definition


=head1 SYNOPSIS

    # Later...


=head1 DESCRIPTION

Attribute, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.


=head1 METHODS


=over 12


=item C<name>

Name given to attribute.


=item C<type>

Type given of attribute.


=item C<ref>

Identifier of the element this element refers to.


=item C<minOccurs>

Minimum amount of occurences.


=item C<maxOccurs>

Maximum amount of occurences. 'unbounded' means no upper limit.


=item C<new>

Standard Moose constructor.


=item C<meta>

Moose meta object.


=item C<node>

Inherited from L<Rabbit::Node>.

=item C<xpc>

Inherited from L<Rabbit::Node>.


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
