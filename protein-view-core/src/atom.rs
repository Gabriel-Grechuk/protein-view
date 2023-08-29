pub mod atom {
    use phf::phf_map;

    struct AtomConstants<'a> {
        number: u8,
        symbol: &'a str,
        weight: f32,
        radius: f32,
    }

    static CONSTANTS: phf::Map<u8, AtomConstants> = phf_map! {
        1u8 => AtomConstants {
            number: 1,
            symbol: "H",
            weight: 1.0,
            radius: 1.0,
        }
    };
}
