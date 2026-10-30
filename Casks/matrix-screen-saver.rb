cask "matrix-screen-saver" do
  version "0.4.3"
  sha256 "2df334c9df8ac4d96aa6ee02567c11ebe15d388efc53b3eb4dfb9691afe416e4"

  url "https://github.com/patrickschaper/matrixScreenSaver/releases/download/#{version}/#{version}.zip"
  name "MatrixScreenSaver"
  desc "Native terminal-style Matrix screen saver and wallpaper"
  homepage "https://github.com/patrickschaper/matrixScreenSaver"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "MatrixWallpaper.app"
  screen_saver "MatrixScreenSaver.saver"

  preflight_steps do
    if_path_exists "MatrixScreenSaver.saver", base: :screen_saverdir do
      # Homebrew also grants read access here when the native target is under HOME.
      run "/bin/echo",
          args:           ["Existing screen saver in Homebrew's configured screen-saver directory. " \
                           "To replace it while retaining options, run: " \
                           "brew install --cask --force patrickschaper/tap/matrix-screen-saver"],
          print_stdout:   true,
          writable_paths: [{ path: "MatrixScreenSaver.saver", base: :screen_saverdir }]
    end

    if_path_exists "MatrixWallpaper.app", base: :appdir do
      run "/bin/echo",
          args:           ["Existing app at {{appdir}}/MatrixWallpaper.app. " \
                           "To replace it while retaining options, run: " \
                           "brew install --cask --force patrickschaper/tap/matrix-screen-saver"],
          print_stdout:   true,
          writable_paths: [{ path: "MatrixWallpaper.app", base: :appdir }]
    end

    run "/bin/echo",
        args:         ["Removing staged quarantine bypasses Gatekeeper quarantine checks; " \
                       "this does not make either bundle notarized or Apple-approved."],
        print_stdout: true
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{staged_path}}/MatrixScreenSaver.saver"],
        writable_paths: ["{{staged_path}}/MatrixScreenSaver.saver"]
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{staged_path}}/MatrixWallpaper.app"],
        writable_paths: ["{{staged_path}}/MatrixWallpaper.app"]
  end

  postflight_steps do
    run "/bin/echo",
        args:         ["There is no spoon. There is coffee: https://www.buymeacoffee.com/yesman82"],
        print_stdout: true
    run "/bin/echo",
        args:         ["Open System Settings > Wallpaper > Screen Saver and select MatrixScreenSaver."],
        print_stdout: true
    run "/bin/echo",
        args:         ["Open {{appdir}}/MatrixWallpaper.app to start Matrix Wallpaper. " \
                       "Launch at Login is optional in its Matrix menu."],
        print_stdout: true
  end

  uninstall quit: "dev.patsch.MatrixWallpaper", login_item: "Matrix Wallpaper"
end
