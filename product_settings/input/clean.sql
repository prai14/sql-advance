
DROP TABLE IF EXISTS `PRINTER`.`product_settings`;

DELETE FROM `PRINTER`.`hibernate_sequences` WHERE `sequence_name`='product_settings';
INSERT INTO `PRINTER`.`hibernate_sequences` (`sequence_name`, `next_val`) VALUES ('product_settings', '1');


CREATE TABLE `product_settings` (
  `id` int(11) NOT NULL,
  `uuid_least_sig_bits` bigint(20) DEFAULT NULL,
  `uuid_most_sig_bits` bigint(20) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `product_type` smallint(6) NOT NULL,
  `product_size` int(11) DEFAULT NULL,
  `designer_supported` int(11) DEFAULT '0',
  `proof_supported` int(11) DEFAULT '0',
  `render_overlay` bit(1) NOT NULL DEFAULT b'0',
  `render_mask` bit(1) NOT NULL DEFAULT b'0',
  `output_format` tinyint(4) NOT NULL DEFAULT '0',
  `allow_multipage_output` bit(1) DEFAULT b'0',
  `trim_round_corner_radius` float DEFAULT '0',
  `safe_round_corner_radius` float DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type_size` (`product_type`,`product_size`),
  KEY `fk__product_settings_creator_id__to__user__id` (`creator_id`),
  KEY `fk__product_settings_modifier_id__to__user__id` (`modifier_id`),
  CONSTRAINT `fk__product_settings_creator_id__to__user__id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk__product_settings_modifier_id__to__user__id` FOREIGN KEY (`modifier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





