# ComfySharp Monorepo

This repository contains all ComfySharp-related projects managed as Git submodules. Each project maintains its own independent version control while being part of this unified development environment.

## 🏗️ Project Structure

- **ComfySharp** - Core ComfySharp library for ComfyUI workflow management
- **ComfySharp.Extensions** - Basic extensions and node implementations
- **ComfySharp.Extensions.EasyUse** - Easy-to-use high-level extensions
- **ComfySharp.Extensions.Nunchaku** - Nunchaku-specific extensions and nodes
- **ComfySharp.Extensions.ReActor** - ReActor-specific extensions and nodes

## 🚀 Getting Started

### Initial Setup

```bash
# Clone the repository with all submodules
git clone --recursive <repository-url>

# Or if you already have the repository
git submodule update --init --recursive
```

### Development Workflow

```bash
# Update all submodules to latest
git submodule update --remote

# Update a specific submodule
git submodule update --remote ComfySharp

# Work in a submodule
cd ComfySharp
# Make changes, commit, push
git add .
git commit -m "Your changes"
git push
cd ..
git add ComfySharp
git commit -m "Update ComfySharp to latest"
```

## 🔧 Building

Use the provided build scripts to build all packages:

### Windows
```cmd
build-packages.bat
```

### PowerShell
```powershell
.\build-packages.ps1
```

### Unix/Linux
```bash
./build-packages.sh
```

## 📦 Package Management

The build process creates NuGet packages in the `packages/` directory:
- `ComfySharp.1.0.0.nupkg`
- `ComfySharp.Extensions.1.0.0.nupkg`
- `ComfySharp.Extensions.EasyUse.1.0.0.nupkg`
- `ComfySharp.Extensions.Nunchaku.1.0.0.nupkg`
- `ComfySharp.Extensions.ReActor.1.0.0.nupkg`

## 🛠️ Development

### Working with Submodules

Each project is a Git submodule, which means:

1. **Independent Development**: Each project can be developed independently
2. **Version Control**: Each project has its own version history
3. **Selective Updates**: You can update individual projects without affecting others
4. **Clean Separation**: Clear boundaries between different components

### Common Commands

```bash
# Check submodule status
git submodule status

# Update all submodules to their latest commits
git submodule update --remote

# Update a specific submodule
git submodule update --remote ComfySharp

# Work in a submodule (make changes, commit, push)
cd ComfySharp
git checkout -b feature/new-feature
# ... make changes ...
git add .
git commit -m "Add new feature"
git push origin feature/new-feature
cd ..

# Update the main repository to point to the new submodule commit
git add ComfySharp
git commit -m "Update ComfySharp to latest"
```

### Adding New Submodules

```bash
# Add a new project as a submodule
git submodule add <repository-url> <local-path>

# Example:
git submodule add https://github.com/your-org/ComfySharp.NewExtension.git ComfySharp.Extensions.NewExtension
```

## 🧪 Testing

Each project contains its own test suite and example projects. Run tests for a specific project:

```bash
# Run unit tests
cd ComfySharp.Extensions.Tests
dotnet test

# Run examples
cd ComfySharp.Extensions.Examples
dotnet run
```

## 📚 Examples

Each project includes comprehensive example projects demonstrating usage:

- **ComfySharp.Example** - Core library examples
- **ComfySharp.ClientApi.Example** - API client examples  
- **ComfySharp.Extensions.Examples** - Extension node examples
- **ComfySharp.Extensions.EasyUse.Examples** - EasyUse node examples
- **ComfySharp.Extensions.Nunchaku.Examples** - Nunchaku node examples
- **ComfySharp.Extensions.ReActor.Examples** - ReActor node examples

## 📋 Requirements

- .NET 6.0 or later
- Git with submodule support
- Visual Studio 2022 or VS Code (recommended)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test your changes
5. Submit a pull request

### Development Guidelines

- Each project should be self-contained
- Use semantic versioning for releases
- Keep documentation up to date
- Write tests for new features

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Related Projects

- [ComfyUI](https://github.com/comfyanonymous/ComfyUI) - The original ComfyUI project
- [ComfyUI Manager](https://github.com/ltdrdata/ComfyUI-Manager) - Extension manager for ComfyUI

## 📞 Support

For questions and support, please open an issue in the appropriate project repository or the main repository.