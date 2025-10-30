{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.pkgsCross.riscv64-embedded.buildPackages.gcc
    pkgs.pkgsCross.riscv64-embedded.buildPackages.binutils
    pkgs.qemu
    pkgs.pkgsCross.riscv64-embedded.buildPackages.gdb
  ];

  shellHook = ''
    export PATH=${pkgs.pkgsCross.riscv64-embedded.buildPackages.gcc}/bin:${pkgs.pkgsCross.riscv64-embedded.buildPackages.binutils}/bin:${pkgs.pkgsCross.riscv64-embedded.buildPackages.gdb}/bin:$PATH
    export TOOLPREFIX=riscv64-none-elf-
    function run-gdb () {
        ${TOOLPREFIX}gdb
    }
  '';
}
