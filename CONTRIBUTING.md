# Contributing to Chainspecs Repository

Thank you for contributing to the Chainspecs repository! Here's how you can add new chainspecs:

### Adding a New Chainspec

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/paritytech/chainspecs.git
   cd chainspecs
   ```

2. **Add the Submodule:**
   Add the new chainspec repository as a submodule inside the `submodules` directory:
   ```bash
   git submodule add https://github.com/example-network/example-parachain.git submodules/example
   ```

3. **Create Chainspec Directory:**
   Create a directory structure to store the chainspec JSON file. For example, if adding a chainspec for Kusama:
   ```bash
   mkdir kusama/parachain/example
   ```

4. **Symlink Chainspec JSON:**
   Create a symbolic link (`chainspec.json`) to the actual chainspec JSON file from the submodule:
   ```bash
   cd kusama/parachain/example
   ln -s ../../../submodules/example/resources/example/example-raw.json chainspec.json
   ```

5. **Update README:**
   Update the `README.md` file to include a link to the newly added chainspec. For example:
   ```markdown
   - [Example Chainspec](kusama/parachain/example/chainspec.json)
   ```

6. **Commit and Push:**
   Commit your changes and push to your fork or branch:
   ```bash
   git add .
   git commit -m "Add Example chainspec for Kusama"
   git push origin main
   ```

7. **Submit Pull Request:**
   Finally, submit a pull request to the `paritytech/chainspecs` repository with a clear description of the chainspec you've added.

### Guidelines for Chainspecs

- Ensure the chainspec JSON file is correctly symlinked and accessible.
- Verify that the chainspec follows the formatting and standards used by other chainspecs in this repository.
- Provide a brief description of the chainspec and its purpose in the `README.md` file.

Thank you for your contribution!
