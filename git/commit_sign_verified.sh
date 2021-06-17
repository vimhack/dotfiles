#!/usr/bin/env bash
# commit_sign_verified.sh
#
# commit signature verification


brew install gpg

# Check the command output to see if you have a GPG key pair
gpg --list-secret-keys --keyid-format LONG

# Generating a new GPG key
gpg --full-generate-key

# list GPG keys for which you have both a public and private key
gpg --list-secret-keys --keyid-format LONG
# Output as follows. In this example, the GPG key ID is: 260D2A80727A4AED
cat <<EOF
gpg: 正在检查信任度数据库
gpg: marginals needed: 3  completes needed: 1  trust model: pgp
gpg: 深度：0  有效性：  1  已签名：  0  信任度：0-，0q，0n，0m，0f，1u
/Users/xg/.gnupg/pubring.kbx
----------------------------
sec   rsa4096/260D2A80727A4AED 2020-09-11 [SC]
      7AAA60738D6816526D450B1D160D1A30727A4AED
uid                 [ 绝对 ] windvalley (Wind Valley) <i@sre.im>
ssb   rsa4096/9242C4DAA578D560 2020-09-11 [E]
EOF

# Prints the GPG key ID, in ASCII armor format,
# and adding the output txt to your GitHub account.
gpg --armor --export 260D2A80727A4AED

# To set your GPG signing key in Git
git config --global user.signingkey 260D2A80727A4AED

# paste the text below to add the GPG key to your shell profile
# shellcheck disable=SC2016
echo 'export GPG_TTY=$(tty)' >> ~/.zshrc

git config --global commit.gpgsign true

# Creates a signed commit
git commit -S -m "your commit message"

exit 0
