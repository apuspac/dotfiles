Write-Host "📦 Installing packages for Windows..."

$packages = @(
    "Git.Git",
)


foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget install --id $package --silent --accept-source-agreements --accept-package-agreements
}

# Rust
if (!(Get-Command rustc -ErrorAction SilentlyContinue)) {
    Write-Host "🦀 Installing Rust..."
    Invoke-WebRequest -Uri "https://win.rustup.rs" -OutFile "$env:TEMP\rustup-init.exe"
    Start-Process -FilePath "$env:TEMP\rustup-init.exe" -ArgumentList "-y" -Wait
    Remove-Item "$env:TEMP\rustup-init.exe"
}

Write-Host "✅ Package installation complete"
