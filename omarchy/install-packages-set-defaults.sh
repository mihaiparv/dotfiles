#!/usr/bin/env bash
#
# installs omarchy packages.

# system packages
omarchy pkg present ghostty || ( omarchy install terminal ghostty && omarchy default terminal ghostty )
omarchy pkg present google-chrome || ( omarchy install browser chrome && omarchy default browser chrome )
omarchy pkg present tailscale || ( omarchy install service tailscale )
omarchy pkg present vscode || ( omarchy install editor vscode && omarchy default editor code )

# utilities
omarchy pkg present keychain || ( omarchy pkg add keychain )
omarchy pkg present lastpass-cli || ( omarchy pkg add lastpass-cli )
