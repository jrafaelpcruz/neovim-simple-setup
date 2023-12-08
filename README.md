# neovim-simple-setup
A simple bash script to install tmux, neovim and more with the configurations I like to use.

## What this bash script will do?
<ul>
  <li>Install tmux (https://github.com/tmux/tmux/wiki)</li>
  <li>Install "Oh My Tmux" (https://github.com/gpakosz/.tmux)</li>
  <li>Install Neovim (https://neovim.io/)</li>
  <li>Install vim-plugin (https://github.com/junegunn/vim-plug)</li>
  <li>Install Fira Code Nerd Font (https://github.com/ryanoasis/nerd-fonts)</li>
  <li>Install nodejs, nvm e npm for the use of CoC</li>
</ul>

## What plugins are installed?
<ul>
  <li>Vim-airline (https://github.com/vim-airline/vim-airline)</li>
  <li>NerdTree (https://github.com/preservim/nerdtree)</li>
  <li>NerdTree-git-plugin (https://github.com/preservim/nerdtree)</li>
  <li>Vim-devicons (https://github.com/ryanoasis/vim-devicons)</li>
  <li>Vim-commentary (https://github.com/tpope/vim-commentary/)</li>
  <li>vim-surround (https://github.com/tpope/vim-surround)</li>
  <li>Vim-css-color (https://github.com/ap/vim-css-color)</li>
  <li>CoC (https://github.com/neoclide/coc.nvim)</li>
  <li>Vim-tmux-navigator (https://github.com/christoomey/vim-tmux-navigator)</li>
</ul>

## How to?
This is to be used with Debian/Ubuntu linux based distros.</br>
I'd recommend to:<br>
<code>cd</code><br>
<code>git clone https://github.com/jrafaelpcruz/neovim-simple-setup/</code><br>
<code>cd setup-nvim/</code><br>
<code>sudo chmod +x setup-neovim.sh</code><br>
<code>./setup-neovim.sh</code><br>
<br>
The script will need to run two times. After the first part is complete close every instance of the terminal, reopen it and run neovim alongside <code>:PlugInstall</code>.
Then run the script one more time for completion.
That's it!

## Important
I am not responsible for any damage this might cause to your os/computer (well, very unlikely but just in case...).<br/>
All the credits due to the original creators of the amazing tools used on this script!
