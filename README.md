# Unlock-PDF

Batch unlock PDFs whose author forbid copying.
This script does not decrypt fully-encrypted PDFs which you can't read at all without the correct password.

## Usage

Install dependency:

```
%brew install qpdf
```

Put all the PDFs you want to decrypt in a folder called `{input-dir}`

```
./unlock-pdf.sh {input-dir}
```

## How?

Key command

```
%qpdf --decrypt 2008S1.pdf 2008S1-dec-by-qpdf.pdf
```

plus some shell scripting that makes the whole thing work.
