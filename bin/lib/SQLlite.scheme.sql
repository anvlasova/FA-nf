CREATE  TABLE IF NOT EXISTS  'gene' (
  'gene_id' INTEGER PRIMARY KEY ,
  'gene_name' TEXT NOT NULL ,
  'sequence' TEXT ,
  'start' INTEGER NOT NULL DEFAULT '0' ,
  'end' INTEGER NOT NULL DEFAULT '0' ,
  'stable_id' TEXT ,
  'strand' TEXT);

CREATE  TABLE IF NOT EXISTS  'protein' (
  'protein_id' INTEGER PRIMARY KEY  ,
  'protein_name' TEXT NOT NULL DEFAULT '' ,
  'sequence' TEXT,
  'stable_id' TEXT NOT NULL DEFAULT '' ,
  'comment' TEXT,
  'cds_start' INTEGER NOT NULL DEFAULT '0' ,
  'cds_end' INTEGER NOT NULL DEFAULT '0' ,
  'seq_id' TEXT NOT NULL DEFAULT '' ,
  'cds_strand' TEXT ,
  'domain_checked' INTEGER NOT NULL DEFAULT '0' ,
  'gene_id' INTEGER NOT NULL ,
  'definition' TEXT,
  'sha1' TEXT,
  'status' INTEGER);



CREATE  TABLE IF NOT EXISTS  'domain' (
  'domain_id' INTEGER PRIMARY KEY  ,
  'domain_name' TEXT NOT NULL DEFAULT '' ,
  'sequence' TEXT ,
  'description' TEXT NOT NULL DEFAULT '' ,
  'rel_start' INTEGER ,
  'rel_end' INTEGER ,
  'db_xref' TEXT NOT NULL DEFAULT '' ,
  'score' REAL NOT NULL DEFAULT '0' ,
  'evalue' REAL NOT NULL DEFAULT '0' ,
  'ip_id' INTEGER ,
  'ip_desc' TEXT,
  'go' TEXT,
  'protein_id' INTEGER  NOT NULL  );

CREATE  TABLE IF NOT EXISTS  'kegg_group' (
  'kegg_group_id'  INTEGER  PRIMARY KEY  ,
  'name' TEXT ,
  'definition' TEXT,
  'pathway' TEXT,
  'module' TEXT ,
  'class' TEXT ,
  'db_links' TEXT ,
  'db_id' TEXT  ,
  'kegg_release'  INTEGER);

CREATE  TABLE IF NOT EXISTS  'organism' (
  'organism_id' INTEGER  PRIMARY KEY  ,
  'species' TEXT,
  'reign' TEXT NOT NULL DEFAULT '' ,
  'taxonomy_id' INTEGER ,
  'name' TEXT ,
  'synonyms' TEXT,
  'kegg_code' TEXT );

CREATE  TABLE IF NOT EXISTS  'ortholog' (
  'ortholog_id'  INTEGER PRIMARY KEY ,
  'name' TEXT NOT NULL DEFAULT '' ,
  'db_id' TEXT  ,
  'db_name' TEXT,
  'organism_id' INTEGER NOT NULL );

CREATE  TABLE IF NOT EXISTS  'protein_ortholog' (
  'protein_ortholog_id' INTEGER  PRIMARY KEY ,
  'type' TEXT,
  'kegg_group_id'  INTEGER NOT NULL ,
  'protein_id' INTEGER  NOT NULL ,
  'ortholog_id'  INTEGER NOT NULL );

CREATE  TABLE IF NOT EXISTS  'ipscn_version' (
  'idipscn_version_id' INTEGER PRIMARY KEY ,
  'ipscn_version' TEXT NOT NULL ,
  'domain_id' INTEGER  NOT NULL );

CREATE  TABLE IF NOT EXISTS  'go_term' (
  'go_term_id' INTEGER PRIMARY KEY ,
  'go_acc' TEXT NOT NULL ,
  'go_name' TEXT ,
  'term_type' TEXT );

CREATE  TABLE IF NOT EXISTS  'protein_go' (
  'protein_go_id' INTEGER PRIMARY KEY ,
  'go_term_id' INTEGER  NOT NULL ,
  'protein_id' INTEGER  NOT NULL ,
  'source' TEXT );

CREATE  TABLE IF NOT EXISTS  'blast_hit' (
  'blast_hit_id' INTEGER PRIMARY KEY ,
  'protein_id' INTEGER NOT NULL ,
   hit_id TEXT NOT NULL,
   score FLOAT NOT NULL,
   description TEXT,
   start INTEGER,
   end INTEGER,
   length INTEGER,
   evalue REAL NOT NULL,
   hsp_length INTEGER,
   percent_identity REAL   );

CREATE  TABLE IF NOT EXISTS  'signalP' (
  'signalP_id' INTEGER PRIMARY KEY ,
  'protein_id' INTEGER  NOT NULL ,
  start INTEGER NOT NULL,
  end INTEGER NOT NULL,
  score REAL NOT NULL,
  description TEXT  );

CREATE  TABLE IF NOT EXISTS  'chloroP' (
  'chloroP_id' INTEGER PRIMARY KEY ,
  'protein_id' INTEGER  NOT NULL ,
  start INTEGER NOT NULL,
  end INTEGER NOT NULL,
  score REAL NOT NULL,
  description TEXT  );

CREATE  TABLE IF NOT EXISTS  'targetP' (
  'targetP_id' INTEGER PRIMARY KEY ,
  'protein_id' INTEGER  NOT NULL ,
  location TEXT NOT NULL,
  RC INTEGER NOT NULL );


CREATE TABLE 'cd_search_features' (
  'cd_search_features_id' INTEGER PRIMARY KEY  ,
  'protein_id' INTEGER  NOT NULL ,
  'title' TEXT NOT NULL DEFAULT '' ,
  'Type' TEXT ,
  'coordinates' TEXT,
  'complete_size' INTEGER,
  'mapped_size' INTEGER ,
  'source_domain' TEXT );

CREATE TABLE 'cd_search_hit' (
  'cd_search_hit_id' INTEGER PRIMARY KEY  ,
  'protein_id' INTEGER  NOT NULL ,
  'accession' TEXT NOT NULL DEFAULT '' ,
  'Superfamily' TEXT,
  'Hit_type' TEXT ,
  'PSSM_ID' TEXT,
  'coordinateFrom' INTEGER ,
  'coordinateTo' INTEGER ,
  'E_Value' REAL ,
  'Bitscore' REAL ,
  'Short_name' TEXT ,
  'Incomplete' TEXT );

CREATE  TABLE IF NOT EXISTS  'xref' (
  'xref_id' INTEGER PRIMARY KEY ,
  'dbname' TEXT NOT NULL DEFAULT '' ,
  'dbid' TEXT NOT NULL DEFAULT '' ,
  'protein_id' INTEGER  NOT NULL );



CREATE  TABLE IF NOT EXISTS  'orthologxref' (
  'orthologxref_id' INTEGER PRIMARY KEY ,
  'dbname' TEXT NOT NULL DEFAULT '' ,
  'dbid' TEXT NOT NULL DEFAULT '' ,
  'ortholog_id' INTEGER NOT NULL 
  );

CREATE  TABLE IF NOT EXISTS  'pathway' (
  'pathway_id'  INTEGER PRIMARY KEY ,
  'stable_id' TEXT NOT NULL DEFAULT '' ,
  'db_id' TEXT NOT NULL DEFAULT '' ,
  'db_name' TEXT NOT NULL DEFAULT '' ,
  'name' TEXT NULL DEFAULT NULL ,
  'go' TEXT NULL DEFAULT NULL ,
  'evidence_type' TEXT NOT NULL DEFAULT '' );


CREATE  TABLE IF NOT EXISTS  'reaction' (
  'reaction_id'  INTEGER PRIMARY KEY ,
  'stable_id' TEXT NOT NULL DEFAULT '' ,
  'db_id' TEXT NOT NULL DEFAULT '' ,
  'db_name' TEXT NOT NULL DEFAULT '' ,
  'name' TEXT NULL DEFAULT NULL ,
  'evidence_type' TEXT NOT NULL DEFAULT '' );


CREATE  TABLE IF NOT EXISTS  'ortholog_reaction' (
  'ortholog_reaction_id' INTEGER PRIMARY KEY ,
  'ortholog_id' INTEGER NOT NULL ,
  'reaction_id' INTEGER UNSIGNED NOT NULL 
);

CREATE  TABLE IF NOT EXISTS  'complex' (
  'complex_id' INTEGER PRIMARY KEY ,
  'db_id' TEXT NOT NULL DEFAULT '',
  'db_name' TEXT NOT NULL DEFAULT '',
  'name' TEXT NULL DEFAULT NULL,
  'stable_id' TEXT NOT NULL DEFAULT '' 
  );


CREATE  TABLE IF NOT EXISTS  'ortholog_complex' (
  'ortholog_complex_id' INTEGER PRIMARY KEY ,
  'complex_id' INTEGER  NOT NULL ,
  'ortholog_id' INTEGER NOT NULL  );

CREATE  TABLE IF NOT EXISTS  'reaction_pathway' (
  'reaction_pathway_id' INTEGER PRIMARY KEY ,
  'reaction_id' INTEGER NOT NULL ,
  'pathway_id' INTEGER NOT NULL  );
