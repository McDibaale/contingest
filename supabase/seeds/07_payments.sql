/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
07_payments.sql
------------------------------------------------------------------------------
Simulation de paiements
==============================================================================
*/

INSERT INTO public.ctg_payment (

    mb_id,
    cr_id,

    py_amount,

    py_paid_at,

    py_reference,

    py_note,

    py_metadata

)

SELECT

    c.mb_id,

    c.cr_id,

    CASE

        WHEN MOD(c.cr_id,5)=0 THEN c.cr_expected_amount * 0.50
        ELSE c.cr_expected_amount

    END,

    now() - (MOD(c.cr_id,30) || ' days')::interval,

    'PAY-' || LPAD(c.cr_id::text,6,'0'),

    CASE

        WHEN MOD(c.cr_id,5)=0
            THEN 'Paiement partiel'

        ELSE
            'Paiement complet'

    END,

    '{}'::jsonb

FROM public.ctg_contribution c

WHERE

    MOD(c.cr_id,10) <> 9

AND NOT EXISTS (

    SELECT 1

    FROM public.ctg_payment p

    WHERE p.cr_id=c.cr_id

);