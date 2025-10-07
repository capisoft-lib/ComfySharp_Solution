# Contributing to ComfySharp

Thank you for your interest in contributing to ComfySharp! This document provides guidelines and information for contributors.

## Getting Started

### Prerequisites

- .NET 8.0 SDK or later
- Visual Studio 2022 or VS Code (recommended)
- Git

### Setting Up the Development Environment

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/yourusername/ComfySharp.git
   cd ComfySharp
   ```

3. Build the solution:
   ```bash
   dotnet build
   ```

4. Run the tests:
   ```bash
   dotnet run --project ComfySharp.Extensions.Tests
   ```

## Development Guidelines

### Project Structure

```
ComfySharp/
├── ComfySharp/                    # Core library
├── ComfySharp.Extensions/         # Extensions library
├── ComfySharp.Extensions.Tests/    # Test project
├── ComfySharp.sln                # Solution file
├── README.md
├── LICENSE
└── CONTRIBUTING.md
```

### Adding New Features

1. **Core Library Changes**: Add new functionality to the `ComfySharp` project
2. **Extension Methods**: Add strongly-typed nodes to the `ComfySharp.Extensions` project
3. **Tests**: Update the test project to demonstrate new features

### Adding New Node Types

To add support for a new ComfyUI node type:

1. Create a new class in `ComfySharp.Extensions/`:

```csharp
public class MyNodeType : BaseNodeType
{
    public MyNodeType(ComfyNode node, string id) : base(node, id) { }
    
    // Add strongly-typed properties
    public string MyProperty
    {
        get => GetInput("my_property", "default");
        set => SetInput("my_property", value);
    }
}
```

2. **Automatic Discovery**: The system automatically discovers your node type! No manual mapping needed.

   - **Naming Convention**: If your class is named `MyNodeType`, it will automatically map to `"MyNode"` (removes "Node" suffix)
   - **Explicit Mapping**: Use the `[ComfyNodeClass("ExactComfyUIType")]` attribute for custom mapping:

```csharp
[ComfyNodeClass("MyCustomComfyUIType")]
public class MyNodeType : BaseNodeType
{
    // Implementation
}
```

3. Add tests to demonstrate the new node type

**That's it!** The automated discovery system handles the rest. No manual mapping required! 🎉

### Testing

- All new features should be demonstrated in the test project
- Test both basic functionality and edge cases
- Ensure the code works with real ComfyUI workflows

### Documentation

- Update README.md for new features
- Add XML documentation for public APIs
- Include usage examples

## Submitting Changes

### Pull Request Process

1. Create a feature branch from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit them:
   ```bash
   git add .
   git commit -m "Add your feature description"
   ```

3. Push your branch:
   ```bash
   git push origin feature/your-feature-name
   ```

4. Create a Pull Request on GitHub

### Commit Message Format

Use clear, descriptive commit messages:

- `Add KSamplerNode strongly-typed implementation`
- `Fix file path resolution for Visual Studio`
- `Update README with new examples`
- `Add support for CLIPTextEncode node type`

### Pull Request Guidelines

- Provide a clear description of what the PR does
- Include screenshots or examples if applicable
- Reference any related issues
- Ensure all tests pass
- Update documentation as needed

## Issue Reporting

When reporting issues, please include:

- Description of the problem
- Steps to reproduce
- Expected behavior
- Actual behavior
- Environment details (.NET version, OS, etc.)
- Sample code or workflow files if applicable

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow the golden rule

## Questions?

If you have questions about contributing:

1. Check existing issues and discussions
2. Create a new issue with the "question" label
3. Join community discussions

Thank you for contributing to ComfySharp! 🚀
