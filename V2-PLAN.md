# V2 — Plan

## Suivi
Ce document dit **pourquoi** et **comment on sait que c'est réussi**.
Les issues (label `v2`) disent **quoi** et **où on en est**. Pas de statut ici.
Une piste est terminée quand son issue est fermée et son critère atteint.
Si le critère n'est pas atteint, l'issue se ferme avec une conclusion écrite.

## Ordre des pistes

**1. Fiabilité**
- Pourquoi : aujourd'hui, seules les reviews réussies sont journalisées, et le bot poste avec ton compte.
- Réussite : chaque échec est enregistré, les PR en brouillon ou marquées opt-out ne déclenchent plus de review, et le bot peut donner un vrai verdict.
- Issues : journalisation des échecs, filtre brouillon/opt-out, GitHub App ou compte bot. Vue d'ensemble : #3.

**2. Lot de test**
- Pourquoi : sans référence fixe, aucune modification ne peut être comparée.
- Réussite : 5 PR variées (petite, grosse, avec et sans tests), avec coût, temps et remarques utiles relevés sur la version actuelle.
- Issue : #2

**3. Qualité des revues**
- Pourquoi : les agents ne voient que le diff, ce qui limite la pertinence des remarques.
- Réussite : moins de faux positifs sur le lot, coût stable.
- Issues : description de la PR fournie aux agents, fichiers complets autour du diff, gravité sur chaque remarque (🔴 🟡 💡).

**4. Multi-modèles**
- Pourquoi : un modèle moins cher peut suffire pour certains agents, et DeepSeek est une option à comparer.
- Réussite : chaque agent a son modèle configurable, et chaque changement est mesuré agent par agent sur le lot.
- Issues : modèle configurable par agent, puis ajout de DeepSeek comme option. Vue d'ensemble : #1.

**5. Template**
- Pourquoi : rendre le reviewer réutilisable pour d'autres projets sans toucher au workflow.
- Réussite : un fichier `.pr-reviewer.yml` suffit à régler les agents et les modèles d'un repo.
- Issue : #4 (backlog V2, entrée « config par projet via `.pr-reviewer.yml` »)

**Plus tard** : analyse des tests Playwright. Ne jamais exécuter le code d'une PR non fiable : travailler à partir des rapports CI ou dans un environnement isolé sans secrets.

**Idée** : agent Mentor (commentaire pédagogique séparé, activable par projet ou par PR) : #5. À sortir en repo séparé si elle est lancée.

## Méthode
- Une piste = une worktree + une branche + une session `tmux`.
- `.claude/settings.json` : git en `allow`, `.env` et commandes destructrices en `deny`.
- Tâches qui modifient du code : mode plan (`Shift+Tab`) avant toute écriture.
- Slash commands dans `.claude/commands/` (ex. `/compare-agent <nom>`).
- Choisir les critères de réussite et fermer une issue restent des décisions humaines.
