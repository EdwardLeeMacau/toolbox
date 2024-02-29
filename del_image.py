"""
del_image.py

This script removes images and pages from a PDF file using PyMuPDF.
"""

import argparse
import logging
import sys
from pathlib import Path
from typing import Iterable

try:
    import fitz  # PyMuPDF
    print(fitz.__doc__)
except ImportError:
    print('PyMuPDF is not installed. Please install it using "pip install pymupdf"')
    sys.exit(1)


# Initialize the logger, default log level: INFO, logged to console
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
formatter = logging.Formatter('%(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)



def human_readable_size(size: int) -> str:
    """
    Convert the file size to a human-readable format

    Arguments
    ---------
    size : int
        The file size in bytes

    Returns
    -------
    str
        The file size in a human-readable format
    """
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size < 1024.0:
            return f'{size:.2f} {unit}'
        size /= 1024.0
    return f'{size:.2f} TB'

def remove_images(
        doc: fitz.Document
    ) -> fitz.Document:
    """
    Remove all images from the PDF file

    Arguments
    ---------
    doc : fitz.Document
        The input PDF document

    Returns
    -------
    fitz.Document
        The modified PDF document
    """
    for page in doc:
        for img in page.get_images(full=True):
            xref = img[0]            # xref is the reference number of the image
            page.clean_contents()    # Clean the page contents before removal
            doc._deleteObject(xref)  # pylint: disable=protected-access

    return doc

def remove_pages(
        doc: fitz.Document,
        pages_to_remove: Iterable[int]
    ) -> fitz.Document:
    """
    Remove specific pages from the PDF file

    Arguments
    ---------
    doc : fitz.Document
        The input PDF document

    pages_to_remove : Iterable[int]
        List of page numbers to remove

    Returns
    -------
    fitz.Document
        The modified PDF document
    """
    # Sorting the list in descending order to avoid re-indexing issues
    pages_to_remove = sorted(pages_to_remove, reverse=True)
    for page_number in filter(lambda x: x < doc.page_count, pages_to_remove):
        doc.delete_page(page_number)

    return doc

def parse_args() -> argparse.Namespace:
    """ Parse command-line arguments """
    parser = argparse.ArgumentParser(description='Remove images and pages from a PDF file')

    parser.add_argument('--input', type=Path, required=True,
                        help='Path to the PDF file')
    parser.add_argument('--start', type=int, default=-1,
                        help='Start page number to remove (0-indexed)')
    parser.add_argument('--end', type=int, default=-1,
                        help='End page number to remove (0-indexed)')
    return parser.parse_args()

def extract_text_from_pdf(
        doc: fitz.Document
    ) -> str:
    """
    Extract text from a PDF file

    Arguments
    ---------
    doc : fitz.Document
        The input PDF document

    Returns
    -------
    str
        The extracted text from the PDF
    """
    full_text = ""
    for page_num in range(len(doc)):
        page = doc.load_page(page_num)
        page_text = page.get_text()
        full_text += f"Page {page_num + 1}:\n{page_text}\n\n"

    return full_text

def main(): # pylint: disable=missing-function-docstring
    args = parse_args()

    fname: Path = args.input
    if not fname.exists():
        raise FileNotFoundError(f'File "{fname}" does not exist')

    fsize = fname.stat().st_size
    dirname, basename = fname.parent, fname.name

    with fitz.open(fname) as doc:
        logger.info('Opened "%s"', fname)
        num_pages = doc.page_count

        if args.start == -1:
            args.start = num_pages

        if args.end == -1:
            args.end = num_pages

        doc = remove_images(doc)
        doc = remove_pages(doc, range(args.start, args.end))

        fname = dirname / f'output_{basename}'
        doc.save(fname)
        logger.info('Saved the modified PDF as "%s"', fname)
        logger.info('File size: %s -> %s',
                    human_readable_size(fsize), human_readable_size(fname.stat().st_size))
        logger.info('Pages: %d -> %d', num_pages, doc.page_count)


if __name__ == "__main__":
    main()
