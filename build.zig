const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("diffz", .{
        .root_source_file = b.path("DiffMatchPatch.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Run tests
    const tests = b.addTest(.{
        .name = "tests",
        .root_source_file = b.path("DiffMatchPatch.zig"),
        .target = target,
        .optimize = optimize,
    });
    const step_tests = b.addRunArtifact(tests);

    b.step("test", "Run diffz tests").dependOn(&step_tests.step);
}
