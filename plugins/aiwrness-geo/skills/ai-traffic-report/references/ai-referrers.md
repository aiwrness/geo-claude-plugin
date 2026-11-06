# AI assistant referrers

List dated November 2026, compiled from known assistant domains; not re-verified against each provider since. Re-check before relying on it and give the list date in the report.

| Assistant | Referrer domains | Notes |
|---|---|---|
| ChatGPT | `chatgpt.com`, `chat.openai.com` | Links from ChatGPT search often also carry `utm_source=chatgpt.com` |
| Perplexity | `perplexity.ai`, `www.perplexity.ai` | |
| Claude | `claude.ai` | |
| Gemini | `gemini.google.com` | |
| Microsoft Copilot | `copilot.microsoft.com` | Some Copilot traffic arrives as Bing |
| Grok | `grok.com` | |
| DeepSeek | `chat.deepseek.com` | |
| Mistral Le Chat | `chat.mistral.ai` | |
| Meta AI | `meta.ai` | |
| You.com | `you.com` | |
| Poe | `poe.com` | |

Google AI Overviews and AI Mode send traffic as ordinary Google organic search: it cannot be separated in Google Analytics by referrer. Say so in every report.

Many AI visits arrive with no referrer at all (apps, copied links), counted as direct. AI traffic in analytics is therefore a lower bound.

## GA4 "AI" channel

Custom channel group rule (Admin → Data display → Channel groups), placed above "Referral":

- Channel name: `AI assistants`
- Condition: Source matches regex
  `(chatgpt\.com|chat\.openai\.com|perplexity\.ai|claude\.ai|gemini\.google\.com|copilot\.microsoft\.com|grok\.com|chat\.deepseek\.com|chat\.mistral\.ai|meta\.ai|you\.com|poe\.com)`

Custom channel groups apply to reports from when they are created and to past data in explorations; check the GA4 documentation for the property's current behaviour.
