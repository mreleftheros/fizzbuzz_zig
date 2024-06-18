const std = @import("std");

pub fn main() !void {
    const stdout_w = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_w);
    const stdout = bw.writer();

    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 2) {
        return error.NotEnoughArguments;
    }

    const max = try std.fmt.parseUnsigned(usize, args[1], 10);

    var i: u8 = 0;

    while (i <= max) : (i += 1) {
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
