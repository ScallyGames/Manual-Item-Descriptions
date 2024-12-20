EID.KeyboardMapping = 
{
	[Keyboard.KEY_SPACE] = function (shiftPressed, rightAltPressed) return " " end,
	[Keyboard.KEY_APOSTROPHE] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_COMMA] = function (shiftPressed, rightAltPressed) return "," end,
	[Keyboard.KEY_MINUS] = function (shiftPressed, rightAltPressed) if shiftPressed then return "_" else return "-" end end,
	[Keyboard.KEY_PERIOD] = function (shiftPressed, rightAltPressed) if shiftPressed then return ":" else return "." end end,
	[Keyboard.KEY_SLASH] = function (shiftPressed, rightAltPressed) return "/" end,
	[Keyboard.KEY_0] = function (shiftPressed, rightAltPressed) if shiftPressed then return "=" elseif rightAltPressed then return "}" else return "0" end end,
	[Keyboard.KEY_1] = function (shiftPressed, rightAltPressed) if shiftPressed then return "!" elseif rightAltPressed then return "" else return "1" end end,
	[Keyboard.KEY_2] = function (shiftPressed, rightAltPressed) if shiftPressed then return "\"" elseif rightAltPressed then return "²" else return "2" end end,
	[Keyboard.KEY_3] = function (shiftPressed, rightAltPressed) if shiftPressed then return "§" elseif rightAltPressed then return "³" else return "3" end end,
	[Keyboard.KEY_4] = function (shiftPressed, rightAltPressed) if shiftPressed then return "$" elseif rightAltPressed then return "" else return "4" end end,
	[Keyboard.KEY_5] = function (shiftPressed, rightAltPressed) if shiftPressed then return "%" elseif rightAltPressed then return "" else return "5" end end,
	[Keyboard.KEY_6] = function (shiftPressed, rightAltPressed) if shiftPressed then return "&" elseif rightAltPressed then return "" else return "6" end end,
	[Keyboard.KEY_7] = function (shiftPressed, rightAltPressed) if shiftPressed then return "/" elseif rightAltPressed then return "{" else return "7" end end,
	[Keyboard.KEY_8] = function (shiftPressed, rightAltPressed) if shiftPressed then return "(" elseif rightAltPressed then return "[" else return "8" end end,
	[Keyboard.KEY_9] = function (shiftPressed, rightAltPressed) if shiftPressed then return ")" elseif rightAltPressed then return "]" else return "9" end end,
	[Keyboard.KEY_SEMICOLON] = function (shiftPressed, rightAltPressed) return ";" end,
	[Keyboard.KEY_EQUAL] = function (shiftPressed, rightAltPressed) return "=" end,
	[Keyboard.KEY_A] = function (shiftPressed, rightAltPressed) if shiftPressed then return "A" else return "a" end end,
	[Keyboard.KEY_B] = function (shiftPressed, rightAltPressed) if shiftPressed then return "B" else return "b" end end,
	[Keyboard.KEY_C] = function (shiftPressed, rightAltPressed) if shiftPressed then return "C" else return "c" end end,
	[Keyboard.KEY_D] = function (shiftPressed, rightAltPressed) if shiftPressed then return "D" else return "d" end end,
	[Keyboard.KEY_E] = function (shiftPressed, rightAltPressed) if shiftPressed then return "E" else return "e" end end,
	[Keyboard.KEY_F] = function (shiftPressed, rightAltPressed) if shiftPressed then return "F" else return "f" end end,
	[Keyboard.KEY_G] = function (shiftPressed, rightAltPressed) if shiftPressed then return "G" else return "g" end end,
	[Keyboard.KEY_H] = function (shiftPressed, rightAltPressed) if shiftPressed then return "H" else return "h" end end,
	[Keyboard.KEY_I] = function (shiftPressed, rightAltPressed) if shiftPressed then return "I" else return "i" end end,
	[Keyboard.KEY_J] = function (shiftPressed, rightAltPressed) if shiftPressed then return "J" else return "j" end end,
	[Keyboard.KEY_K] = function (shiftPressed, rightAltPressed) if shiftPressed then return "K" else return "k" end end,
	[Keyboard.KEY_L] = function (shiftPressed, rightAltPressed) if shiftPressed then return "L" else return "l" end end,
	[Keyboard.KEY_M] = function (shiftPressed, rightAltPressed) if shiftPressed then return "M" else return "m" end end,
	[Keyboard.KEY_N] = function (shiftPressed, rightAltPressed) if shiftPressed then return "N" else return "n" end end,
	[Keyboard.KEY_O] = function (shiftPressed, rightAltPressed) if shiftPressed then return "O" else return "o" end end,
	[Keyboard.KEY_P] = function (shiftPressed, rightAltPressed) if shiftPressed then return "P" else return "p" end end,
	[Keyboard.KEY_Q] = function (shiftPressed, rightAltPressed) if shiftPressed then return "Q" else return "q" end end,
	[Keyboard.KEY_R] = function (shiftPressed, rightAltPressed) if shiftPressed then return "R" else return "r" end end,
	[Keyboard.KEY_S] = function (shiftPressed, rightAltPressed) if shiftPressed then return "S" else return "s" end end,
	[Keyboard.KEY_T] = function (shiftPressed, rightAltPressed) if shiftPressed then return "T" else return "t" end end,
	[Keyboard.KEY_U] = function (shiftPressed, rightAltPressed) if shiftPressed then return "U" else return "u" end end,
	[Keyboard.KEY_V] = function (shiftPressed, rightAltPressed) if shiftPressed then return "V" else return "v" end end,
	[Keyboard.KEY_W] = function (shiftPressed, rightAltPressed) if shiftPressed then return "W" else return "w" end end,
	[Keyboard.KEY_X] = function (shiftPressed, rightAltPressed) if shiftPressed then return "X" else return "x" end end,
	[Keyboard.KEY_Y] = function (shiftPressed, rightAltPressed) if shiftPressed then return "Y" else return "y" end end,
	[Keyboard.KEY_Z] = function (shiftPressed, rightAltPressed) if shiftPressed then return "Z" else return "z" end end,
	[Keyboard.KEY_LEFT_BRACKET] = function (shiftPressed, rightAltPressed) if shiftPressed then return "?" elseif rightAltPressed then return "\\" else return "(" end  end,
	[Keyboard.KEY_BACKSLASH] = function (shiftPressed, rightAltPressed) return "\\" end,
	[Keyboard.KEY_RIGHT_BRACKET] = function (shiftPressed, rightAltPressed) if shiftPressed then return "`" else return "´" end  end,
	[Keyboard.KEY_GRAVE_ACCENT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_WORLD_1] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_WORLD_2] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_ESCAPE] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_ENTER] = function (shiftPressed, rightAltPressed) return "#" end,
	[Keyboard.KEY_TAB] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_BACKSPACE] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_INSERT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_DELETE] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_RIGHT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_LEFT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_DOWN] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_UP] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_PAGE_UP] = function (shiftPressed, rightAltPressed) return "\1" end, -- Use \1 over ↑ to avoid multibyte characer issues and over {{ArrowUp}} to allow easy deletion
	[Keyboard.KEY_PAGE_DOWN] = function (shiftPressed, rightAltPressed) return "\2" end, -- Use \2 over ↓ to avoid multibyte characer issues and over {{ArrowDown}} to allow easy deletion
	[Keyboard.KEY_HOME] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_END] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_CAPS_LOCK] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_SCROLL_LOCK] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_NUM_LOCK] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_PRINT_SCREEN] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_PAUSE] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F1] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F2] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F3] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F4] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F5] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F6] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F7] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F8] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F9] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F10] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F11] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F12] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F13] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F14] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F15] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F16] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F17] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F18] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F19] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F20] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F21] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F22] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F23] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F24] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_F25] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_KP_0] = function (shiftPressed, rightAltPressed) return "0" end,
	[Keyboard.KEY_KP_1] = function (shiftPressed, rightAltPressed) return "1" end,
	[Keyboard.KEY_KP_2] = function (shiftPressed, rightAltPressed) return "2" end,
	[Keyboard.KEY_KP_3] = function (shiftPressed, rightAltPressed) return "3" end,
	[Keyboard.KEY_KP_4] = function (shiftPressed, rightAltPressed) return "4" end,
	[Keyboard.KEY_KP_5] = function (shiftPressed, rightAltPressed) return "5" end,
	[Keyboard.KEY_KP_6] = function (shiftPressed, rightAltPressed) return "6" end,
	[Keyboard.KEY_KP_7] = function (shiftPressed, rightAltPressed) return "7" end,
	[Keyboard.KEY_KP_8] = function (shiftPressed, rightAltPressed) return "8" end,
	[Keyboard.KEY_KP_9] = function (shiftPressed, rightAltPressed) return "9" end,
	[Keyboard.KEY_KP_DECIMAL] = function (shiftPressed, rightAltPressed) return "." end,
	[Keyboard.KEY_KP_DIVIDE] = function (shiftPressed, rightAltPressed) return "/" end,
	[Keyboard.KEY_KP_MULTIPLY] = function (shiftPressed, rightAltPressed) return "*" end,
	[Keyboard.KEY_KP_SUBTRACT] = function (shiftPressed, rightAltPressed) return "-" end,
	[Keyboard.KEY_KP_ADD] = function (shiftPressed, rightAltPressed) return "+" end,
	[Keyboard.KEY_KP_ENTER] = function (shiftPressed, rightAltPressed) return "\n" end,
	[Keyboard.KEY_KP_EQUAL] = function (shiftPressed, rightAltPressed) return "=" end,
	[Keyboard.KEY_LEFT_SHIFT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_LEFT_CONTROL] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_LEFT_ALT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_LEFT_SUPER] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_RIGHT_SHIFT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_RIGHT_CONTROL] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_RIGHT_ALT] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_RIGHT_SUPER] = function (shiftPressed, rightAltPressed) return "" end,
	[Keyboard.KEY_MENU] = function (shiftPressed, rightAltPressed) return "" end,
}