# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "tomtom/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
}:
let
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
in let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    tomtom = rustPackages.unknown.tomtom."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.12.3" = overridableMkRustCrate (profileName: rec {
    name = "hashbrown";
    version = "0.12.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"; };
    features = builtins.concatLists [
      [ "raw" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".indexmap."1.9.2" = overridableMkRustCrate (profileName: rec {
    name = "indexmap";
    version = "1.9.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"; };
    features = builtins.concatLists [
      [ "std" ]
    ];
    dependencies = {
      hashbrown = rustPackages."registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.12.3" { inherit profileName; };
    };
    buildDependencies = {
      autocfg = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.1.0" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".kstring."2.0.0" = overridableMkRustCrate (profileName: rec {
    name = "kstring";
    version = "2.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ec3066350882a1cd6d950d055997f379ac37fd39f81cd4d8ed186032eb3c5747"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "max_inline" ]
      [ "std" ]
      [ "unsafe" ]
    ];
    dependencies = {
      static_assertions = rustPackages."registry+https://github.com/rust-lang/crates.io-index".static_assertions."1.1.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" = overridableMkRustCrate (profileName: rec {
    name = "memchr";
    version = "2.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"; };
    features = builtins.concatLists [
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".minimal-lexical."0.2.1" = overridableMkRustCrate (profileName: rec {
    name = "minimal-lexical";
    version = "0.2.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"; };
    features = builtins.concatLists [
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".nom."7.1.3" = overridableMkRustCrate (profileName: rec {
    name = "nom";
    version = "7.1.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"; };
    features = builtins.concatLists [
      [ "alloc" ]
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      memchr = rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" { inherit profileName; };
      minimal_lexical = rustPackages."registry+https://github.com/rust-lang/crates.io-index".minimal-lexical."0.2.1" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".static_assertions."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "static_assertions";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".toml_datetime."0.6.1" = overridableMkRustCrate (profileName: rec {
    name = "toml_datetime";
    version = "0.6.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".toml_edit."0.19.7" = overridableMkRustCrate (profileName: rec {
    name = "toml_edit";
    version = "0.19.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "dc18466501acd8ac6a3f615dd29a3438f8ca6bb3b19537138b3106e575621274"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "perf" ]
    ];
    dependencies = {
      indexmap = rustPackages."registry+https://github.com/rust-lang/crates.io-index".indexmap."1.9.2" { inherit profileName; };
      kstring = rustPackages."registry+https://github.com/rust-lang/crates.io-index".kstring."2.0.0" { inherit profileName; };
      toml_datetime = rustPackages."registry+https://github.com/rust-lang/crates.io-index".toml_datetime."0.6.1" { inherit profileName; };
      winnow = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winnow."0.3.6" { inherit profileName; };
    };
  });
  
  "unknown".tomtom."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "tomtom";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      nom = rustPackages."registry+https://github.com/rust-lang/crates.io-index".nom."7.1.3" { inherit profileName; };
      toml_edit = rustPackages."registry+https://github.com/rust-lang/crates.io-index".toml_edit."0.19.7" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winnow."0.3.6" = overridableMkRustCrate (profileName: rec {
    name = "winnow";
    version = "0.3.6";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "23d020b441f92996c80d94ae9166e8501e59c7bb56121189dc9eab3bd8216966"; };
    features = builtins.concatLists [
      [ "alloc" ]
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      memchr = rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.5.0" { inherit profileName; };
    };
  });
  
}