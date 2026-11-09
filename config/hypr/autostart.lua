-- Extra autostart processes.

hl.on("hyprland.start", function()
    hl.exec_cmd("keychain agent start --ssh-agent-socket " .. os.getenv("HOME") .. "/.ssh/agent.sock")
end)

hl.on("hyprland.shutdown", function()
    hl.exec_cmd("keychain agent stop")
end)

hl.env("SSH_AUTH_SOCK", os.getenv("HOME") .. "/.ssh/agent.sock")
