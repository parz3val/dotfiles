if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- Hide mouse when typing
  vim.g.neovide_hide_mouse_when_typing = true
  -- Fonts
  -- vim.o.guifont = "Spline Sans Mono Light:h12"
  vim.o.guifont = "Lekton Nerd Font:h14"
  -- vim.o.guifont = "GeistMono Nerd Font:h16"
  -- vim.o.guifont = "CommitMono Nerd Font:h14"
  -- vim.o.guifont = "FantasqueSansM Nerd Font:h16"
  -- vim.o.guifont = "0xProto Nerd Font Mono:h11"
  -- vim.g.neovide_them = 'auto'
  -- vim.o.guifont = "VictorMono Nerd Font:h14" -- text below applies for VimScript

  vim.g.neovide_remember_window_size = true
  -- this keymap will let me see if the performance of neovide is
  -- suffering
  vim.keymap.set('n', '<leader>pff', function()
    vim.g.neovide_profiler = true
  end)
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_profiler = false
  vim.g.neovide_confirm_quit = true
  -- SCROLL ANIMATION OPTIONS
  vim.g.neovide_scroll_animation_length = 0.1
  -- SCROLL ANIMATION EFFECTS
  --vim.g.neovide_cursor_vfx_mode = "railgun"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  -- vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_cursor_vfx_mode = "wireframe"
  -- VFX PARTICLE TRANSP
  vim.g.neovide_cursor_vfx_opacity = 200.0
  -- VFX PARTICLE LIFETIME
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  -- VFX PARTICLE DENSITY
  vim.g.neovide_cursor_vfx_particle_density = 10.2
  -- VFX PARTICLE SPEED
  vim.g.neovide_cursor_vfx_particle_speed = 1.2
  -- VFX PARTICLE PHASE
  vim.g.neovide_cursor_vfx_particle_phase = 1.5

  -- animate cursor blink
  vim.g.neovide_cursor_smooth_blink = true


  -- cursor trail size
  -- vim.g.neovide_cursor_trail_size = 1.0
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_window_blurred = true
end
