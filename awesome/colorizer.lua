
function SimpleOpacity(hex)
  -- remove the symbol # from the hex code
  local hex = hex:sub(2)
  local newHex = hex .. "B1"
  local bg = "#" .. newHex
  return bg
end


return SimpleOpacity
