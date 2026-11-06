# AI crawlers and robots.txt

List dated November 2026, compiled from the providers' published crawler names; it has not been re-verified against each provider since. Crawler names change: before publishing a robots.txt, re-check each provider's documentation and give the list date in the output.

| Provider | User agent | Purpose |
|---|---|---|
| OpenAI | `GPTBot` | Training |
| OpenAI | `OAI-SearchBot` | ChatGPT search index |
| OpenAI | `ChatGPT-User` | Fetches a page when a user asks |
| Anthropic | `ClaudeBot` | Training |
| Anthropic | `Claude-SearchBot` | Search index |
| Anthropic | `Claude-User` | Fetches a page when a user asks |
| Perplexity | `PerplexityBot` | Search index |
| Perplexity | `Perplexity-User` | Fetches a page when a user asks |
| Google | `Googlebot` | Search, including AI Overviews and AI Mode |
| Google | `Google-Extended` | Control token: use of content for Gemini training and grounding (not a separate crawler) |
| Microsoft | `Bingbot` | Bing search, used by Copilot |
| Apple | `Applebot` | Search (Siri, Spotlight) |
| Apple | `Applebot-Extended` | Control token: use for Apple's AI training |
| Meta | `Meta-ExternalAgent` | Training |
| Amazon | `Amazonbot` | Alexa and AI features |
| Common Crawl | `CCBot` | Open dataset used to train many models |
| DuckDuckGo | `DuckAssistBot` | DuckAssist answers |
| Mistral | `MistralAI-User` | Fetches a page when a user asks |

## Policies

- **Search and training allowed:** no blocks for the agents above.
- **Search only (common choice):** allow the search and user agents (`OAI-SearchBot`, `ChatGPT-User`, `Claude-SearchBot`, `Claude-User`, `PerplexityBot`, `Perplexity-User`, `Googlebot`, `Bingbot`, `Applebot`, `DuckAssistBot`); disallow the training agents and tokens (`GPTBot`, `ClaudeBot`, `Google-Extended`, `Applebot-Extended`, `Meta-ExternalAgent`, `CCBot`).
- **Training only:** rare; the reverse of the above.
- **Neither:** disallow all of them. Warn that the brand then cannot be cited from its own site by those assistants.

Blocking `Googlebot` removes the site from Google Search too: never suggest it for AI reasons.

robots.txt is a request, not an access control, and a CDN or firewall (bot protection, rate limits) can block crawlers that robots.txt allows: check both.
