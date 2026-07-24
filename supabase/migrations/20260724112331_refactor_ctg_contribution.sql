/*
==============================================================================
ContinGest
Phase 2B.6
------------------------------------------------------------------------------
Refonte de la table ctg_contribution
------------------------------------------------------------------------------
Objectif :
- une contribution appartient à UN membre
- une contribution provient d'UNE modalité
- une contribution peut recevoir plusieurs paiements
==============================================================================
*/

BEGIN;

------------------------------------------------------------
-- Suppression des anciennes contraintes
------------------------------------------------------------

ALTER TABLE public.ctg_contribution
DROP CONSTRAINT IF EXISTS ctg_contribution_unique;

ALTER TABLE public.ctg_contribution
DROP CONSTRAINT IF EXISTS ctg_contribution_category_fkey;

ALTER TABLE public.ctg_contribution
DROP CONSTRAINT IF EXISTS ctg_contribution_event_fkey;

------------------------------------------------------------
-- Suppression des anciennes colonnes
------------------------------------------------------------

ALTER TABLE public.ctg_contribution
DROP COLUMN IF EXISTS evt_id;

ALTER TABLE public.ctg_contribution
DROP COLUMN IF EXISTS ct_id;

------------------------------------------------------------
-- Nouvelles colonnes
------------------------------------------------------------

ALTER TABLE public.ctg_contribution

ADD COLUMN mb_id bigint,

ADD COLUMN md_id bigint,

ADD COLUMN cr_paid_amount numeric(12,2)
NOT NULL DEFAULT 0,

ADD COLUMN cr_remaining_amount numeric(12,2)
NOT NULL DEFAULT 0,

ADD COLUMN cr_status varchar(20)
NOT NULL DEFAULT 'PENDING';

------------------------------------------------------------
-- Contraintes FK
------------------------------------------------------------

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_member_fkey

FOREIGN KEY (mb_id)

REFERENCES public.ctg_member(mb_id)

ON DELETE CASCADE;

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_modality_fkey

FOREIGN KEY (md_id)

REFERENCES public.ctg_event_modality(md_id)

ON DELETE CASCADE;

------------------------------------------------------------
-- Contrainte métier
------------------------------------------------------------

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_unique

UNIQUE (

mb_id,

md_id

);

------------------------------------------------------------
-- Vérification des montants
------------------------------------------------------------

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_paid_check

CHECK (

cr_paid_amount >= 0

);

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_remaining_check

CHECK (

cr_remaining_amount >= 0

);

------------------------------------------------------------
-- Statuts
------------------------------------------------------------

ALTER TABLE public.ctg_contribution

ADD CONSTRAINT ctg_contribution_status_check

CHECK (

cr_status IN (

'PENDING',
'PARTIAL',
'PAID',
'CANCELLED'

)

);

------------------------------------------------------------
-- Index
------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_contribution_member

ON public.ctg_contribution(mb_id);

CREATE INDEX IF NOT EXISTS idx_contribution_modality

ON public.ctg_contribution(md_id);

COMMIT;