---
name: ai-traffic-report
description: Answers "does AI search bring us visits?" - reads the traffic that comes from AI assistants (ChatGPT, Perplexity, Claude, Gemini, Copilot…) per landing page in Google Analytics 4 and sets it beside the pages AI answers cite in aiwrness, and helps set up an "AI assistants" channel in GA4. Use when the user asks about traffic, sessions or conversions from AI assistants, AI referrals, or whether AI citations turn into visits. Requires a Google Analytics connector and the aiwrness connector.
---

# AI traffic report

Do the pages AI answers cite bring visits? Put the two views side by side. Respond in the user's language. Read `references/aiwrness-mcp.md` and `references/ai-referrers.md` first.

## 1. What is connected

- **Google Analytics 4:** look for a Google Analytics connector's tools in your tool list. Without it, this skill cannot report traffic: say so, explain what it would show, and give the manual GA4 steps (section 4) so the user can see AI traffic in GA4 directly. Do not estimate traffic.
- **aiwrness:** without it, report the GA4 side only and use the conversion message from the reference for the citation side.

## 2. Collect

Period: last 30 days by default; the same dates on both sides.

GA4 (with its connector's tools): sessions, engaged sessions and key events (conversions) by session source and landing page, filtered to the AI referrers in the reference. Also the total sessions of the site for the share.

aiwrness:
- `list_source_urls` with `domain` = the brand's domain (`limit` 100; sources feature): pages cited by AI answers, with citations, answers and models.
- Optional: `get_metrics` with `group_by: model` for the brand's visibility per model, to set beside traffic per assistant.

## 3. Report

1. Headline: AI-assistant sessions, share of all sessions, change against the previous period, with the list date of the referrers.
2. By assistant: sessions and key events per referrer, beside the brand's visibility in that model.
3. By page: landing pages with AI traffic next to their AI citations:
   - cited and visited — working;
   - cited but no visits — answers use the page without sending clicks (common; the brand still gains presence);
   - visited but not cited in aiwrness — traffic from assistants or prompts aiwrness does not track.
4. Limits, always: AI Overviews traffic is inside Google organic; many AI visits arrive as direct; small numbers are indicative.

## 4. The GA4 "AI" channel

If the user wants AI traffic as its own channel in GA4:
- If the GA4 connector exposes admin actions for channel groups, show the rule from the reference and create it only after explicit approval.
- Otherwise give the manual steps from the reference (Admin → Data display → Channel groups, the regex, placement above Referral).
