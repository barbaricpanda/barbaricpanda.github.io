# Zola Blog on GitHub Pages

A blazingly fast, modern blog powered by Zola and hosted on GitHub Pages. Built with the tabi theme for perfect Lighthouse scores and beautiful design.

## 🌐 Live Site

**URL**: `https://username.github.io/blog` (replace `username` with your GitHub username)

## ✨ Features

- ⚡ Zola static site generator (22x faster than Jekyll!)
- 🎨 tabi theme with dark/light mode
- 📱 Responsive, mobile-friendly design
- 🔍 Perfect SEO and Lighthouse scores (100/100/100/100)
- 📊 RSS/Atom feeds built-in
- 🚀 Automatic deployment via GitHub Actions
- 💻 Simple Nix shell development environment
- 🔎 Built-in search functionality
- 🎯 Single binary, zero dependencies

## 🚀 Quick Start

### Prerequisites

- **Nix** (recommended) OR **Zola binary**
- Git
- GitHub account

### Local Development

#### Option 1: Using Nix Shell (Recommended)

```bash
cd ~/eiger/repos/blog
nix-shell  # Loads shell.nix with Zola
zola serve  # Start development server with live reload
```

Visit: `http://127.0.0.1:1111`

#### Option 2: Install Zola Directly

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

Then run:
```bash
cd ~/eiger/repos/blog
zola serve
```

Visit: `http://127.0.0.1:1111`

## 📝 Writing Posts

### Create a New Post

1. Create a file in `content/blog/` with the format: `YYYY-MM-DD-title.md`

```bash
touch content/blog/$(date +%Y-%m-%d)-my-new-post.md
```

2. Add TOML front matter and content (note the `+++` delimiters):

```markdown
+++
title = "My Awesome Post"
date = 2026-01-31T10:00:00Z
draft = false

[taxonomies]
tags = ["zola", "blogging", "tutorial"]
categories = ["tutorial"]

[extra]
toc = true
+++

Write your content here using Markdown!

## Heading

- Bullet points
- **Bold** and *italic*
- [Links](https://example.com)

\```python
# Code blocks with syntax highlighting
print("Hello, World!")
\```
```

3. Preview locally:

```bash
zola serve
```

4. Commit and push:

```bash
git add content/blog/$(date +%Y-%m-%d)-my-new-post.md
git commit -m "Add new post: My Awesome Post"
git push
```

GitHub Actions will automatically build and deploy your site in under a minute!

### Working with Drafts

Set `draft = true` in the front matter:

```toml
+++
title = "Work in Progress"
date = 2026-01-31T10:00:00Z
draft = true
+++
```

Preview drafts locally:

```bash
zola serve --drafts
```

When ready to publish, change to `draft = false`.

## 🔧 Configuration

### Important Files

- **`config.toml`**: Main Zola configuration
  - **CRITICAL**: Set `base_url = "https://username.github.io/blog"` to match your repository
  - Customize title, description, author info, theme settings
- **`shell.nix`**: Nix development environment
- **`.github/workflows/zola-deploy.yml`**: GitHub Actions deployment
- **`themes/tabi/`**: Git submodule for the tabi theme

### Customizing

#### Change Site Title and Description

Edit `config.toml`:

```toml
title = "Your Blog Title"
description = "Your blog description"

[extra]
author = "Your Name"
author_url = "https://github.com/yourusername"
```

#### Update About Page

Edit `content/pages/about.md` with your bio and information.

#### Add Social Links

Edit `config.toml`:

```toml
[extra]
social_media = [
    { name = "GitHub", url = "https://github.com/yourusername" },
    { name = "Twitter", url = "https://twitter.com/yourusername" },
    { name = "LinkedIn", url = "https://linkedin.com/in/yourusername" },
]
```

#### Change Theme

1. Find a theme at [Zola themes](https://www.getzola.org/themes/)
2. Add as git submodule:
   ```bash
   git submodule add https://github.com/author/theme-name.git themes/theme-name
   ```
3. Update `config.toml`:
   ```toml
   theme = "theme-name"
   ```

## 🚢 Deployment

### Initial Setup

1. Create a GitHub repository named `blog` (or any name)
2. **IMPORTANT**: Add the tabi theme submodule:

```bash
cd ~/eiger/repos/blog
git submodule add https://github.com/welpo/tabi.git themes/tabi
git submodule update --init --recursive
```

3. Initialize git and push:

```bash
git init
git checkout -b main
git add .
git commit -m "Initial commit: Zola blog setup"
git remote add origin https://github.com/username/blog.git
git push -u origin main
```

4. Configure GitHub Pages:
   - Go to repository **Settings** > **Pages**
   - Under "Build and deployment", select Source: **GitHub Actions**
   - OR select Source: **Deploy from a branch**, Branch: **gh-pages** / **(root)**

5. Verify GitHub token permissions:
   - Go to **Settings** > **Actions** > **General**
   - Under "Workflow permissions", select **Read and write permissions**

### Continuous Deployment

Every push to the `main` branch triggers automatic deployment:

```bash
git add .
git commit -m "Update content"
git push
```

GitHub Actions builds and deploys in under a minute. Check the **Actions** tab for status.

## 📁 Project Structure

```
/home/diogo/eiger/repos/blog/
├── config.toml                  # Zola configuration
├── shell.nix                    # Nix development environment
├── .gitignore                   # Git ignore rules
├── README.md                    # This file
├── content/                     # All content
│   ├── _index.md               # Homepage
│   ├── blog/                   # Blog section
│   │   ├── _index.md          # Blog section config
│   │   ├── 2026-01-31-welcome-to-zola.md
│   │   ├── 2026-01-30-getting-started.md
│   │   └── 2026-01-29-markdown-guide.md
│   └── pages/                  # Standalone pages
│       └── about.md
├── themes/                      # Themes (git submodules)
│   └── tabi/                   # tabi theme
├── static/                      # Static assets (images, files)
├── public/                      # Generated site (gitignored)
├── .zola-cache/                # Zola cache (gitignored)
└── .github/
    └── workflows/
        └── zola-deploy.yml     # GitHub Actions workflow
```

## 🎨 Theme Customization

### Override Styles

Create `sass/custom.scss`:

```scss
/* Custom styles */
body {
  font-family: 'Your Font', sans-serif;
}
```

Then enable in `config.toml`:

```toml
compile_sass = true
```

### Override Templates

Copy templates from `themes/tabi/templates/` to `templates/` and modify.

### Add Custom Pages

Create `.md` files in `content/pages/`:

```markdown
+++
title = "Projects"
template = "page.html"
+++

## My Projects

List your projects here...
```

## 🔍 SEO and Analytics

### SEO

SEO is built into Zola:

- Edit `config.toml` for site-wide settings
- Add front matter to individual posts:

```toml
+++
title = "Post Title"
description = "Post description for SEO"

[extra]
image = "/images/post-image.jpg"
+++
```

### Analytics

Add privacy-friendly analytics like Plausible or Simple Analytics by configuring in `config.toml` extra section (check theme documentation).

### RSS Feed

RSS feed is automatically generated at `/atom.xml`

Readers can subscribe at: `https://username.github.io/blog/atom.xml`

## 🐛 Troubleshooting

### Links Don't Work on Deployed Site

**Solution**: Ensure `base_url` is correct in `config.toml`:

```toml
base_url = "https://username.github.io/blog"
```

### Theme Not Showing

**Solution**:
1. Check theme submodule is initialized:
   ```bash
   git submodule update --init --recursive
   ```
2. Verify `config.toml` has `theme = "tabi"`
3. Check `.github/workflows/zola-deploy.yml` has `submodules: true`

### GitHub Actions Failing

**Solution**:
1. Check the Actions tab for error logs
2. Common issues:
   - Theme submodule not checked out (add `submodules: true` to checkout step)
   - Typo in `config.toml`
   - Invalid front matter in posts (must use `+++` and TOML format)
   - Missing GitHub token permissions (enable read/write in repo settings)
3. Test build locally: `zola build`

### Port Already in Use

**Solution**:

```bash
# Kill process using port 1111
lsof -ti:1111 | xargs kill -9

# Or use a different port
zola serve --port 1112
```

### Zola Command Not Found

**Solution** (Nix shell):

```bash
# Enter Nix shell first
nix-shell

# Then run Zola
zola serve
```

## ⚡ Zola Commands

```bash
# Start development server with live reload
zola serve

# Build the site (output to public/)
zola build

# Check for broken links and errors
zola check

# Serve on a different port
zola serve --port 1112

# Serve on all interfaces (access from other devices)
zola serve --interface 0.0.0.0

# Build with drafts included
zola serve --drafts
zola build --drafts

# Get Zola version
zola --version
```

## 🎯 Why Zola?

### Performance Comparison

- **Jekyll**: 2.9+ seconds per build, requires Ruby environment
- **Zola**: 0.13 seconds per build, single binary
- **22x faster!**

### Dependencies

- **Jekyll**: Ruby 3.1, Bundler, ~50 gems
- **Zola**: Single binary, zero dependencies

### Features

- **Jekyll**: Requires plugins for most features
- **Zola**: Everything built-in (Sass, syntax highlighting, RSS, search, sitemap)

### Developer Experience

- **Jekyll**: Slow builds, gem conflicts, complex errors
- **Zola**: Instant rebuilds, clear errors, simple setup

## 📚 Resources

- [Zola Documentation](https://www.getzola.org/documentation/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [tabi Theme](https://github.com/welpo/tabi)
- [Zola Themes Gallery](https://www.getzola.org/themes/)
- [Markdown Guide](https://www.markdownguide.org/)
- [Tera Template Documentation](https://keats.github.io/tera/)

## 🤝 Contributing

This is a personal blog, but feel free to:
- Report issues
- Suggest improvements
- Fork for your own use

## 📄 License

This blog structure is open source. Content copyright belongs to the author.

---

**Built with**:
- [Zola](https://www.getzola.org/) - Blazingly fast static site generator
- [tabi](https://github.com/welpo/tabi) - Modern, accessible Zola theme
- [GitHub Pages](https://pages.github.com/) - Free hosting
- [Nix](https://nixos.org/) - Reproducible development environment
- [GitHub Actions](https://github.com/features/actions) - CI/CD

**Happy blogging!** 🚀
