DELETE FROM `PRINTER`.`product_settings`;

DELETE FROM `PRINTER`.`hibernate_sequences` WHERE `sequence_name`='application_setting';
INSERT INTO `PRINTER`.`hibernate_sequences` (`sequence_name`, `next_val`) VALUES ('product_settings', '1');


