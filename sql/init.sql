-- Phase 6 du PR Reviewer : une ligne par agent (3 lignes par review).
CREATE TABLE pr_reviews (
    id                SERIAL PRIMARY KEY,
    repo              TEXT        NOT NULL,
    pr_number         INTEGER     NOT NULL,
    agent             TEXT        NOT NULL,  -- 'Qualité' | 'Sécurité' | 'Tests'
    resultat          TEXT,
    prompt_tokens     INTEGER,
    completion_tokens INTEGER,
    created_at        TIMESTAMPTZ NOT NULL DEFAULT now()
);
