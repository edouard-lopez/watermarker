# Watermarker

Tiny `watermarker` script working recursively so you can easily add text and image watermark on your photos.

## Image watermark

This script need **at least** a file called `watermark.png`, that will be stamped onto the support image.

**N.B.:** `PNG` is the only type supported.

## Text watermark

If you want to add watermark text, you can either:

1. put your text into `watermark.txt` ;
2. pass it to the program:

```
bash ./watermark.bash "© under creative-common sample"
```

## Installation

    git clone git@github.com:edouard-lopez/watermarker.git

## Usage
1. **Place** your original photos in the `original/` directory (using symlink is ok) ;
2. **Replace** the `watermark.png` by your watermark image ;
3. **Edit** `watermark.txt` to your copyright text ;
4. **Run** the script:

```bash
bash ./watermark.bash
```
Result images are in `output/` directory, the _original directory structure is preserved_.

## Tweaking

Read the code

## License

[The MIT License (MIT)](http://opensource.org/licenses/MIT)
