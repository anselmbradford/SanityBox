# Installation instructions

  1. **Install VirtualBox for OS X**, which can be [downloaded](https://www.virtualbox.org/wiki/Downloads) from the VirtualBox site.
  2. **Install Vagrant**, which can be [downloaded](http://www.vagrantup.com/downloads.html) from the Vagrant site, which also provides [step-by-step installation instructions](http://docs.vagrantup.com/v2/getting-started/index.html).
  3. **Build the virtual machine** In the directory you want to work in, enter the following:

    ```bash
    $ git clone https://github.com/anselmbradford/sanity-box
    $ cd sanity-box
    $ vagrant up
     ```
    If the base box is not present, Vagrant downloads it first.
    Installation can take several minutes to complete.
