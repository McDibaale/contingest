/*
==============================================================================
ContinGest
Seed Officiel de Développement
------------------------------------------------------------------------------
03_member_roles.sql
------------------------------------------------------------------------------
Affectation des rôles métier
==============================================================================
*/

INSERT INTO public.ctg_member_role (

    mb_id,
    rl_id,

    mr_scope,
    pr_id,

    mr_start_at,

    mr_is_active,

    mr_metadata

)

SELECT

    m.mb_id,
    r.rl_id,

    x.scope,
    p.pr_id,

    now(),

    true,

    '{}'::jsonb

FROM (

VALUES

-- =====================================================
-- BUREAU GENERAL
-- =====================================================

('MBOLO','Alain','PRESIDENT','GLOBAL',NULL),
('ONDO','Serge','TRESORIER','GLOBAL',NULL),
('NZE','Patrick','SECRETAIRE','GLOBAL',NULL),

-- =====================================================
-- PROJECTION ALPHA
-- =====================================================

('MBOLO','Alain','COORDINATEUR','PROJECTION','ALPHA'),
('ONDO','Serge','TRESORIER','PROJECTION','ALPHA'),
('NZE','Patrick','SECRETAIRE','PROJECTION','ALPHA'),

-- =====================================================
-- PROJECTION BRAVO
-- =====================================================

('ETOUGHE','Fabrice','COORDINATEUR','PROJECTION','BRAVO'),
('OKOMO','Thierry','TRESORIER','PROJECTION','BRAVO'),
('NDONG','Aristide','SECRETAIRE','PROJECTION','BRAVO')

)

AS x(
    last_name,
    first_name,
    role_code,
    scope,
    projection_code
)

JOIN public.ctg_member m

ON
    m.mb_last_name=x.last_name
AND m.mb_first_name=x.first_name

JOIN public.ctg_role r

ON
    r.rl_code=x.role_code

LEFT JOIN public.ctg_projection p

ON
    p.pr_code=x.projection_code

WHERE NOT EXISTS (

    SELECT 1

    FROM public.ctg_member_role mr

    WHERE
            mr.mb_id=m.mb_id
        AND mr.rl_id=r.rl_id
        AND mr.mr_scope=x.scope
        AND COALESCE(mr.pr_id,0)=COALESCE(p.pr_id,0)
        AND mr.mr_is_active=true

);