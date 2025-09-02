load("@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl", "tool_path")


def _impl(ctx):
  tool_paths = [
    tool_path(
      name = "gcc",
      path = "/usr/bin/gcc",
    ),
    tool_path(
      name = "ld",
      path = "/usr/bin/ld",
    ),
    tool_path(
      name = "ar",
      path = "/usr/bin/ar",
    ),
    tool_path(
      name = "cpp",
      path = "/bin/false",
    ),
    tool_path(
      name = "gcov",
      path = "/bin/false",
    ),
    tool_path(
      name = "nm",
      path = "/bin/false",
    ),
    tool_path(
      name = "objdump",
      path = "/bin/false",
    ),
    tool_path(
      name = "strip",
      path = "/bin/false",
    ),
   ]

  return cc_common.create_cc_toolchain_config_info(
    ctx = ctx,
    cxx_builtin_include_directories = [
      "/usr/include",
      "/usr/lib/gcc/x86_64-redhat-linux/15/include/stddef.h",
      "/usr/lib/gcc/x86_64-redhat-linux/15/include/"
    ],
    toolchain_identifier = "k8-toolchain",
    host_system_name = "local",
    target_system_name = "local",
    target_cpu = "k8",
    target_libc = "unknown",
    compiler = "gcc",
    abi_version = "unknown",
    abi_libc_version = "unknown",
    tool_paths = tool_paths,
  )


odrazel_toolchain_config_gcc_ext_new = rule(
  implementation = _impl,
  attrs = {},
  provides = [CcToolchainConfigInfo]
)
