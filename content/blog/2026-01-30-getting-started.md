+++
title = "Getting Started with Zola on GitHub Pages"
date = 2026-01-30T14:00:00Z
draft = false

[taxonomies]
tags = ["github-pages", "deployment", "blogging", "git"]
categories = ["tutorial"]

[extra]
toc = true
+++

This guide will walk you through setting up a blog on GitHub Pages using Zola. By the end, you'll have a blazingly fast blog hosted for free!

## Prerequisites

Before you begin, make sure you have:

- A GitHub account
- Git installed on your machine
- Nix package manager (or Zola installed directly)
- A text editor

## Step-by-Step Setup

### 1. Create a GitHub Repository

1. Go to [github.com](https://github.com) and sign in
2. Click the "+" icon and select "New repository"
3. Name your repository `blog` (or any name you prefer)
4. Make it public (required for free GitHub Pages)
5. Don't initialize with README (we'll create it locally)

### 2. Clone and Set Up Locally

```bash
# Navigate to your projects directory
cd ~/eiger/repos/blog

# Initialize git
git init
git checkout -b main

# Add all files
git add .
git commit -m "Initial commit: Zola blog setup"

# Connect to GitHub (replace 'username' with your GitHub username)
git remote add origin https://github.com/username/blog.git
git push -u origin main
```

### 3. Configure GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** > **Pages**
3. Under "Build and deployment":
   - Source: **GitHub Actions**
4. That's it! GitHub Actions will build and deploy automatically

### 4. Test Your Blog

After the GitHub Actions workflow completes (1-2 minutes):

- Visit: `https://username.github.io/blog`
- You should see your blog with all posts!

## Development Workflow

### Using Nix Shell (Recommended)

If you have Nix installed:

```bash
cd ~/eiger/repos/blog
nix-shell  # Loads Zola and dependencies
zola serve  # Start development server
```

Visit `http://127.0.0.1:1111` to see your blog with live reload!

### Direct Installation (Alternative)

Download Zola from [the releases page](https://github.com/getsapling/zola/releases):

**Linux:**
```bash
wget https://github.com/getsapling/zola/releases/download/v0.19.1/zola-v0.19.1-x86_64-unknown-linux-gnu.tar.gz
tar xf zola-v0.19.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv zola /usr/local/bin/
```

**macOS:**
```bash
brew install zola
```

**Windows:**
```bash
choco install zola
```

## Writing and Publishing Posts

### Create a New Post

```bash
# Create a new file with today's date
touch content/blog/$(date +%Y-%m-%d)-my-new-post.md
```

### Add Front Matter and Content

```markdown
+++
title = "My New Post"
date = 2026-01-30T14:00:00Z
draft = false

[taxonomies]
tags = ["tutorial", "zola"]
categories = ["blogging"]

[extra]
toc = true
+++

Write your content here using Markdown!
```

### Preview Locally

```bash
zola serve
```

Visit `http://127.0.0.1:1111` to see your changes live. Zola automatically reloads when you save files!

### Publish

```bash
git add content/blog/$(date +%Y-%m-%d)-my-new-post.md
git commit -m "Add new post: My New Post"
git push
```

GitHub Actions deploys automatically in under a minute!

## Project vs User Sites

There are two types of GitHub Pages sites:

### Project Site (This Setup)
- **URL**: `username.github.io/blog`
- **Repository**: Any name (e.g., "blog")
- **Configuration**: Requires `base_url = "https://username.github.io/blog"` in `config.toml`
- **Deployment**: GitHub Actions
- **Advantage**: Can have multiple project sites

### User Site (Alternative)
- **URL**: `username.github.io`
- **Repository**: Must be named `username.github.io`
- **Configuration**: `base_url = "https://username.github.io"`
- **Deployment**: GitHub Actions or branch deployment
- **Limitation**: Only one per account

## Troubleshooting

### Links Don't Work on Deployed Site

Make sure `base_url` is correct in `config.toml`:

```toml
base_url = "https://username.github.io/blog"
```

### GitHub Actions Failing

Check the Actions tab for error logs. Common issues:
- Theme submodule not checked out (ensure `submodules: true` in workflow)
- Typo in `config.toml`
- Invalid front matter in posts

### Theme Not Showing

Ensure the theme submodule is initialized:

```bash
git submodule update --init --recursive
```

### Port 1111 Already in Use

```bash
# Use a different port
zola serve --port 1112

# Or kill the process using port 1111
lsof -ti:1111 | xargs kill -9
```

## Zola Commands

Here are the most useful Zola commands:

```bash
# Start development server with live reload
zola serve

# Build the site (output to public/)
zola build

# Check for broken links and other issues
zola check

# Serve on a different port
zola serve --port 1112

# Serve on all interfaces (access from other devices)
zola serve --interface 0.0.0.0

# Build with drafts included
zola build --drafts
```

## Customization Options

### Update Site Configuration

Edit `config.toml` to customize:
- Site title and description
- Author information
- Social media links
- Theme settings
- Taxonomies (tags, categories)

### Add More Pages

Create `.md` files in `content/pages/`:

```markdown
+++
title = "Projects"
template = "page.html"
+++

Your content here...
```

### Customize the Theme

The tabi theme is highly customizable. Check the [tabi documentation](https://github.com/welpo/tabi) for options like:
- Color schemes
- Custom CSS
- Typography
- Layout options

### Enable Comments

Add comments using:
- [giscus](https://giscus.app/) (GitHub Discussions)
- [utterances](https://utteranc.es/) (GitHub Issues)
- Configure in `config.toml` extra section

### Add Analytics

Add privacy-friendly analytics:
- [Plausible](https://plausible.io/)
- [Simple Analytics](https://simpleanalytics.com/)
- Configure in theme settings

## Resources

- [Zola Documentation](https://www.getzola.org/documentation/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [tabi Theme](https://github.com/welpo/tabi)
- [Zola Themes Gallery](https://www.getzola.org/themes/)
- [Tera Template Documentation](https://keats.github.io/tera/)

Happy blogging! 🚀
