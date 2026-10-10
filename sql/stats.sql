-- Coût estimé par agent (tarif claude-opus-5 : 5 $ / M tokens en entrée, 25 $ / M en sortie).
SELECT agent,
       COUNT(*)                                                        AS reviews,
       ROUND(AVG(prompt_tokens))                                       AS tokens_entree_moy,
       ROUND(AVG(completion_tokens))                                   AS tokens_sortie_moy,
       ROUND(SUM(prompt_tokens * 5 + completion_tokens * 25) / 1e6, 4) AS cout_total_usd
FROM pr_reviews
GROUP BY agent
ORDER BY cout_total_usd DESC;

-- Coût total par PR.
SELECT repo, pr_number,
       ROUND(SUM(prompt_tokens * 5 + completion_tokens * 25) / 1e6, 4) AS cout_usd
FROM pr_reviews
GROUP BY repo, pr_number;
