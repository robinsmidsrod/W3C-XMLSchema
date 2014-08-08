use strict;
use warnings;

package W3C::XMLSchema;
use XML::Rabbit::Root 0.1.0;

# ABSTRACT: Parser for W3C XML Schema Definition (XSD)

use 5.008;

add_xpath_namespace 'xsd' => 'http://www.w3.org/2001/XMLSchema';

=attr target_namespace

The namespace the schema definition targets.

=cut

has_xpath_value 'target_namespace' => './@targetNamespace';

=attr element_from_default

Form of elements declared into target namespace. Either qualified (elements
must be prefixed with namespace) or unqualified the default (elements don't
need namespace prefix).

=cut

has_xpath_value 'element_form_default' => './@elementFormDefault' => (
    default => 'unqualified',
);

=attr attribute_groups

A list of all the attribute groups defined. Instances of L<W3C::XMLSchema::AttributeGroup>.

=cut

has_xpath_object_list 'attribute_groups' => './xsd:attributeGroup' => 'W3C::XMLSchema::AttributeGroup';

=attr groups

A list of all the groups defined. Instances of L<W3C::XMLSchema::Group>.

=cut

has_xpath_object_list 'groups' => './xsd:group' => 'W3C::XMLSchema::Group';

=attr complex_types

A list of all the complex types defined. Instances of L<W3C::XMLSchema::ComplexType>.

=cut

has_xpath_object_list 'complex_types' => './xsd:complexType' => 'W3C::XMLSchema::ComplexType';

=attr elements

A list of all the elements defined. Instances of L<W3C::XMLSchema::Element>.

=cut

has_xpath_object_list 'elements' => './xsd:element' => 'W3C::XMLSchema::Element';

finalize_class();
1;

__END__

=head1 SYNOPSIS

    use W3C::XMLSchema;

    my $xsd = W3C::XMLSchema->new( file => shift );
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
