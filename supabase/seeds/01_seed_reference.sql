/*
==============================================================================
ContinGest
Seed officiel de développement V1
------------------------------------------------------------------------------
Fichier : 01_seed_reference.sql
------------------------------------------------------------------------------
Contenu :

1. Catégories
2. Grades
3. Rôles
4. Projections

Ce script peut être rejoué plusieurs fois.
==============================================================================*/

BEGIN;

-- ============================================================================
-- NETTOYAGE
-- ============================================================================

TRUNCATE TABLE public.ctg_projection RESTART IDENTITY CASCADE;
TRUNCATE TABLE public.ctg_role RESTART IDENTITY CASCADE;
TRUNCATE TABLE public.ctg_grade RESTART IDENTITY CASCADE;
TRUNCATE TABLE public.ctg_category RESTART IDENTITY CASCADE;

-- ============================================================================
-- CATEGORIES
-- ============================================================================

INSERT INTO public.ctg_category
(
    ct_code,
    ct_name,
    ct_description
)
VALUES

('OFF','Officier','Personnel officier'),

('SOF','Sous-officier','Personnel sous-officier'),

('MDR','Militaire du rang','Personnel militaire du rang');

-- ============================================================================
-- GRADES
-- ============================================================================

INSERT INTO public.ctg_grade
(
    ct_id,
    gr_group,
    gr_code,
    gr_name,
    gr_order
)

SELECT
    ct_id,
    'OFF',
    'GEN',
    'Général',
    10
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','COL','Colonel',20
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','LCL','Lieutenant-colonel',30
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','CDT','Commandant',40
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','CPT','Capitaine',50
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','LTN','Lieutenant',60
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'OFF','SLT','Sous-lieutenant',70
FROM public.ctg_category
WHERE ct_code='OFF'

UNION ALL

SELECT ct_id,'SOF','ADC','Adjudant-chef',10
FROM public.ctg_category
WHERE ct_code='SOF'

UNION ALL

SELECT ct_id,'SOF','ADJ','Adjudant',20
FROM public.ctg_category
WHERE ct_code='SOF'

UNION ALL

SELECT ct_id,'SOF','SCH','Sergent-chef',30
FROM public.ctg_category
WHERE ct_code='SOF'

UNION ALL

SELECT ct_id,'SOF','SGT','Sergent',40
FROM public.ctg_category
WHERE ct_code='SOF'

UNION ALL

SELECT ct_id,'MDR','CCH','Caporal-chef',10
FROM public.ctg_category
WHERE ct_code='MDR'

UNION ALL

SELECT ct_id,'MDR','CPL','Caporal',20
FROM public.ctg_category
WHERE ct_code='MDR'

UNION ALL

SELECT ct_id,'MDR','SPC','Soldat de première classe',30
FROM public.ctg_category
WHERE ct_code='MDR'

UNION ALL

SELECT ct_id,'MDR','SD2','Soldat de deuxième classe',40
FROM public.ctg_category
WHERE ct_code='MDR';

-- ============================================================================
-- ROLES
-- ============================================================================

INSERT INTO public.ctg_role
(
    rl_code,
    rl_name,
    rl_type,
    rl_description,
    rl_is_system,
    rl_order
)
VALUES

('ADMIN','Administrateur','SYSTEM',
'Administrateur technique',
true,
10),

('PRESIDENT','Président','BUSINESS',
'Président du contingent',
false,
20),

('VICE_PRESIDENT','Vice-président','BUSINESS',
'Vice-président',
false,
30),

('SECRETAIRE','Secrétaire','BUSINESS',
'Secrétaire',
false,
40),

('TRESORIER','Trésorier','BUSINESS',
'Trésorier',
false,
50),

('COORDINATEUR','Coordinateur','BUSINESS',
'Coordinateur de projection',
false,
60),

('MEMBRE','Membre','BUSINESS',
'Membre ordinaire',
false,
70);

-- ============================================================================
-- PROJECTIONS
-- ============================================================================

INSERT INTO public.ctg_projection
(
    pr_code,
    pr_name,
    pr_description,
    pr_theme_color
)
VALUES

(
'ALPHA',
'Projection Alpha',
'Projection de démonstration',
'#0d6efd'
),

(
'BRAVO',
'Projection Bravo',
'Projection de démonstration',
'#198754'
);

COMMIT;

-- ============================================================================
-- VALIDATION
-- ============================================================================

SELECT
'Categories' AS objet,
COUNT(*) AS total
FROM public.ctg_category

UNION ALL

SELECT
'Grades',
COUNT(*)
FROM public.ctg_grade

UNION ALL

SELECT
'Roles',
COUNT(*)
FROM public.ctg_role

UNION ALL

SELECT
'Projections',
COUNT(*)
FROM public.ctg_projection;