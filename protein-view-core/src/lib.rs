use godot::prelude::*;

mod atom;

struct ProteinViewCore;

#[gdextension]
unsafe impl ExtensionLibrary for ProteinViewCore {}
