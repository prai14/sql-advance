SELECT DISTINCT 
print_product_type,
CASE 
            WHEN print_product_type = 16 and  print_product_size in (5224, 5225, 5228, 5229, 5232, 5233, 5226, 5227, 5230, 5231, 5234, 5235, 5236, 5237, 577, 576, 579, 578, 581, 580, 583, 582, 600, 599, 602, 601, 604, 603, 606, 605, 621, 620, 623, 622, 625, 624, 627, 626, 641, 640, 643, 642, 645, 644, 672, 671, 674, 673, 676, 675, 678, 677, 701, 700, 703, 702, 705, 704, 707, 706) THEN print_product_size
            WHEN print_product_type = 26 and  print_product_size  in (456, 458) THEN print_product_size
            WHEN print_product_type in (37) AND print_product_size  in (303, 374, 313, 514) THEN print_product_size
            WHEN print_product_type in (37) AND print_product_alternative_size  in (302) THEN print_product_alternative_size
            WHEN print_product_type in (39) AND print_product_size  in (5269) THEN print_product_size
            ELSE NULL
        END as size_id, 
CASE 
            WHEN print_product_type = 26 and  print_product_size not in (456, 458) THEN 0
            WHEN print_product_type = 16 and  print_product_size in (5224, 5225, 5228, 5229, 5232, 5233, 5226, 5227, 5230, 5231, 5234, 5235, 5236, 5237, 577, 576, 579, 578, 581, 580, 583, 582, 600, 599, 602, 601, 604, 603, 606, 605, 621, 620, 623, 622, 625, 624, 627, 626, 641, 640, 643, 642, 645, 644, 672, 671, 674, 673, 676, 675, 678, 677, 701, 700, 703, 702, 705, 704, 707, 706) THEN 0
			WHEN print_product_type in (14, 33, 40, 1002, 2000, 2001, 2002, 2003, 2004, 2005) THEN 0
			WHEN print_product_type in (31) THEN 2
			WHEN print_product_type in (6) THEN 8
            ELSE 10
        END as designer_supported,
CASE 
            WHEN print_product_type = 16 and  print_product_size in (5224, 5225, 5228, 5229, 5232, 5233, 5226, 5227, 5230, 5231, 5234, 5235, 5236, 5237, 577, 576, 579, 578, 581, 580, 583, 582, 600, 599, 602, 601, 604, 603, 606, 605, 621, 620, 623, 622, 625, 624, 627, 626, 641, 640, 643, 642, 645, 644, 672, 671, 674, 673, 676, 675, 678, 677, 701, 700, 703, 702, 705, 704, 707, 706) THEN 0
            WHEN print_product_type = 26 and  print_product_size not in (456, 458) THEN 0
			WHEN print_product_type in (14, 33, 40, 1002, 2000, 2001, 2002, 2003, 2004, 2005) THEN 0
            ELSE 2
END as proof_supported,
CASE 
			WHEN print_product_type in (37) AND print_product_size not in (302, 303, 313, 174, 514) THEN 1
			WHEN print_product_type in (39) AND print_product_size not in (5269) THEN 1
			WHEN print_product_type in (9, 15, 29, 35, 36, 41) THEN 1
            ELSE 0
END as render_mask,
CASE 
			WHEN print_product_type in (37) AND print_product_size not in (302, 303, 313, 174, 514) THEN 1
			WHEN print_product_type in (39) AND print_product_size not in (5269) THEN 1
			WHEN print_product_type in (9, 15, 22, 26, 29, 30, 35, 36, 41) THEN 1
            ELSE 0
END as render_overlay,
0 as output_format, 
0 as allow_multipage_output, 
0 trim_round_corner_radius, 
0 safe_round_corner_radius 
FROM PRINTER.product where print_product_type < 10000
order by print_product_type;
