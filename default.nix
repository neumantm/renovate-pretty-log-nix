{stdenv, lib,
buildGoModule, fetchFromGitLab,
system,
...}:

buildGoModule rec {
  pname = "renovate-pretty-log";
  version = "0.8.1"; # renovate: datasource=gitlab-tags depName=tanna.dev/renovate-pretty-log

  src = fetchFromGitLab {
    owner = "tanna.dev";
    repo = "renovate-pretty-log";
    rev = "v${version}";
    hash = "sha256-DnkQOuT27nn3trgPr5NMFiWNQHKvypKFTcppfIe7AN0=";
  };

  vendorHash = "sha256-/tXw5Fmg9dnBGBix+GWjZKT8/jm10F8QU1X89o5QumA=";

  # debug.ReadBuildInfo does not provide version information in buildGoModule.
  postPatch = ''
    substituteInPlace cmd/renovate-pretty-log/html.go \
      --replace-fail 'report.Version = toolVersion()' 'report.Version = "v${version}"'
  '';

  subPackages = [
    "cmd/renovate-pretty-log"
    "cmd/renovate-pretty-log-tui"
    "cmd/renovate-text-to-json"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [ "-s" "-w" ];

  meta = with lib; {
    description = "Two utilities for exploring Renovate debug log files.";
    homepage = "https://gitlab.com/tanna.dev/renovate-pretty-log";
    license = licenses.asl20;
    platforms = with platforms; [ system ];
    sourceProvenance = with sourceTypes; [ fromSource ];
    mainProgram = "renovate-pretty-log";
  };
}
