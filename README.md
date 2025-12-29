## Install nixos from zero to hero simples and grafic interface Gnome
1. TODO: STEP by STEP

## Configure git
### Create ssh key
- [doc link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Create gpg key (optional)
- [doc link](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

### Update Git configuration
- Edit `home-manager/common/git/default.nix`
- Update `userName`, `userEmail`, and `signing.key` with your information
- If not using GPG signing, remove or set `signByDefault = false`

## Reference
- https://www.tonybtw.com/tutorial/nixos-from-scratch/

TODO
 - manage secrets (sops-nix or something like this)
 - manage new pkgs
 - binary cache

