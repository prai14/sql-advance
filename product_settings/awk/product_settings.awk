#!/bin/awk -f
BEGIN {}
{

printf("INSERT INTO `product_settings` (`id`,`uuid_least_sig_bits`,`uuid_most_sig_bits`,`version`,`create_time`,`modified_time`,`product_type`,`product_size`,`designer_supported`,`proof_supported`,`render_mask`,`render_overlay`,`output_format`,`allow_multipage_output`, `trim_round_corner_radius`,`safe_round_corner_radius`, `creator_id`,`modifier_id`) VALUES (getNextValHibSeq('product_settings'),UUID_SHORT(),UUID_SHORT(),0,NOW(),NULL, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s , 1, null);\n\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10);

}
END {}
