/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
04_events.sql
------------------------------------------------------------------------------
Création des évènements de démonstration
==============================================================================
*/

INSERT INTO public.ctg_event (

    evt_code,
    evt_title,
    evt_description,

    evt_scope,
    pr_id,

    evt_type,
    evt_status,

    evt_start_at,
    evt_end_at,

    evt_metadata

)

SELECT

    x.evt_code,
    x.evt_title,
    x.evt_description,

    x.evt_scope,
    p.pr_id,

    x.evt_type,
    x.evt_status,

    x.evt_start_at,
    x.evt_end_at,

    '{}'::jsonb

FROM (

VALUES

-- =====================================================
-- EVENEMENTS GLOBAUX
-- =====================================================

(
'EVT001',
'Cotisation Anniversaire 2026',
'Cotisation officielle du premier anniversaire.',
'GLOBAL',
NULL,
'GENERAL',
'PUBLISHED',
TIMESTAMPTZ '2026-08-01 08:00:00+00',
TIMESTAMPTZ '2026-08-31 23:59:59+00'
),

(
'EVT002',
'Mariage d''un membre',
'Contribution exceptionnelle pour mariage.',
'GLOBAL',
NULL,
'PARTICULAR',
'PUBLISHED',
TIMESTAMPTZ '2026-09-10 08:00:00+00',
TIMESTAMPTZ '2026-09-20 23:59:59+00'
),

(
'EVT003',
'Naissance d''un enfant',
'Soutien à un membre.',
'GLOBAL',
NULL,
'PARTICULAR',
'DRAFT',
TIMESTAMPTZ '2026-10-01 08:00:00+00',
TIMESTAMPTZ '2026-10-15 23:59:59+00'
),

-- =====================================================
-- PROJECTION ALPHA
-- =====================================================

(
'EVT004',
'Réunion Projection Alpha',
'Réunion mensuelle de coordination.',
'PROJECTION',
'ALPHA',
'GENERAL',
'ONGOING',
TIMESTAMPTZ '2026-07-15 18:00:00+00',
TIMESTAMPTZ '2026-07-15 21:00:00+00'
),

-- =====================================================
-- PROJECTION BRAVO
-- =====================================================

(
'EVT005',
'Journée Cohésion Bravo',
'Activité interne de cohésion.',
'PROJECTION',
'BRAVO',
'GENERAL',
'COMPLETED',
TIMESTAMPTZ '2026-06-20 08:00:00+00',
TIMESTAMPTZ '2026-06-20 18:00:00+00'
)

)

AS x(

evt_code,
evt_title,
evt_description,

evt_scope,
projection_code,

evt_type,
evt_status,

evt_start_at,
evt_end_at

)

LEFT JOIN public.ctg_projection p

ON p.pr_code=x.projection_code

WHERE NOT EXISTS (

    SELECT 1

    FROM public.ctg_event e

    WHERE e.evt_code=x.evt_code

);