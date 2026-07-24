/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
08_scores.sql
------------------------------------------------------------------------------
Calcul automatique des scores des membres
------------------------------------------------------------------------------
Les scores sont calculés à partir des contributions et des paiements.
==============================================================================
*/

INSERT INTO public.ctg_score (

    mb_id,

    pr_id,

    sc_global_score,

    sc_projection_score,

    sc_total_expected,

    sc_total_paid,

    sc_last_calculated_at,

    sc_metadata

)

WITH

/* ==========================================================
   Totaux individuels
========================================================== */

member_totals AS (

    SELECT

        m.mb_id,

        m.pr_id,

        COALESCE(SUM(c.cr_expected_amount),0) AS expected,

        COALESCE(SUM(c.cr_paid_amount),0) AS paid

    FROM public.ctg_member m

    LEFT JOIN public.ctg_contribution c

           ON c.mb_id = m.mb_id

    GROUP BY

        m.mb_id,

        m.pr_id

),

/* ==========================================================
   Scores par projection
========================================================== */

projection_scores AS (

    SELECT

        pr_id,

        CASE

            WHEN SUM(expected)=0 THEN 0

            ELSE ROUND(

                SUM(paid)*100.0 / SUM(expected),

                2

            )

        END AS projection_score

    FROM member_totals

    GROUP BY pr_id

),

/* ==========================================================
   Score global
========================================================== */

global_score AS (

    SELECT

        CASE

            WHEN SUM(expected)=0 THEN 0

            ELSE ROUND(

                SUM(paid)*100.0 / SUM(expected),

                2

            )

        END AS global_score

    FROM member_totals

)

/* ==========================================================
   Résultat final
========================================================== */

SELECT

    mt.mb_id,

    mt.pr_id,

    gs.global_score,

    ps.projection_score,

    mt.expected,

    mt.paid,

    now(),

    '{}'::jsonb

FROM member_totals mt

JOIN projection_scores ps

ON ps.pr_id = mt.pr_id

CROSS JOIN global_score gs

ON CONFLICT (mb_id)

DO UPDATE SET

    pr_id = EXCLUDED.pr_id,

    sc_global_score = EXCLUDED.sc_global_score,

    sc_projection_score = EXCLUDED.sc_projection_score,

    sc_total_expected = EXCLUDED.sc_total_expected,

    sc_total_paid = EXCLUDED.sc_total_paid,

    sc_last_calculated_at = now(),

    sc_metadata = EXCLUDED.sc_metadata;