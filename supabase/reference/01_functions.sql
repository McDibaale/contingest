/*
==============================================================================
 ContinGest
 Phase 2A — Infrastructure SQL
------------------------------------------------------------------------------
 Version  : 1.0
 Date     : 08/07/2026
 Branche  : feature/sql-phase-2

 DESCRIPTION

 Ce fichier contient l'ensemble de l'infrastructure SQL générique développée
 durant la Phase 2A.

 OBJECTIFS

 • gestion automatique des colonnes *_updated_at
 • audit automatique INSERT / UPDATE / DELETE
 • infrastructure indépendante des règles métier

 Ce fichier constitue la référence officielle de la Phase 2A.
==============================================================================*/


/******************************************************************************
 SECTION 1
 FONCTION GENERIQUE updated_at
******************************************************************************/

CREATE OR REPLACE FUNCTION public.ctg_set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
AS
$$
BEGIN

    NEW := jsonb_populate_record(
        NEW,
        jsonb_set(
            to_jsonb(NEW),
            ARRAY[TG_ARGV[0]],
            to_jsonb(now())
        )
    );

    RETURN NEW;

END;
$$;



/******************************************************************************
 SECTION 2
 TRIGGERS updated_at
******************************************************************************/

DROP TRIGGER IF EXISTS trg_updated_at_projection
ON public.ctg_projection;

CREATE TRIGGER trg_updated_at_projection
BEFORE UPDATE
ON public.ctg_projection
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('pr_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_member
ON public.ctg_member;

CREATE TRIGGER trg_updated_at_member
BEFORE UPDATE
ON public.ctg_member
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('mb_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_grade
ON public.ctg_grade;

CREATE TRIGGER trg_updated_at_grade
BEFORE UPDATE
ON public.ctg_grade
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('gr_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_category
ON public.ctg_category;

CREATE TRIGGER trg_updated_at_category
BEFORE UPDATE
ON public.ctg_category
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('ct_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_role
ON public.ctg_role;

CREATE TRIGGER trg_updated_at_role
BEFORE UPDATE
ON public.ctg_role
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('rl_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_assignment
ON public.ctg_assignment;

CREATE TRIGGER trg_updated_at_assignment
BEFORE UPDATE
ON public.ctg_assignment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('asg_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_event
ON public.ctg_event;

CREATE TRIGGER trg_updated_at_event
BEFORE UPDATE
ON public.ctg_event
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('evt_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_contribution
ON public.ctg_contribution;

CREATE TRIGGER trg_updated_at_contribution
BEFORE UPDATE
ON public.ctg_contribution
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('cr_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_payment
ON public.ctg_payment;

CREATE TRIGGER trg_updated_at_payment
BEFORE UPDATE
ON public.ctg_payment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('py_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_score
ON public.ctg_score;

CREATE TRIGGER trg_updated_at_score
BEFORE UPDATE
ON public.ctg_score
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('sc_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_proposal
ON public.ctg_proposal;

CREATE TRIGGER trg_updated_at_proposal
BEFORE UPDATE
ON public.ctg_proposal
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('pp_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_notification
ON public.ctg_notification;

CREATE TRIGGER trg_updated_at_notification
BEFORE UPDATE
ON public.ctg_notification
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('nt_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_transaction
ON public.ctg_transaction;

CREATE TRIGGER trg_updated_at_transaction
BEFORE UPDATE
ON public.ctg_transaction
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('tr_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_attachment
ON public.ctg_attachment;

CREATE TRIGGER trg_updated_at_attachment
BEFORE UPDATE
ON public.ctg_attachment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('at_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_setting
ON public.ctg_setting;

CREATE TRIGGER trg_updated_at_setting
BEFORE UPDATE
ON public.ctg_setting
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('st_updated_at');



DROP TRIGGER IF EXISTS trg_updated_at_feedback
ON public.ctg_event_feedback;

CREATE TRIGGER trg_updated_at_feedback
BEFORE UPDATE
ON public.ctg_event_feedback
FOR EACH ROW
EXECUTE FUNCTION public.ctg_set_updated_at('fb_updated_at');