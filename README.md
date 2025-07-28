# Neovim Configuration Setup

## Prerequisites
- Git installed on your system
- Neovim installed

## Installation Instructions

1. **Clone the dotfiles repository:**
```bash
git clone https://github.com/phamtrongthang123/dotfiles.git ~/.config/dotfiles
```

2. **Create Neovim config directory (if it doesn't exist):**
```bash
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
```

3. **Symlink the init.lua file:**
```bash
ln -s ~/.config/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
```

4. **Start Neovim and install plugins:**
```bash
nvim
```
- Plugins should auto-install
- For manual installation, run `:Lazy install` depending on your setup

5. **Restart Neovim to complete setup**
