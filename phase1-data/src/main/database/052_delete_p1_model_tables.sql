UPDATE schema_version SET version = 51;

DROP TABLE p1_documents CASCADE;
DROP TABLE p1_proposal_keys CASCADE;
DROP TABLE p1_commons CASCADE;
DROP TABLE p1_investigators_container CASCADE;
DROP TABLE p1_investigators CASCADE;
DROP TABLE p1_sites CASCADE;
DROP TABLE p1_addresses CASCADE;
DROP TABLE p1_contacts CASCADE;
DROP TABLE p1_emails CASCADE;
DROP TABLE p1_phones CASCADE;
DROP TABLE p1_faxes CASCADE;
DROP TABLE p1_keyword_sets CASCADE;
DROP TABLE p1_keywords CASCADE;
DROP TABLE p1_attachment_sets CASCADE;
DROP TABLE p1_attachments CASCADE;
DROP TABLE p1_target_catalogs CASCADE;
DROP TABLE p1_targets CASCADE;
DROP TABLE p1_coordinate_systems CASCADE;
DROP TABLE p1_referent_supports CASCADE;
DROP TABLE p1_observatories CASCADE;
DROP TABLE p1_observation_lists CASCADE;
DROP TABLE p1_times CASCADE;
DROP TABLE p1_proposal_supports CASCADE;
DROP TABLE p1_publications CASCADE;
DROP TABLE p1_allocations CASCADE;
DROP TABLE p1_schedulings CASCADE;
DROP TABLE p1_optimal_date_ranges CASCADE;
DROP TABLE p1_itac_scheduled_date_ranges CASCADE;
DROP TABLE p1_impossible_date_ranges CASCADE;
DROP TABLE p1_sync_observing_date_ranges CASCADE;
DROP TABLE p1_resource_lists CASCADE;
DROP TABLE p1_resource_categories CASCADE;
DROP TABLE p1_resources CASCADE;
DROP TABLE p1_resource_components CASCADE;
DROP TABLE p1_resource_component_names CASCADE;
DROP TABLE p1_observatory_extensions CASCADE;
DROP TABLE p1_extensions CASCADE;
DROP TABLE p1_gemini_allocation_extensions CASCADE;
DROP TABLE p1_gemini_band3_extensions CASCADE;
DROP TABLE p1_itac_extensions CASCADE;
DROP TABLE p1_sub_details_extensions CASCADE;
DROP TABLE p1_tac_extensions CASCADE;
-- DROP TABLE p1_gemini_parts CASCADE;
DROP TABLE p1_submissions CASCADE;
DROP TABLE p1_host_countries CASCADE;
DROP TABLE p1_partner_submissions CASCADE;
DROP TABLE p1_partner_countries CASCADE;
DROP TABLE p1_submission_country_partner_submissions CASCADE;
DROP TABLE p1_observations CASCADE;
DROP TABLE p1_reference_list_supports CASCADE;
DROP TABLE p1_references CASCADE;
DROP TABLE p1_site_qualities CASCADE;
DROP TABLE p1_requirements CASCADE;
