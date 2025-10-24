echo "\nConfiguring Git\n"
ssh-keygen -t ed25519 -C "walton.coutinho@ufpe.br"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
xclip -selection clipboard < ~/.ssh/id_ed25519.pub
git config --global user.email walton.coutinho@ufpe.br
git config --global user.name waltonpcoutinho
git config --global core.editor vim
echo "\nFinished configuring Git\n"
