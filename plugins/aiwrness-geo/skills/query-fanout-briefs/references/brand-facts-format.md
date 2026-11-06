# The brand fact sheet (`brand-facts.md`)

The single source of facts about the brand. Every skill reads facts from it; none invents them. It lives on the user's side, never inside the plugin.

## Where to find it

1. A file named `brand-facts.md` in the working folder (Claude Code), in the project knowledge or attached to the conversation (Claude app).
2. If there is none, ask the user to attach it, or offer to create it with the `brand-fact-sheet` skill. A skill may continue without it, marking every missing fact as `[ADD: …]`.

## Freshness

Each fact has a review date. A fact past its review date is treated as unconfirmed: use it only with a note, and suggest re-confirming it with `brand-fact-sheet`.

## Format

```markdown
# {Brand} — brand facts

Last full review: {YYYY-MM-DD} · Owner: {name or team}

## Identity
| Fact | Value | Source | Confirmed | Review by |
|---|---|---|---|---|
| Name | … | … | YYYY-MM-DD | YYYY-MM-DD |
| Other names (aliases) | … | | | |
| Website | … | | | |
| Other domains | … | | | |
| Social profiles | network: URL, … | | | |
| Category | … | | | |
| Founded / founders | … | | | |
| Where the business is (only if buyers search by place) | … | | | |
| Markets served | … | | | |

## What it does
| Fact | Value | Source | Confirmed | Review by |
|---|---|---|---|---|
| What it does (one sentence) | … | | | |
| For whom | … | | | |
| Products / ranges | … | | | |
| Prices or price range | … | | | |

## Differentiators and proof
| Claim | Proof (number, customer, award) | Source | Confirmed | Review by |
|---|---|---|---|---|

## Desired positioning
- Positioning statement: …
- Three words we want AI assistants to use about us: …
- Segments and use cases we want to own: …
- What we are NOT: …

## Competitors
| Name | Website | Why they compete |
|---|---|---|

## Descriptions
- Short (one sentence, ≤ 160 characters): …
- Long (one paragraph, ≤ 512 characters): …

## Missing facts
- [ADD: …]
```

Rules: one fact per row; a number always has a source; "Confirmed" is the date a person validated it, never the date it was read from the site.
