# 1G-Ray-of-Light
## Bash-Demos
### Contains the demos for our creation and destruction scripts
## Testing
When pushing/pulling on the development server, git will ask you for a password. You can use this fine-grained access token 
```bash
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
```


```bash
git config --global credential.https://github.com.username your-username
git config --global credential.https://github.com.token your-access-token
git config --global --unset credential.helper
```
