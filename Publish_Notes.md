### Build

```sh
choco pack
```

### Test Install

```sh
choco install spring-boot-cli -d -s .
```

### Test Uninstall

```sh
choco uninstall spring-boot-cli -d -s .
```

### Publish package

```sh
choco push spring-boot-cli-2.7.3.nupkg --source https://push.chocolatey.org/
```
