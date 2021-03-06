use utf8;
package GenomePropertiesDB::Result::GpStepEvidenceGp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GenomePropertiesDB::Result::GpStepEvidenceGp

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<gp_step_evidence_gp>

=cut

__PACKAGE__->table("gp_step_evidence_gp");

=head1 ACCESSORS

=head2 auto_step

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 gp_accession

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 11

=head2 auto_gp_step

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "auto_step",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "gp_accession",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0, size => 11 },
  "auto_gp_step",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</auto_gp_step>

=back

=cut

__PACKAGE__->set_primary_key("auto_gp_step");

=head1 RELATIONS

=head2 auto_step

Type: belongs_to

Related object: L<GenomePropertiesDB::Result::GpStep>

=cut

__PACKAGE__->belongs_to(
  "auto_step",
  "GenomePropertiesDB::Result::GpStep",
  { auto_step => "auto_step" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 gp_accession

Type: belongs_to

Related object: L<GenomePropertiesDB::Result::GenomeProperty>

=cut

__PACKAGE__->belongs_to(
  "gp_accession",
  "GenomePropertiesDB::Result::GenomeProperty",
  { accession => "gp_accession" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "NO ACTION" },
);

=head2 gp_steps_to_go

Type: has_many

Related object: L<GenomePropertiesDB::Result::GpStepToGo>

=cut

__PACKAGE__->has_many(
  "gp_steps_to_go",
  "GenomePropertiesDB::Result::GpStepToGo",
  { "foreign.auto_gp_step" => "self.auto_gp_step" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2018-07-23 10:17:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h1d6N6SwbZkk+xDx7k6StQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
