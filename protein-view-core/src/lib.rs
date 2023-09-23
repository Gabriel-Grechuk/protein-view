use godot::prelude::*;

mod atom;
mod molecule;

struct ProteinViewCore;

#[gdextension]
unsafe impl ExtensionLibrary for ProteinViewCore {}
