tfenv what is in terraform

tfenv is a Terraform version manager that allows you to easily manage and switch between multiple versions of Terraform on your local machine. 
This is useful for situations where you may need to work on different projects that require different versions of Terraform. It simplifies the process of switching between versions, ensuring compatibility with different configurations and environments.

Key Features of tfenv:

Install multiple Terraform versions: You can easily install different versions of Terraform and switch between them based on the needs of your project.
Set a global or local version: You can set a default Terraform version globally (for all projects) or locally (for a specific project directory).
Automatic version selection: tfenv will automatically use the appropriate Terraform version based on the version specified in your project directory, making it easier to handle different versions across multiple projects.
Support for different providers: tfenv supports multiple providers for Terraform, such as the HashiCorp provider, and allows for installation of both stable and pre-release versions.

tfenv --version

tfenv list-remote

tfenv install latest

tfenv install <version>

tfenv install 1.0.0
3. Switch Between Versions
You can use tfenv to switch between different installed versions of Terraform:
tfenv use <version>
For example, to use version 1.0.0:
tfenv use 1.0.0
