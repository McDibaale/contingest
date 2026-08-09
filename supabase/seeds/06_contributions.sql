/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
06_contributions.sql
------------------------------------------------------------------------------
Génération automatique des contributions attendues
==============================================================================
*/

INSERT INTO public.ctg_contribution (

    mb_id,
    md_id,

    cr_expected_amount,
    cr_paid_amount,
    cr_remaining_amount,

    cr_status,

    cr_is_active,

    cr_metadata

)

SELECT

    m.mb_id,

    md.md_id,

    md.md_amount,

    0,

    md.md_amount,

    'PENDING',

    true,

    '{}'::jsonb

FROM public.ctg_member m

JOIN public.ctg_grade g

ON g.gr_id = m.gr_id

JOIN public.ctg_event_modality md

ON md.ct_id = g.ct_id

WHERE NOT EXISTS (

    SELECT 1

    FROM public.ctg_contribution c

    WHERE

            c.mb_id = m.mb_id

        AND c.md_id = md.md_id

);