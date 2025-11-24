# VL Project Template

A template for VL projects, using a batch file opening a specific vvvv and NuGet environment.
Set up for more complex and scalable projects with multiple collaborators.

## Environment

Every project contains a main VL file `NewProject.vl` and the main entry point `NewProject.bat`.

The batch file will set up the environment in vvvv specifically for the project, including the right vvvv version and the NuGet path inside of the project, and eventually open `NewProject.vl`. Therefore it is the file that should be opened everytime one is working on the project. 

Doing so, vvvv will make sure that NuGets are always loaded from the project repository. Loading and storing them within the scope of a project from this folder will make sure that everybody working on the project uses the same NuGets and their versions.

If the specific vvvv version can not be found on your computer, you need to download and install it manually. Feel free to change the vvvv version in the batch file, if the project requires a different version. Just make sure that everybody working on the project is informed about this step and downloads the right version of vvvv.

Additionally, the `vvvv.bat` file can be used to set the environment without opening a default project file.

## Structure

The template also contains some standard folders `assets` `nugets` `rnd` `vl` and an empty placeholder file inside of each if it is empty, so that it gets picked up by Git. The placeholder file can be safely deleted, also the folder itself if it is not to be used within the project.

- `assets` should contain any files like images, videos, fonts that will be picked up and used by the VL application, and are not managed by an external asset provider. You might consider to organize assets by their type, so feel free to create sub folders like `images` `videos` `fonts`.
- `nugets` is the place where all NuGet dependencies will be saved and that is specified as the NuGet override folder in the batch file.
- `rnd` should be used to save research and tests patches that were developed in the scope of a project and/or showcase several possible solutions, but are not part of the project itself. Just make sure that these files are also opened in the same version and that they are using the custom NuGet folder as the rest of the project.
- `vl` contains VL file dependencies that are referenced and used by the project.

### Setting up a new VL project

After creating a new repository based on this template, you need to manually change the name of both the main VL file and the batch file to the name of the project. Also make sure to change the name of the main entry file inside of the batch file!

## Advanced techniques

### VL file dependencies

When working on a project, it might grow and get more complex, so it would make sense to split it into more file dependencies, that are picked up by the project. A file dependency in general is just a VL file containing definitions that can be used in the main project when setting a reference to the dependency.

It is generally good practice to only store definitions like classes, records and process nodes inside file dependencies and not in the main VL file. The main VL file on the other hand does only call these operations on the application side, but does not store any definitions itself. Like that, we ensure modularity and exchangeability, and also open up for other contributors to projects. 

https://thegraybook.vvvv.org/reference/best-practice/version-control.html#version-control-with-git

### Package repositores / Git submodules

In case your project needs to use a VL library from source (often the case when using a fork of VL.Fuse in a project), please add them to a folder called `package-repositories` inside of your project and include it in the batch file. Don’t forget to add the libraries to the `--editable-packages` flag, otherwise they will be pre-compiled in your project. Afterwards use a Git client that supports submodules.

```jsx
taskkill /f /im vvvv.exe
timeout 3
start "" "C:\Program Files\vvvv\vvvv_gamma_7.0-win-x64\vvvv.exe" --nuget-path "%~dp0nugets" --package-repositories "%~dp0package-repositories" --editable-packages VL.Fuse --open "%~dp0NewProject.vl"
exit
```
