use strict;
use warnings;

package W3C::XMLSchema;
use Moose;
with 'XML::Rabbit::RootNode';

# ABSTRACT: Parser for W3C XML Schema Definition (XSD)

use 5.008;

=attr namespace_map

Namespace map for XMLSchema definition.

=cut

has '+namespace_map' => (
    default => sub { {
        'xsd' => 'http://www.w3.org/2001/XMLSchema',
    } }
);

=attr target_namespace

The namespace the schema definition targets.

=cut

has 'target_namespace' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@targetNamespace',
);

=attr attribute_groups

A list of all the attribute groups defined. Instances of L<W3C::XMLSchema::AttributeGroup>.

=cut

has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);

=attr groups

A list of all the groups defined. Instances of L<W3C::XMLSchema::Group>.

=cut

has 'groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Group]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:group',
);

=attr complex_types

A list of all the complex types defined. Instances of L<W3C::XMLSchema::ComplexType>.

=cut

has 'complex_types' => (
    isa         => 'ArrayRef[W3C::XMLSchema::ComplexType]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:complexType',
);

=attr elements

A list of all the elements defined. Instances of L<W3C::XMLSchema::Element>.

=cut

has 'elements' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Element]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:element',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 SYNOPSIS

    use W3C::XMLSchema;

    my $xsd=W3C::XMLSchema->new( file => shift );
    print "Target namespace: " . $xsd->target_namespace . "\n";

    print "Attribute groups:\n";
    foreach my $attr_group ( @{ $xsd->attribute_groups } ) {
        print $attr_group->name . "\n";
        foreach my $attr ( @{ $attr_group->attributes } ) {
            print "\t"
                 . $attr->name
                 . " (" . $attr->type . ") "
                 . ( $attr->use eq 'required' ? '*' : '-' )
                 . "\n";
        }
    }


=head1 DESCRIPTION

This is a module that makes it easy to iterate over and extract information
from an XML Schema definition (aka XSD), as defined by the W3C.

=head1 INCOMPLETE IMPLEMENTATION / WORK-IN-PROGRESS

This implementation is incomplete and should be considered a
work-in-progress. Please file bug reports (or provide patches) if something
you need is not extractable with the current API.

=head1 SEMANTIC VERSIONING

This module uses semantic versioning concepts from L<http://semver.org/>.

=head1 ACKNOWLEDGEMENTS

The following people have helped to review or otherwise encourage
me to work on this module.

Chris Prather (perigrin)


=head1 SEE ALSO

=for :list
* L<XML::Rabbit>
* L<XML::Toolkit>
* L<Moose>
* L<XML::LibXML>
