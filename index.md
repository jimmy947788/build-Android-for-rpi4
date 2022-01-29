# Build AOSP  for RPi4

使用[`AOSP`](https://source.android.com/setup/build/downloading) (_Android Open  Source Project_)原始碼來編譯出給Raspberry Pi能安裝的Android系統。

## Android 
### Initializing a Repo client
1. Create working directry for Android Source
    ``` bash
    mkdir {WORKDIR}
    cd {WORKDIR}
    ```
2. Configure Git with your real name and email address. To use the Gerrit code-review tool, you need an email address.
    ```bash
    git config --global user.name {YOUR_NAME}
    git config --global user.email {YOUR_EMAIL}
    ```
3. Run repo init to get the latest version of Repo with its most recent bug fixes
    ```bash 
    repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r47
    ```
    >To check out a branch other than master, specify it with -b. For a list of branches, see [Source code tags and builds](https://source.android.com/setup/start/build-numbers#source-code-tags-and-builds).
4. Download RPi4 project list for Android source code
    ```bash
    git clone https://github.com/jimmy9478/arpi_loacl_manifests.git .repo/local_manifests -b arpi-10
    ```
5. Downloading the Android source tree 
    ```bash
    repo sync -c -j$(nproc --all)
    ```
    > To speed syncs, pass the -c (current branch) and -j `threadcount` flags.

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/jimmy9478/build-Android-for-rpi4/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
