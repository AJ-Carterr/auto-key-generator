#! /bin/bash 

sshdir=$HOME"/.ssh/"
privkey=$sshdir"codecommit_rsa"
pubkey=$privkey.pub
conf=$sshdir"config"

echo "[+] Generating the key pair now..."
echo "[+] The following file output is in your clipboard, paste it into AWS IAM / Security Credentials / SSH Keys for CodeCommit:"
ssh-keygen -f $privkey -t rsa -N ''
echo
cat $pubkey | pbcopy && pbpaste

echo "" >> $conf
echo "Host git-codecommit.*.amazonaws.com" >> $conf
echo "  User RANDOMEXAMPLE990" >> $conf
echo "  IdentityFile ~/.ssh/codecommit_rsa" >> $conf
open -e $conf
