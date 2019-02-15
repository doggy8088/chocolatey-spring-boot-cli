# Chocolatey Package for Fluent Terminal

https://github.com/felixse/FluentTerminal

Steps to build:

1. Package (`choco pack`)
2. Test (`choco install fluent-terminal -dv -s .` and `choco uninstall fluent-terminal -dv`)
3. Verify developers certificate is removed from Trust People store after uninstall (`certlm.msc`)
4. Verify shell context menu integration is removed
5. Publish (`choco push`)
