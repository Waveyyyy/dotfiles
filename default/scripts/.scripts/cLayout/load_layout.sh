#!/usr/bin/env bash

# append saved layout of workspace 2 to workspace 2
i3-msg "workspace 2:C; append_layout ~/.config/i3/workspace_2.json"

# fill containers with programs
(alacritty --working-directory ~/programming  &)
(alacritty --working-directory ~/programming  &)
(alacritty --working-directory ~/programming  &)
