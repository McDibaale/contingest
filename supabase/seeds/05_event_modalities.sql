/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
05_event_modalities.sql
------------------------------------------------------------------------------
Création des modalités de cotisation des évènements
==============================================================================
*/

INSERT INTO public.ctg_event_modality (

    evt_id,
    ct_id,

    md_amount,

    md_is_required,

    md_description,

    md_metadata

)

SELECT

    e.evt_id,
    c.ct_id,

    x.amount,

    true,

    x.description,

    '{}'::jsonb

FROM (

VALUES

-- =====================================================
-- EVT001
-- Premier anniversaire
-- =====================================================

('EVT001','OFF',20000,'Cotisation Officiers'),
('EVT001','SOF',10000,'Cotisation Sous-officiers'),
('EVT001','MDR', 5000,'Cotisation Militaires du rang'),

-- =====================================================
-- EVT002
-- Mariage
-- =====================================================

('EVT002','OFF',15000,'Cotisation Officiers'),
('EVT002','SOF',10000,'Cotisation Sous-officiers'),
('EVT002','MDR', 5000,'Cotisation Militaires du rang'),

-- =====================================================
-- EVT003
-- Naissance
-- =====================================================

('EVT003','OFF',10000,'Cotisation Officiers'),
('EVT003','SOF', 5000,'Cotisation Sous-officiers'),
('EVT003','MDR', 2500,'Cotisation Militaires du rang'),

-- =====================================================
-- EVT004
-- Réunion Alpha
-- =====================================================

('EVT004','OFF',5000,'Participation Officiers'),
('EVT004','SOF',3000,'Participation Sous-officiers'),
('EVT004','MDR',2000,'Participation Militaires du rang'),

-- =====================================================
-- EVT005
-- Cohésion Bravo
-- =====================================================

('EVT005','OFF',5000,'Participation Officiers'),
('EVT005','SOF',3000,'Participation Sous-officiers'),
('EVT005','MDR',2000,'Participation Militaires du rang')

)

AS x(

    event_code,
    category_code,

    amount,

    description

)

JOIN public.ctg_event e

ON
    e.evt_code=x.event_code

JOIN public.ctg_category c

ON
    c.ct_code=x.category_code

WHERE NOT EXISTS (

    SELECT 1

    FROM public.ctg_event_modality m

    WHERE
            m.evt_id=e.evt_id
        AND m.ct_id=c.ct_id

);