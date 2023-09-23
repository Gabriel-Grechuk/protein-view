use godot::engine::Sprite2D;
use godot::engine::Sprite2DVirtual;
use godot::prelude::*;

use crate::atom::Atom;

#[derive(GodotClass)]
#[class(base=Sprite2D)]
struct Player {
    speed: f64,
    angular_speed: f64,

    #[base]
    sprite: Base<Sprite2D>,
}

#[godot_api]
impl Sprite2DVirtual for Player {
    fn init(sprite: Base<Sprite2D>) -> Self {
        godot_print!("Hello, world!"); // Prints to the Godot console
                                       //
        let atom = Atom::from_number(1);

        match atom {
            Ok(atm) => godot_print!("{:#?}", atm),
            Err(e) => godot_print!("{e}"),
        }

        Self {
            speed: 400.0,
            angular_speed: std::f64::consts::PI,
            sprite,
        }
    }
}
