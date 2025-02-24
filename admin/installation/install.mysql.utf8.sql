CREATE TABLE IF NOT EXISTS `#__flexicontent_cats_item_relations` (
  `catid` int(11) NOT NULL default '0',
  `itemid` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`catid`,`itemid`),
  KEY `catid` (`catid`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_favourites` (
  `id` int(11) NOT NULL auto_increment,
  `itemid` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `notify` int(11) NOT NULL default '0',
  `type` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY  (`id`,`itemid`,`userid`, `type`),
  KEY `id` (`id`),
  KEY `itemid` (`itemid`),
  KEY `userid` (`userid`),
  KEY `type` (`type`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_mediadatas` (
  `id` int(11) NOT NULL auto_increment,
  `file_id` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '1',
  `media_type` int(11) NOT NULL default 0, /* 0: audio , 1: video */
  `media_format` varchar(255) NULL, /* e.g 'video', 'wav', 'audio' */
  `codec_type` varchar(255) NULL, /* e.g 'audio' */
  `codec_name` varchar(255) NULL, /* e.g 'mp3', 'pcm_s24le' */
  `codec_long_name` varchar(255) NULL, /* e.g 'PCM signed 24-bit little-endian' , 'MP3 (MPEG audio layer 3)' */
  `resolution` varchar(255) NULL, /* e.g. 1280x720, 1920x1080 */
  `fps` double NULL, /* e.g. 50 (frames per second) */
  `bit_rate` int(11) NULL, /* e.g. 256000 , 320000 (bps) */
  `bits_per_sample` int(11) NULL, /* e.g. 16, 24, 32 (# bits) */
  `sample_rate` int(11) NULL, /* e.g. 44100 (HZ) */
  `duration` int(11) NOT NULL, /* e.g. 410 (seconds) */
  `channels` varchar(255) NULL, /* e.g. 1, 2, 4 (number of channels) */
  `channel_layout` varchar(255) NULL, /* e.g. 'stereo', 'mono' */
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `attribs` mediumtext NULL,
  PRIMARY KEY  (`id`),
  UNIQUE `file_id` (`file_id`),
  KEY `state` (`state`),
  KEY `media_type` (`media_type`),
  KEY `media_format` (`media_format`),
  KEY `resolution` (`resolution`),
  KEY `fps` (`fps`),
  KEY `bit_rate` (`bit_rate`),
  KEY `bits_per_sample` (`bits_per_sample`),
  KEY `sample_rate` (`sample_rate`),
  KEY `duration` (`duration`),
  KEY `channels` (`channels`),
  KEY `channel_layout` (`channel_layout`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;


CREATE TABLE IF NOT EXISTS `#__flexicontent_reviews` (
  `id` int(11) NOT NULL auto_increment,
  `content_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'item',
  `average_rating` int NOT NULL,
  `custom_ratings` text NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NULL,
  `title_old` varchar(255) NULL,
  `text` mediumtext NULL,
  `text_old` mediumtext NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `approved` tinyint(3) NOT NULL DEFAULT '0',
  `verified` tinyint(3) NOT NULL DEFAULT '0',
  `useful_yes` int(11) NOT NULL DEFAULT '0',
  `useful_no` int(11) NOT NULL DEFAULT '0',
  `submit_date` datetime NOT NULL,
  `update_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `attribs` mediumtext NULL,
  PRIMARY KEY  (`id`),
  KEY (`content_id`, `user_id`, `type`),
  KEY (`content_id`, `type`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `text` (`text`),
  KEY `state` (`state`),
  KEY `approved` (`approved`),
  KEY `verified` (`verified`),
  KEY `useful_yes` (`useful_yes`),
  KEY `useful_no` (`useful_no`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_fields` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `asset_id` int(11) unsigned NOT NULL default '0',
  `field_type` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `isfilter` tinyint(1) NOT NULL default '0',
  `isadvfilter` tinyint(1) NOT NULL default '0',
  `iscore` tinyint(1) NOT NULL default '0',
  `issearch` tinyint(1) NOT NULL default '1',
  `isadvsearch` tinyint(1) NOT NULL default '0',
  `untranslatable` tinyint(1) NOT NULL default '0',
  `formhidden` tinyint(1) NOT NULL default '0',
  `valueseditable` tinyint(1) NOT NULL default '0',
  `edithelp` tinyint(1) NOT NULL default '2',
  `positions` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `attribs` mediumtext NOT NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `access` int(11) unsigned NOT NULL default '1',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_fields_item_relations` (
  `field_id` int(11) NOT NULL default '0',
  `item_id` int(11) NOT NULL default '0',
  `valueorder` int(11) NOT NULL default '1',
  `suborder` int(11) NOT NULL default '1',
  `value` mediumtext NOT NULL,
  `value_integer` bigint(20) NULL,
  `value_decimal` decimal(65,15) NULL,
  `value_datetime` datetime NULL,
--  `reference_1` bigint(20) NULL,
  PRIMARY KEY  (`field_id`,`item_id`,`valueorder`,`suborder`),
  KEY `field_id` (`field_id`),
  KEY `item_id` (`item_id`),
  KEY `valueorder` (`valueorder`),
  KEY `value` (`value`(32)),
  KEY `value_integer` (`value_integer`),
  KEY `value_decimal` (`value_decimal`),
  KEY `value_datetime` (`value_datetime`)
--  KEY `reference_1` (`value_integer`),
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_fields_type_relations` (
  `field_id` int(11) NOT NULL default '0',
  `type_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`field_id`,`type_id`),
  KEY `field_id` (`field_id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_files` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(255) NOT NULL,
  `filename_original` varchar(255) NOT NULL default '',
  `altname` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `url` tinyint(3) unsigned NOT NULL default '0',
  `estorage_fieldid` int(11) NOT NULL default '0',
  `secure` tinyint(3) unsigned NOT NULL default '1',
  `ext` varchar(10) NOT NULL,
  `published` tinyint(1) NOT NULL default '1',
  `language` char(7) NOT NULL DEFAULT '*',
  `hits` int(11) unsigned NOT NULL default '0',
  `size` int(11) unsigned NOT NULL default '0',
  `assignments` int(11) unsigned NOT NULL default '0',
  `stamp` tinyint(3) unsigned NOT NULL default '1',
  `uploaded` datetime NOT NULL default '1000-01-01 00:00:00',
  `uploaded_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `access` int(11) unsigned NOT NULL default '1',
  `attribs` mediumtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `estorage_fieldid` (`estorage_fieldid`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_items_ext` (
  `item_id` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `is_uptodate` tinyint(3) unsigned NOT NULL default '0',
  `language` varchar(7) NOT NULL default '*',
  `lang_parent_id` int(11) unsigned NOT NULL default 0,
  `sub_items` text NOT NULL,
  `sub_categories` text NOT NULL,
  `related_items` text NOT NULL,
  `search_index` mediumtext NOT NULL,
  PRIMARY KEY  (`item_id`),
  FULLTEXT KEY `search_index` (`search_index`),
  KEY `lang_parent_id` (`lang_parent_id`),
  KEY `type_id` (`type_id`),
  KEY `is_uptodate` (`is_uptodate`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_items_tmp` (
 `id` int(10) unsigned NOT NULL,
 `title` varchar(255) NOT NULL,
 `alias` VARCHAR(400) NOT NULL,
 `state` tinyint(3) NOT NULL DEFAULT '0',
 `catid` int(10) unsigned NOT NULL DEFAULT '0',
 `created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
 `created_by` int(10) unsigned NOT NULL DEFAULT '0',
 `modified` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
 `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
 `publish_up` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
 `publish_down` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
 `version` int(10) unsigned NOT NULL DEFAULT '1',
 `ordering` int(11) NOT NULL DEFAULT '0',
 `access` int(10) unsigned NOT NULL DEFAULT '0',
 `hits` int(10) unsigned NOT NULL DEFAULT '0',
 `featured` tinyint(3) unsigned NOT NULL DEFAULT '0',
 `language` varchar(7) NOT NULL DEFAULT '*',
 `type_id` int(11) NOT NULL DEFAULT '0',
 `lang_parent_id` int(11) NOT NULL DEFAULT '0',
 PRIMARY KEY (`id`),
 FULLTEXT KEY `title` (`title`),
 KEY `alias` (`alias`(64)),
 KEY `state` (`state`),
 KEY `catid` (`catid`),
 KEY `created_by` (`created_by`),
 KEY `access` (`access`),
 KEY `language` (`language`),
 KEY `featured` (`featured`),
 KEY `type_id` (`type_id`),
 KEY `lang_parent_id` (`lang_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__flexicontent_items_extravote` (
  `content_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `lastip` varchar(50) NOT NULL,
  `rating_sum` int(11) NOT NULL,
  `rating_count` int(11) NOT NULL,
  PRIMARY KEY  (`content_id`, `field_id`),
  KEY `extravote_idx` (`content_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_items_versions` (
  `version` int(11) NOT NULL default '0',
  `field_id` int(11) NOT NULL default '0',
  `item_id` int(11) NOT NULL default '0',
  `valueorder` int(11) NOT NULL default '1',
  `suborder` int(11) NOT NULL default '1',
  `value` mediumtext NOT NULL,
  PRIMARY KEY  (`version`,`field_id`,`item_id`,`valueorder`,`suborder`),
  KEY `version` (`version`),
  KEY `field_id` (`field_id`),
  KEY `item_id` (`item_id`),
  FULLTEXT KEY `value` (`value`),
  KEY `valueorder` (`valueorder`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `jtag_id` int(10) unsigned NULL,
  KEY `name` (`name`),
  KEY `alias` (`alias`),
  KEY `published` (`published`),
  KEY `jtag_id` (`jtag_id`),
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_tags_item_relations` (
  `tid` int(11) NOT NULL default '0',
  `itemid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`tid`,`itemid`),
  KEY `tid` (`tid`),
  KEY `itemid` (`itemid`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_types` (
  `id` int(11) NOT NULL auto_increment,
  `asset_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `itemscreatable` SMALLINT(8) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '1000-01-01 00:00:00',
  `access` int(11) unsigned NOT NULL default '1',
  `attribs` mediumtext NOT NULL,
  KEY `name` (`name`),
  KEY `alias` (`alias`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_versions` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `item_id` int(11) unsigned NOT NULL default '0',
  `version_id` int(11) unsigned NOT NULL default '0',
  `comment` mediumtext NOT NULL,
  `created` datetime NOT NULL default '1000-01-01 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `state` int(3) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `version2item` (`item_id`,`version_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_templates` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `template` varchar(50) NOT NULL default '',
  `cfgname` varchar(50) NOT NULL default '',
  `layout` varchar(20) NOT NULL default '',
  `position` varchar(100) NOT NULL default '',
  `fields` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `configuration` (`template`,`cfgname`,`layout`,`position`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_layouts_conf` (
  `template` varchar(50) NOT NULL default '',
  `cfgname` varchar(50) NOT NULL default '',
  `layout` varchar(20) NOT NULL default '',
  `attribs` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY  (`template`,`cfgname`,`layout`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_advsearch_index` (
  `sid` int(11) NOT NULL auto_increment,
  `field_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `extraid` int(11) NOT NULL,
  `search_index` longtext NOT NULL,
  `value_id` varchar(255) NULL,
  PRIMARY KEY (`field_id`,`item_id`,`extraid`),
  KEY `sid` (`sid`),
  KEY `field_id` (`field_id`),
  KEY `item_id` (`item_id`),
  FULLTEXT `search_index` (`search_index`),
  KEY `value_id` (`value_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_authors_ext` (
  `user_id` int(11) unsigned NOT NULL,
  `author_basicparams` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_catparams` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_download_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `last_hit_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `#__flexicontent_download_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `hits` int(11) NOT NULL,
  `hits_limit` int(11) NOT NULL,
  `expire_on` datetime NOT NULL default '1000-01-01 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`),
  KEY `token` (`token`),
  KEY `expire_on` (`expire_on`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`;

CREATE TABLE IF NOT EXISTS `jos_flexicontent_file_usage` (
	`id` int(11) NOT NULL,
	`context` varchar(255) NOT NULL,
	`file_id` int(11) NOT NULL default '0',
	`prop` varchar(255) NOT NULL,
	KEY  `id` (`id`),
	KEY  `file_id` (`file_id`),
	KEY  `context` (`context`),
	KEY  `prop` (`prop`)
) ENGINE=MyISAM CHARACTER SET `utf8` COLLATE `utf8_general_ci`