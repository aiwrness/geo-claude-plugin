---
name: rewrite-for-ai
description: Rewrites a web page, article or product text so AI assistants and AI search can quote it (generative engine optimisation), keeping the brand's tone. Use when the user wants content made citable or "AI-ready", optimised for ChatGPT, Perplexity or AI Overviews answers, or brings a brief from another GEO skill. Adds a direct answer, self-contained sections, FAQ and tables, marks missing facts as [ADD: …] instead of inventing them, and logs every change with its reason.
---

# Rewrite for AI

Make one piece of content easy for AI assistants to quote, without changing what the brand claims or how it sounds. Respond in the user's language; write the content in the language of its target market (the original's language unless the user says otherwise).

Reference: `references/brand-facts-format.md`.

## 1. Inputs

- The content: pasted text, a file, or a URL (fetch it).
- The goal: the question(s) the page should answer. If it comes with a brief (from `ai-blindspot-finder`, `query-fanout-briefs` or `geo-action-plan`), use its searches, questions and competitors as the goal and say so.
- `brand-facts.md` for facts. Without it, keep the original's facts and mark anything new as `[ADD: …]`.

## 2. Rewrite

- **Direct answer first:** 2–3 sentences under the main heading that answer the main question on their own.
- **Self-contained sections:** each section starts with its point and still makes sense if quoted alone (no "as mentioned above").
- **Headings as questions or clear claims**, matching how people ask.
- **Facts with sources:** numbers, dates, prices and claims come from the fact sheet or the original, with the source where it helps trust. A fact you would need but do not have → `[ADD: what is needed]`.
- **Tables** for comparisons, specs, prices and steps; **lists** for criteria.
- **FAQ** with 3–6 real follow-up questions, answered briefly.
- **Author and date** lines when the page type uses them.
- **Tone:** keep the brand's voice, vocabulary and level of formality from the original. Do not add hype, superlatives or claims the original does not make.
- Keep it honest: no hidden text, no keyword stuffing, no claims about competitors without a source.

## 3. Output

1. The rewritten content, ready to publish (Markdown, or HTML if the user asks).
2. Change log: a table of change → why (for example "moved pricing answer to the top → the page is cited for 'how much does X cost'").
3. Facts to provide: every `[ADD: …]`, most important first.

Nothing is published by this skill; the user reviews and publishes.

## 4. Close with the data question

One line: did the rewrite change how AI assistants cite the page? If aiwrness is connected, offer to log the publication as an event (`create_event`, category `website` or `blog_post`, today's date — ask first) so the effect can be compared before and after with `geo-impact-check`. If not connected, mention that measuring it needs aiwrness (conversion rules in `references/aiwrness-mcp.md`).
