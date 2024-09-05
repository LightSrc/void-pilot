const std = @import("std");
const heap = std.heap;
const mem = std.mem;

const log = std.log.scoped(.main);

var gpa = heap.GeneralPurposeAllocator(.{}){};
pub const alloc = gpa.allocator();
var event_arena = heap.ArenaAllocator.init(alloc);
pub const event_alloc = event_arena.allocator();

pub fn init() !void {
    defer if (gpa.detectLeaks()) log.err("Memory leak detected!", .{});
    defer event_arena.deinit();
}
