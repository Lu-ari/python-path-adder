# python-path-adder
Bu PowerShell betiği, mevcut Python sürümünü tespit ederek, Python ve Python Scripts dizinlerini otomatik olarak sistem Path ortam değişkenlerine ekler. Python sürümünü doğru bir şekilde algılar ve hem major hem de minor sürüm numaralarını kullanarak doğru klasör yollarını oluşturur.

# Python Path Adder

This PowerShell script automatically detects the installed Python version, and adds both the Python and Scripts directories to the system's environment `Path`. It correctly handles the major and minor version numbers to generate the appropriate folder path.

## Features
- Automatically detects Python version (e.g., 3.12.4).
- Adds Python and Scripts directories to the system's `Path`.
- Only adds paths if they don't already exist in the environment variables.
- User-friendly, requires only the username input.

## Requirements
- Windows operating system
- Python installed and accessible via the command line
- PowerShell

## How It Works

1. The script uses the `python --version` command to retrieve the Python version.
2. It constructs the path based on the user's input and the detected Python version (e.g., `C:\Users\YourUsername\AppData\Local\Programs\Python\Python312\`).
3. The script then adds this path and the corresponding `Scripts` folder to the system `Path` environment variable.
4. If the paths already exist, it will not add duplicates.

## Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/<your-username>/python-path-adder.git
    ```

2. Open PowerShell as an Administrator.

3. Navigate to the directory where the script is located:
    ```bash
    cd path\to\python-path-adder
    ```

4. Run the script:
    ```bash
    ./python-path-adder.ps1
    ```

5. You will be prompted to enter your username (the one used for your Windows user directory). The script will automatically detect your Python version and add the appropriate paths to the environment variables.

## Example

For a user named `JohnDoe` with Python version `3.12.4` installed, the script will add the following paths to the environment variables:

- `C:\Users\JohnDoe\AppData\Local\Programs\Python\Python312\`
- `C:\Users\JohnDoe\AppData\Local\Programs\Python\Python312\Scripts\`

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
