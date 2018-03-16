SELECT DISTINCT 
prod.print_product_type,
CASE 
    WHEN ( ps.designer_supported = 4 OR ps.designer_supported = 2)
			and ps.iop_supported = 1 
            and ps.output_format = 0 
            and ps.allow_multipage_output = 0
            and ps.trim_round_corner_radius = 0
            and ps.safe_round_corner_radius = 0
	        and (prod.print_product_shape is null or prod.print_product_shape in (15,4,5,9)
            ) THEN NULL
	else ps.size_id
    END as size_id, 
ps.designer_supported, 
CASE 
    WHEN ps.iop_supported = 0 THEN 0
	ELSE 2
    END as proof_supported,
CASE 
    WHEN prod.print_product_type in (10005, 10006, 10008, 10009, 10010, 10011, 10012) THEN 0
    WHEN prod.print_product_shape  not in (15,4,5,9) THEN 1
	ELSE 0
    END as render_mask,
CASE 
	WHEN prod.print_product_shape  not in (15,4,5,9) THEN 1
	ELSE 0
    END as render_overlay,
ps.output_format,
CASE 
    WHEN ps.allow_multipage_output = 0 THEN 0
	ELSE 1
    END as allow_multipage_output,
 
ps.trim_round_corner_radius, 
ps.safe_round_corner_radius 
FROM PRINTER.product_size ps
INNER JOIN product_specification prspec
on ( ps.size_id=prspec.size_id OR ps.size_id=prspec.alternative_size_id)
INNER JOIN product prod
ON prod.product_specification_id = prspec.id
where prod.product_group_id in (1, 3, 4)
and prod.print_product_type > 10000
order by print_product_type;
