---
layout: post
title: "La guerre des prompts"
date: 2026-03-31 11:16:41 +0200
categories: Posts
permalink: "/:categories/:title"
author: "Hind Ismaili Alaoui & Rose"
tags: [prompt-engineering]
---

Imaginez une Ferrari entre les mains de quelqu'un qui ne sait pas conduire. C'est exactement la situation dans laquelle nous nous trouvons avec l'IA en 2026. Les outils sont là, accessibles à tous, gratuits pour certains. Mais voilà le problème : sans savoir écrire un prompt, ces outils restent des coquilles vides.

Le prompt n'est plus une simple commande. C'est devenu un skill crucial, une compétence qui sépare ceux qui subissent l'IA de ceux qui la maîtrisent. Bienvenue dans la guerre des prompts.

## Qu'est-ce qu'un prompt ?

Un prompt, c'est cette instruction que vous donnez à une IA pour obtenir un résultat. Mais réduisez-le à ça, et vous passez à côté de l'essentiel. Un prompt bien conçu, c'est comme une partition de musique : chaque mot compte, chaque virgule influence le rythme de la réponse.

Prenons un exemple concret. Demandez à ChatGPT « écris un article sur l'IA » et vous obtiendrez un texte générique, plat, sans âme. Maintenant, essayez ceci :

« Tu es un journaliste spécialisé en technologie avec 10 ans d'expérience. Écris un article de 800 mots sur l'impact de l'IA générative dans les PME françaises. Utilise un ton dynamique, inclue 3 exemples concrets, et termine par une section "À retenir". »

La différence ? Elle est abyssale. Le second prompt donne un contexte, un rôle, des contraintes précises. Il guide l'IA au lieu de la laisser divaguer.

## Les catégories de prompts

Selon « The Prompt Report », une étude systématique publiée sur arXiv en 2024, il existe **58 techniques distinctes** de prompting pour les modèles de langage. Voici les principales catégories que vous devez connaître :

### 1. Les prompts directs

C'est la forme la plus basique : vous demandez, l'IA répond. « Quelle est la capitale de la France ? » → « Paris ». Simple, efficace, limité.

### 2. Le few-shot prompting

Vous donnez des exemples avant de poser votre question. Comme montrer trois traductions français-anglais avant de demander la quatrième. L'IA comprend le pattern et le reproduit. C'est puissant pour les tâches répétitives.

### 3. Le Chain-of-Thought (CoT)

Vous forcez l'IA à réfléchir étape par étape. Au lieu de demander directement « combien font 23 × 47 ? », vous ajoutez : « Explique ton raisonnement étape par étape ». Résultat : beaucoup moins d'erreurs, surtout sur les problèmes complexes.

### 4. Le role prompting

Vous attribuez un rôle à l'IA : « Tu es un expert en cybersécurité », « Tu es un professeur de physique quantique ». Ce simple changement de casquette modifie profondément le style et la précision des réponses.

### 5. Les prompts structurés

Vous imposez un format de sortie : tableau, liste à puces, JSON, markdown. Indispensable quand vous voulez intégrer les réponses dans d'autres outils.

## Que se passe-t-il si un prompt secret est découvert ?

C'est là que ça devient fascinant — et inquiétant. Certaines entreprises développent des « super-prompts », des instructions propriétaires qui donnent à leurs IA des capacités uniques. Ces prompts valent de l'or.

Mais que se passe-t-il quand ils fuitent ?

L'OWASP (Open Web Application Security Project) a identifié le **prompt injection** comme l'une des vulnérabilités les plus critiques des systèmes IA en 2025. Un attaquant peut insérer des instructions cachées dans un contenu que l'IA va lire, lui faisant ignorer ses consignes de sécurité.

Exemple réel : en 2024, un étudiant a réussi à faire révéler à Microsoft Copilot ses propres directives internes en utilisant une technique d'injection directe. Le chatbot Chevrolet Watsonville s'est fait manipuler pour recommander... Ford F-150 et proposer des prix impossibles.

Les conséquences vont au-delà de l'embarras :

- **Fuites de données sensibles** : un prompt malicieux peut extraire des informations confidentielles
- **Manipulation comportementale** : contourner les garde-fous éthiques
- **Exécution d'actions non autorisées** : dans les systèmes connectés, les risques sont opérationnels

La parade ? Isoler strictement les prompts système des entrées utilisateurs, implémenter des garde-fous multiples, et former les modèles à résister aux injections. Mais c'est une course aux armements : chaque défense trouve son attaque.

## Cas pratique : créer un assistant de recherche documentaire

Mettons cela en application. Vous voulez créer un assistant qui aide vos étudiants à synthétiser des articles scientifiques. Voici comment construire un prompt robuste :

```
Tu es un assistant de recherche académique spécialisé en sciences cognitives.

CONTEXTE :
L'utilisateur te fournit un article scientifique. Tu dois en extraire les éléments clés.

INSTRUCTIONS :
1. Identifie la problématique centrale en une phrase
2. Résume la méthodologie en 3 points maximum
3. Liste les 3 résultats principaux avec leurs chiffres clés
4. Mentionne 2 limites reconnues par les auteurs
5. Propose 3 pistes de recherche futures

FORMAT DE SORTIE :
Utilise exclusivement ce format Markdown :

## Problématique
[une phrase]

## Méthodologie
- Point 1
- Point 2
- Point 3

## Résultats principaux
1. [résultat + chiffre]
2. [résultat + chiffre]
3. [résultat + chiffre]

## Limites
- Limite 1
- Limite 2

## Pistes futures
1. Piste 1
2. Piste 2
3. Piste 3

RÈGLES :
- Ne jamais inventer de données
- Si une information manque, indique « Non spécifié »
- Reste factuel, n'ajoute pas d'interprétation personnelle
- Maximum 400 mots
```

Ce prompt fonctionne parce qu'il :
- Donne un **rôle précis** (assistant académique)
- Définit le **contexte** (articles scientifiques)
- Impose une **structure claire** (sections numérotées)
- Pose des **contraintes** (pas d'invention, limite de mots)
- Anticipe les **cas limites** (« Non spécifié »)

Testez-le avec différents articles. Ajustez les sections selon vos besoins. C'est ainsi qu'on construit des outils fiables.

## La maîtrise du prompt : nouvel alphabétisme

Nous vivons une transition historique. Comme l'écriture après l'invention de l'imprimerie, comme le code après l'arrivée des ordinateurs personnels, le prompt devient la nouvelle langue d'interaction avec la machine.

Ceux qui maîtrisent cet art auront un avantage considérable. Pas parce qu'ils ont accès à des outils exclusifs, mais parce qu'ils savent **exprimer leur pensée** de manière à ce que la machine la comprenne et l'amplifie.

La guerre des prompts n'est pas une bataille technologique. C'est une compétition cognitive. Et elle vient à peine de commencer.

**Sources :**
[The Prompt Report: A Systematic Survey of Prompting Techniques](https://arxiv.org/abs/2406.06608)
[Prompt Injection - OWASP Foundation](https://owasp.org/www-community/attacks/PromptInjection)
[Prompt Engineering Guide - Papers](https://www.promptingguide.ai/papers)
