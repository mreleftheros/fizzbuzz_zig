const std = @import("std");

pub fn main() !void {
    const stdout_w = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_w);
    const stdout = bw.writer();

    try stdout.print("Hello {s}\n", .{"world"});

    var i: u8 = 0;

    while (i <= 100) : (i += 1) {
        if (i % 3 == 0 and i % 5 == 0) {
            try stdout.print("FizzBuzz\n", .{});
        } else if (i % 3 == 0) {
            try stdout.print("Fizz\n", .{});
        } else if (i % 5 == 0) {
            try stdout.print("Buzz\n", .{});
        } else {
            try stdout.print("{d}\n", .{i});
        }
    }

    try bw.flush();
}
