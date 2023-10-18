# integrotions

This is a personal project of mine that basically uses a script to auto upload [Rocketbook](https://getrocketbook.com.au/) notes from my Google Drive.

## Requirements

- A Google Drive account
- [Foreman](https://github.com/ddollar/foreman) - not required, but great if you have it

You will also need [Notion](https://www.notion.so/) or [Confluence](https://www.atlassian.com/software/confluence) depending on which integration you want to use.

## How to use

### Notion auto upload

You will need Notion API access. You will also need a parent page where the notes will be automatically uploaded.
For me I just created a blank Rocketbook page. Once you have the API keys, you will also need to add the page ID for your Rocketbook page.

Then it's as simple as:

```bash
export NOTION_API_KEY=secret_your-secret-notion-key
export NOTION_PAGE_ID=your-page-id-in-notion

foreman start notion
```

### Confluence auto upload

Similar to Notion, you would need your Confluence credentials, a space (preferrably your own), and a page under that space to upload new notes.

Setup is similar, just set the env variables:

```bash
export SPACE_ID="preferrably-your-personal-space-in-confluence"
export PARENT_ID="the-page-id-you-want-to-upload"
export CONFLUENCE_URL="https://your-org.atlassian.net/wiki/api/v2/pages"
export AUTH_TOKEN="your-confluence-auth-token"
```
