const std = @import("std");

pub fn main() !void {
    const stdout_w = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_w);
    const stdout = bw.writer();

    try stdout.print("Hello {s}\n", .{"world"});

    try bw.flush();
}
