/*
==============================================================================
 ContinGest
 Phase 2A — Audit générique
==============================================================================

Fonction :
    public.ctg_audit_trigger()

Le trigger enregistre automatiquement les opérations :

    INSERT
    UPDATE
    DELETE

dans la table :

    public.ctg_audit_log

==============================================================================*/

DROP TRIGGER IF EXISTS trg_audit_member ON public.ctg_member;
CREATE TRIGGER trg_audit_member
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_member
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('mb_id');


DROP TRIGGER IF EXISTS trg_audit_assignment ON public.ctg_assignment;
CREATE TRIGGER trg_audit_assignment
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_assignment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('asg_id');


DROP TRIGGER IF EXISTS trg_audit_attachment ON public.ctg_attachment;
CREATE TRIGGER trg_audit_attachment
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_attachment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('at_id');


DROP TRIGGER IF EXISTS trg_audit_contribution ON public.ctg_contribution;
CREATE TRIGGER trg_audit_contribution
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_contribution
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('cr_id');


DROP TRIGGER IF EXISTS trg_audit_event ON public.ctg_event;
CREATE TRIGGER trg_audit_event
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_event
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('evt_id');


DROP TRIGGER IF EXISTS trg_audit_notification ON public.ctg_notification;
CREATE TRIGGER trg_audit_notification
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_notification
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('nt_id');


DROP TRIGGER IF EXISTS trg_audit_payment ON public.ctg_payment;
CREATE TRIGGER trg_audit_payment
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_payment
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('py_id');


DROP TRIGGER IF EXISTS trg_audit_proposal ON public.ctg_proposal;
CREATE TRIGGER trg_audit_proposal
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_proposal
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('pp_id');


DROP TRIGGER IF EXISTS trg_audit_score ON public.ctg_score;
CREATE TRIGGER trg_audit_score
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_score
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('sc_id');


DROP TRIGGER IF EXISTS trg_audit_setting ON public.ctg_setting;
CREATE TRIGGER trg_audit_setting
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_setting
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('st_id');


DROP TRIGGER IF EXISTS trg_audit_transaction ON public.ctg_transaction;
CREATE TRIGGER trg_audit_transaction
AFTER INSERT OR UPDATE OR DELETE
ON public.ctg_transaction
FOR EACH ROW
EXECUTE FUNCTION public.ctg_audit_trigger('tr_id');