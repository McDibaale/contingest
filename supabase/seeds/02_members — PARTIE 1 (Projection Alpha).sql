/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
02_members.sql
------------------------------------------------------------------------------
Création des membres de démonstration
Projection Alpha
==============================================================================
*/

INSERT INTO public.ctg_member (

    pr_id,
    gr_id,

    mb_type,

    mb_last_name,
    mb_first_name,

    mb_phone,
    mb_email,

    mb_status,
    mb_is_active,

    mb_is_validated,
    mb_validated_at,

    mb_metadata

)

SELECT

    p.pr_id,
    g.gr_id,

    'REGULAR',

    x.last_name,
    x.first_name,

    x.phone,

    NULL,

    'ACTIVE',

    true,

    true,
    now(),

    '{}'::jsonb

FROM (

VALUES

-- =====================================================
-- OFFICIERS
-- =====================================================

('MBOLO','Alain','070000001','COL'),
('ONDO','Serge','070000002','LCL'),
('NZE','Patrick','070000003','CDT'),
('MENGUE','Hervé','070000004','CPT'),
('OYONO','Didier','070000005','LTN'),

-- =====================================================
-- SOUS-OFFICIERS
-- =====================================================

('MINKO','Arnaud','070000006','ADC'),
('ABAGA','Lionel','070000007','ADJ'),
('OBIANG','Roger','070000008','SCH'),
('AKA','Brice','070000009','SGT'),
('MBA','Fabrice','070000010','SGT'),

-- =====================================================
-- MILITAIRES DU RANG
-- =====================================================

('EKOMIE','Junior','070000011','CCH'),
('MISSAMBO','Steve','070000012','CPL'),
('BENGO','Kevin','070000013','CPL'),
('MVE','Bryan','070000014','SD2'),
('NGUEMA','Chris','070000015','SD2')

)

AS x(
    last_name,
    first_name,
    phone,
    grade_code
)

JOIN public.ctg_projection p
ON p.pr_code='ALPHA'

JOIN public.ctg_grade g
ON g.gr_code=x.grade_code

WHERE NOT EXISTS (

    SELECT 1

    FROM public.ctg_member m

    WHERE
        m.mb_last_name=x.last_name
    AND m.mb_first_name=x.first_name

);