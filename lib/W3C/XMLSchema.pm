package W3C::XMLSchema;
use Moose;
with 'XML::Rabbit::RootNode';

use 5.008;

our $VERSION = '0.01';

has '+namespace_map' => (
    default => sub { {
        'xsd' => 'http://www.w3.org/2001/XMLSchema',
    } }
);

has 'target_namespace' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@targetNamespace',
);

has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);

has 'groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Group]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:group',
);

has 'complex_types' => (
    isa         => 'ArrayRef[W3C::XMLSchema::ComplexType]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:complexType',
);

has 'elements' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Element]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:element',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=encoding utf8

=head1 NAME

W3C::XMLSchema - Parser for W3C XML Schema Definition (XSD)

=head1 VERSION

Version 0.01


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


=head1 METHODS


=over 12


=item C<new>

Inherited Moose constructor.


=item C<target_namespace>

The namespace the schema definition targets.


=item C<attribute_groups>

A list of all the attribute groups defined. Instances of L<W3C::XMLSchema::AttributeGroup>.


=item C<groups>

A list of all the groups defined. Instances of L<W3C::XMLSchema::Group>.


=item C<complex_types>

A list of all the complex types defined. Instances of L<W3C::XMLSchema::ComplexType>.


=item C<elements>

A list of all the elements defined. Instances of L<W3C::XMLSchema::Element>.


=item C<namespace_map>

Namespace map for XMLSchema definition.


=item C<node>

Inherited from L<XML::Rabbit::RootNode>.


=item C<xpc>

Inherited from L<XML::Rabbit::RootNode>.


=item C<meta>

Moose meta object.


=item C<dump_xml>

Inherited from L<XML::Rabbit::Role::Node>.


=item C<dump_document_xml>

Inherited from L<XML::Rabbit::Role::Document>.


=back


=head1 BUGS

Please report any bugs or feature requests to C<bug-w3c-xmlschema at
rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=W3C-XMLSchema>.  I will be
notified, and then you'll automatically be notified of progress on your bug
as I make changes.


=head1 AVAILABILITY

The latest version of this module can be downloaded from
http://github.com/robinsmidsrod/W3C-XMLSchema/


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc W3C::XMLSchema


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=W3C-XMLSchema>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/W3C-XMLSchema>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/W3C-XMLSchema>

=item * Search CPAN

L<http://search.cpan.org/dist/W3C-XMLSchema/>

=back


=head1 ACKNOWLEDGEMENTS

The following people have helped to review or otherwise encourage
me to work on this module.

Chris Prather (perigrin)


=head1 AUTHOR

Robin Smidsrød, C<< <robin at smidsrod.no> >>


=head1 COPYRIGHT

Copyright 2009 Robin Smidsrød.


=head1 LICENSE

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://dev.perl.org/licenses/ for more information.


=head1 SEE ALSO

L<XML::Rabbit>, L<XML::Toolkit>, L<Moose>, L<XML::LibXML>


=cut
