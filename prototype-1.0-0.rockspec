package = "Prototype"
version = "1.0-0"
source = {
   url = "git+https://github.com/baalIsBack/LuaLibrary_Prototype.git"
}
description = {
   summary = "A simple Prototype object that can be extended and instantiated recursively.",
   homepage = "https://github.com/baalIsBack/LuaLibrary_Prototype",
   license = "BSD-4-Clause"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      prototype = "prototype.lua"
   }
}
