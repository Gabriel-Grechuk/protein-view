use phf::phf_map;

#[derive(Debug)]
pub struct Atom<'a> {
    pub number: u8,
    pub symbol: &'a str,
    pub weight: f32,
    pub radius: f32,
}

pub static CONSTANTS: phf::Map<u8, Atom> = phf_map! {
    1u8 => Atom {
        number: 1,
        symbol: "H",
        weight: 1.008,
        radius: 1.1,
    },

    2u8 => Atom {
        number: 2,
        symbol: "He",
        weight: 4.003,
        radius: 1.4,
    },

    3u8 => Atom {
        number: 3,
        symbol: "Li",
        weight: 6.941,
        radius: 1.81,
    },

    4u8 => Atom {
        number: 4,
        symbol: "Be",
        weight: 9.012,
        radius: 1.53,
    },

    5u8 => Atom {
        number: 5,
        symbol: "B",
        weight: 10.811,
        radius: 1.92,
    },

    6u8 => Atom {
        number: 6,
        symbol: "C",
        weight: 12.011,
        radius: 1.7,
    },

    7u8 => Atom {
        number: 7,
        symbol: "N",
        weight: 14.007,
        radius: 1.55,
    },

    8u8 => Atom {
        number: 8,
        symbol: "O",
        weight: 15.999,
        radius: 1.52,
    },

    9u8 => Atom {
        number: 9,
        symbol: "F",
        weight: 18.998,
        radius: 1.47,
    },

    10u8 => Atom {
        number: 10,
        symbol: "Ne",
        weight: 20.18,
        radius: 1.54,
    },

    11u8 => Atom {
        number: 11,
        symbol: "Na",
        weight: 22.99,
        radius: 2.27,
    },

    12u8 => Atom {
        number: 12,
        symbol: "Mg",
        weight: 24.305,
        radius: 1.73,
    },

    13u8 => Atom {
        number: 13,
        symbol: "Al",
        weight: 26.982,
        radius: 1.84,
    },

    14u8 => Atom {
        number: 14,
        symbol: "Si",
        weight: 28.086,
        radius: 2.1,
    },

    15u8 => Atom {
        number: 15,
        symbol: "P",
        weight: 30.974,
        radius: 1.8,
    },

    16u8 => Atom {
        number: 16,
        symbol: "S",
        weight: 32.065,
        radius: 1.8,
    },

    17u8 => Atom {
        number: 17,
        symbol: "Cl",
        weight: 35.453,
        radius: 1.75,
    },

    18u8 => Atom {
        number: 18,
        symbol: "Ar",
        weight: 39.948,
        radius: 1.88,
    },

    19u8 => Atom {
        number: 19,
        symbol: "K",
        weight: 39.098,
        radius: 2.75,
    },

    20u8 => Atom {
        number: 20,
        symbol: "Ca",
        weight: 40.078,
        radius: 2.31,
    },

    21u8 => Atom {
        number: 21,
        symbol: "Sc",
        weight: 44.956,
        radius: 2.3,
    },

    22u8 => Atom {
        number: 22,
        symbol: "Ti",
        weight: 47.867,
        radius: 2.15,
    },

    23u8 => Atom {
        number: 23,
        symbol: "V",
        weight: 50.942,
        radius: 2.05,
    },

    24u8 => Atom {
        number: 24,
        symbol: "Cr",
        weight: 51.996,
        radius: 2.05,
    },

    25u8 => Atom {
        number: 25,
        symbol: "Mn",
        weight: 54.938,
        radius: 2.05,
    },

    26u8 => Atom {
        number: 26,
        symbol: "Fe",
        weight: 55.845,
        radius: 2.05,
    },

    27u8 => Atom {
        number: 27,
        symbol: "Co",
        weight: 58.933,
        radius: 2.0,
    },

    28u8 => Atom {
        number: 28,
        symbol: "Ni",
        weight: 58.693,
        radius: 2.0,
    },

    29u8 => Atom {
        number: 29,
        symbol: "Cu",
        weight: 63.546,
        radius: 2.0,
    },

    30u8 => Atom {
        number: 30,
        symbol: "Zn",
        weight: 65.409,
        radius: 2.1,
    },

    31u8 => Atom {
        number: 31,
        symbol: "Ga",
        weight: 69.723,
        radius: 1.87,
    },

    32u8 => Atom {
        number: 32,
        symbol: "Ge",
        weight: 72.64,
        radius: 2.11,
    },

    33u8 => Atom {
        number: 33,
        symbol: "As",
        weight: 74.922,
        radius: 1.85,
    },

    34u8 => Atom {
        number: 34,
        symbol: "Se",
        weight: 78.96,
        radius: 1.9,
    },

    35u8 => Atom {
        number: 35,
        symbol: "Br",
        weight: 79.904,
        radius: 1.83,
    },

    36u8 => Atom {
        number: 36,
        symbol: "Kr",
        weight: 83.798,
        radius: 2.02,
    },

    37u8 => Atom {
        number: 37,
        symbol: "Rb",
        weight: 85.468,
        radius: 3.03,
    },

    38u8 => Atom {
        number: 38,
        symbol: "Sr",
        weight: 87.62,
        radius: 2.49,
    },

    39u8 => Atom {
        number: 39,
        symbol: "Y",
        weight: 88.906,
        radius: 2.4,
    },

    40u8 => Atom {
        number: 40,
        symbol: "Zr",
        weight: 91.224,
        radius: 2.3,
    },

    41u8 => Atom {
        number: 41,
        symbol: "Nb",
        weight: 92.906,
        radius: 2.15,
    },

    42u8 => Atom {
        number: 42,
        symbol: "Mo",
        weight: 95.94,
        radius: 2.1,
    },

    43u8 => Atom {
        number: 43,
        symbol: "Tc",
        weight: 98.0,
        radius: 2.05,
    },

    44u8 => Atom {
        number: 44,
        symbol: "Ru",
        weight: 101.07,
        radius: 2.05,
    },

    45u8 => Atom {
        number: 45,
        symbol: "Rh",
        weight: 102.905,
        radius: 2.0,
    },

    46u8 => Atom {
        number: 46,
        symbol: "Pd",
        weight: 106.42,
        radius: 2.05,
    },

    47u8 => Atom {
        number: 47,
        symbol: "Ag",
        weight: 107.868,
        radius: 2.1,
    },

    48u8 => Atom {
        number: 48,
        symbol: "Cd",
        weight: 112.411,
        radius: 2.2,
    },

    49u8 => Atom {
        number: 49,
        symbol: "In",
        weight: 114.818,
        radius: 2.2,
    },

    50u8 => Atom {
        number: 50,
        symbol: "Sn",
        weight: 118.71,
        radius: 1.93,
    },

    51u8 => Atom {
        number: 51,
        symbol: "Sb",
        weight: 121.76,
        radius: 2.17,
    },

    52u8 => Atom {
        number: 52,
        symbol: "Te",
        weight: 127.6,
        radius: 2.06,
    },

    53u8 => Atom {
        number: 53,
        symbol: "I",
        weight: 126.904,
        radius: 1.98,
    },

    54u8 => Atom {
        number: 54,
        symbol: "Xe",
        weight: 131.293,
        radius: 2.16,
    },

    55u8 => Atom {
        number: 55,
        symbol: "Cs",
        weight: 132.905,
        radius: 3.43,
    },

    56u8 => Atom {
        number: 56,
        symbol: "Ba",
        weight: 137.327,
        radius: 2.68,
    },

    57u8 => Atom {
        number: 57,
        symbol: "La",
        weight: 138.905,
        radius: 2.5,
    },

    58u8 => Atom {
        number: 58,
        symbol: "Ce",
        weight: 140.116,
        radius: 2.48,
    },

    59u8 => Atom {
        number: 59,
        symbol: "Pr",
        weight: 140.908,
        radius: 2.47,
    },

    60u8 => Atom {
        number: 60,
        symbol: "Nd",
        weight: 144.242,
        radius: 2.45,
    },

    61u8 => Atom {
        number: 61,
        symbol: "Pm",
        weight: 145.0,
        radius: 2.43,
    },

    62u8 => Atom {
        number: 62,
        symbol: "Sm",
        weight: 150.36,
        radius: 2.42,
    },

    63u8 => Atom {
        number: 63,
        symbol: "Eu",
        weight: 151.964,
        radius: 2.4,
    },

    64u8 => Atom {
        number: 64,
        symbol: "Gd",
        weight: 157.25,
        radius: 2.38,
    },

    65u8 => Atom {
        number: 65,
        symbol: "Tb",
        weight: 158.925,
        radius: 2.37,
    },

    66u8 => Atom {
        number: 66,
        symbol: "Dy",
        weight: 162.5,
        radius: 2.35,
    },

    67u8 => Atom {
        number: 67,
        symbol: "Ho",
        weight: 164.930,
        radius: 2.33,
    },

    68u8 => Atom {
        number: 68,
        symbol: "Er",
        weight: 167.259,
        radius: 2.32,
    },

    69u8 => Atom {
        number: 69,
        symbol: "Tm",
        weight: 168.934,
        radius: 2.3,
    },

    70u8 => Atom {
        number: 70,
        symbol: "Yb",
        weight: 173.04,
        radius: 2.28,
    },

    71u8 => Atom {
        number: 71,
        symbol: "Lu",
        weight: 174.967,
        radius: 2.27,
    },

    72u8 => Atom {
        number: 72,
        symbol: "Hf",
        weight: 178.49,
        radius: 2.25,
    },

    73u8 => Atom {
        number: 73,
        symbol: "Ta",
        weight: 180.948,
        radius: 2.2,
    },

    74u8 => Atom {
        number: 74,
        symbol: "W",
        weight: 183.84,
        radius: 2.1,
    },

    75u8 => Atom {
        number: 75,
        symbol: "Re",
        weight: 186.207,
        radius: 2.05,
    },

    76u8 => Atom {
        number: 76,
        symbol: "Os",
        weight: 190.23,
        radius: 2.0,
    },

    77u8 => Atom {
        number: 77,
        symbol: "Ir",
        weight: 192.217,
        radius: 2.0,
    },

    78u8 => Atom {
        number: 78,
        symbol: "Pt",
        weight: 195.084,
        radius: 2.05,
    },

    79u8 => Atom {
        number: 79,
        symbol: "Au",
        weight: 196.967,
        radius: 2.1,
    },

    80u8 => Atom {
        number: 80,
        symbol: "Hg",
        weight: 200.59,
        radius: 2.05,
    },

    81u8 => Atom {
        number: 81,
        symbol: "Tl",
        weight: 204.383,
        radius: 1.96,
    },

    82u8 => Atom {
        number: 82,
        symbol: "Pb",
        weight: 207.2,
        radius: 2.02,
    },

    83u8 => Atom {
        number: 83,
        symbol: "Bi",
        weight: 208.98,
        radius: 2.07,
    },

    84u8 => Atom {
        number: 84,
        symbol: "Po",
        weight: 210.0,
        radius: 1.97,
    },

    85u8 => Atom {
        number: 85,
        symbol: "At",
        weight: 210.0,
        radius: 2.02,
    },

    86u8 => Atom {
        number: 86,
        symbol: "Rn",
        weight: 220.0,
        radius: 2.2,
    },

    87u8 => Atom {
        number: 87,
        symbol: "Fr",
        weight: 223.0,
        radius: 3.48,
    },

    88u8 => Atom {
        number: 88,
        symbol: "Ra",
        weight: 226.0,
        radius: 2.83,
    },

    89u8 => Atom {
        number: 89,
        symbol: "Ac",
        weight: 227.0,
        radius: 2.0,
    },

    90u8 => Atom {
        number: 90,
        symbol: "Th",
        weight: 232.03806,
        radius: 2.4,
    },

    91u8 => Atom {
        number: 91,
        symbol: "Pa",
        weight: 231.03588,
        radius: 2.0,
    },

    92u8 => Atom {
        number: 92,
        symbol: "U",
        weight: 238.02891,
        radius: 2.3,
    },

    93u8 => Atom {
        number: 93,
        symbol: "Np",
        weight: 237.0,
        radius: 2.0,
    },

    94u8 => Atom {
        number: 94,
        symbol: "Pu",
        weight: 244.0,
        radius: 2.0,
    },

    95u8 => Atom {
        number: 95,
        symbol: "Am",
        weight: 243.0,
        radius: 2.0,
    },

    96u8 => Atom {
        number: 96,
        symbol: "Cm",
        weight: 247.0,
        radius: 2.0,
    },

    97u8 => Atom {
        number: 97,
        symbol: "Bk",
        weight: 247.0,
        radius: 2.0,
    },

    98u8 => Atom {
        number: 98,
        symbol: "Cf",
        weight: 251.0,
        radius: 2.0,
    },

    99u8 => Atom {
        number: 99,
        symbol: "Es",
        weight: 252.0,
        radius: 2.0,
    },

    100u8 => Atom {
        number: 100,
        symbol: "Fm",
        weight: 257.0,
        radius: 2.0,
    },

    101u8 => Atom {
        number: 101,
        symbol: "Md",
        weight: 258.0,
        radius: 2.0,
    },

    102u8 => Atom {
        number: 102,
        symbol: "No",
        weight: 259.0,
        radius: 2.0,
    },

    103u8 => Atom {
        number: 103,
        symbol: "Lr",
        weight: 262.0,
        radius: 2.0,
    },

    104u8 => Atom {
        number: 104,
        symbol: "Rf",
        weight: 261.0,
        radius: 2.0,
    },

    105u8 => Atom {
        number: 105,
        symbol: "Db",
        weight: 262.0,
        radius: 2.0,
    },

    106u8 => Atom {
        number: 106,
        symbol: "Sg",
        weight: 266.0,
        radius: 2.0,
    },

    107u8 => Atom {
        number: 107,
        symbol: "Bh",
        weight: 264.0,
        radius: 2.0,
    },

    108u8 => Atom {
        number: 108,
        symbol: "Hs",
        weight: 277.0,
        radius: 2.0,
    },

    109u8 => Atom {
        number: 109,
        symbol: "Mt",
        weight: 268.0,
        radius: 2.0,
    },

    110u8 => Atom {
        number: 110,
        symbol: "Ds",
        weight: 271.0,
        radius: 2.0,
    },

    111u8 => Atom {
        number: 111,
        symbol: "Rg",
        weight: 272.0,
        radius: 2.0,
    },

    112u8 => Atom {
        number: 112,
        symbol: "Cn",
        weight: 277.0,
        radius: 2.0,
    },

    113u8 => Atom {
        number: 113,
        symbol: "Nh",
        weight: 286.0,
        radius: 2.0,
    },

    114u8 => Atom {
        number: 114,
        symbol: "Fl",
        weight: 289.0,
        radius: 2.0,
    },

    115u8 => Atom {
        number: 115,
        symbol: "Mc",
        weight: 288.0,
        radius: 2.0,
    },

    116u8 => Atom {
        number: 116,
        symbol: "Lv",
        weight: 293.0,
        radius: 2.0,
    },

    117u8 => Atom {
        number: 117,
        symbol: "Ts",
        weight: 294.0,
        radius: 2.0,
    },

    118u8 => Atom {
        number: 118,
        symbol: "Og",
        weight: 294.0,
        radius: 2.0,
    },
};

pub static ATOM_SYMBOL_STR: phf::Map<&str, u8> = phf_map! {
    "H"  => 1,
    "He" => 2,
    "Li" => 3,
    "Be" => 4,
    "B"  => 5,
    "C"  => 6,
    "N"  => 7,
    "O"  => 8,
    "F"  => 9,
    "Ne" => 10,
    "Na" => 11,
    "Mg" => 12,
    "Al" => 13,
    "Si" => 14,
    "P"  => 15,
    "S"  => 16,
    "Cl" => 17,
    "Ar" => 18,
    "K"  => 19,
    "Ca" => 20,
    "Sc" => 21,
    "Ti" => 22,
    "V"  => 23,
    "Cr" => 24,
    "Mn" => 25,
    "Fe" => 26,
    "Co" => 27,
    "Ni" => 28,
    "Cu" => 29,
    "Zn" => 30,
    "Ga" => 31,
    "Ge" => 32,
    "As" => 33,
    "Se" => 34,
    "Br" => 35,
    "Kr" => 36,
    "Rb" => 37,
    "Sr" => 38,
    "Y"  => 39,
    "Zr" => 40,
    "Nb" => 41,
    "Mo" => 42,
    "Tc" => 43,
    "Ru" => 44,
    "Rh" => 45,
    "Pd" => 46,
    "Ag" => 47,
    "Cd" => 48,
    "In" => 49,
    "Sn" => 50,
    "Sb" => 51,
    "Te" => 52,
    "I"  => 53,
    "Xe" => 54,
    "Cs" => 55,
    "Ba" => 56,
    "La" => 57,
    "Ce" => 58,
    "Pr" => 59,
    "Nd" => 60,
    "Pm" => 61,
    "Sm" => 62,
    "Eu" => 63,
    "Gd" => 64,
    "Tb" => 65,
    "Dy" => 66,
    "Ho" => 67,
    "Er" => 68,
    "Tm" => 69,
    "Yb" => 70,
    "Lu" => 71,
    "Hf" => 72,
    "Ta" => 73,
    "W"  => 74,
    "Re" => 75,
    "Os" => 76,
    "Ir" => 77,
    "Pt" => 78,
    "Au" => 79,
    "Hg" => 80,
    "Tl" => 81,
    "Pb" => 82,
    "Bi" => 83,
    "Po" => 84,
    "At" => 85,
    "Rn" => 86,
    "Fr" => 87,
    "Ra" => 88,
    "Ac" => 89,
    "Th" => 90,
    "Pa" => 91,
    "U"  => 92,
    "Np" => 93,
    "Pu" => 94,
    "Am" => 95,
    "Cm" => 96,
    "Bk" => 97,
    "Cf" => 98,
    "Es" => 99,
    "Fm" => 100,
    "Md" => 101,
    "No" => 102,
    "Lr" => 103,
    "Rf" => 104,
    "Db" => 105,
    "Sg" => 106,
    "Bh" => 107,
    "Hs" => 108,
    "Mt" => 109,
    "Ds" => 110,
    "Rg" => 111,
    "Cn" => 112,
    "Nh" => 113,
    "Fl" => 114,
    "Mc" => 115,
    "Lv" => 116,
    "Ts" => 117,
    "Og" => 118,
};

/// For future implementation.
///
/// pub static ENERGY_LEVELS: phf::Map<&str, u8> = phf_map! {
///     "1s" => 1,
///     "2s" => 2,
///     "2p" => 6,
///     "3s" => 2,
///     "3p" => 6,
///     "4s" => 2,
///     "3d" => 10,
///     "4p" => 6,
///     "5s" => 2,
///     "4d" => 10,
///     "5p" => 6,
///     "6s" => 2,
///     "4f" => 14,
///     "5d" => 10,
///     "6p" => 6,
///     "7s" => 2,
///     "5f" => 14,
///     "6d" => 10,
///     "7p" => 6,
/// };

impl<'a> Atom<'a> {
    pub fn from(str: &str) -> Result<Atom<'a>, String> {
        let valid_key = ATOM_SYMBOL_STR.get(str).copied().unwrap_or(0);
        if valid_key == 0 {
            return Err(format!("Ivalid atom symbol: \"{}\".", str));
        }

        Ok(Atom {
            ..CONSTANTS[&valid_key]
        })
    }

    pub fn from_number(num: u8) -> Result<Atom<'a>, String> {
        if num < 1 || num > 118 {
            return Err(format!("Invalid atomic number range: \"{}\".", num));
        }

        Ok(Atom { ..CONSTANTS[&num] })
    }
}
