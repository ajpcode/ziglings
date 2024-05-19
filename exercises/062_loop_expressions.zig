//
// provided for you, which will evaluate to the void type, which
// is probably not what you want. So consider the else clause
// essential when using loops as expressions.
//
//     const four: u8 = while (true) {
//         break 4;
//     };               // <-- ERROR! Implicit 'else void' here!
//
// With that in mind, see if you can fix the problem with this
// program.
//
const print = @import("std").debug.print;

pub fn main() void {
    const langs: [6][]const u8 = .{
        "Erlang",
        "Algol",
        "C",
        "OCaml",
        "Zig",
        "Prolog",
    };

    // Let's find the first language with a three-letter name and
    // return it from the for loop.
    const current_lang: ?[]const u8 = for (langs) |lang| {
        if (lang.len == 3) break lang;
    } else null;

    if (current_lang) |cl| {
        print("Current language: {s}\n", .{cl});
    } else {
        print("Did not find a three-letter language name. :-(\n", .{});
    }
}
