import os

from langchain_community.document_loaders import UnstructuredFileLoader

if __name__ == "__main__":
    this_dir = os.path.dirname(os.path.abspath(__file__))
    pdf_files = [
        os.path.join(this_dir, f)
        for f in os.listdir(this_dir)
        if f.lower().endswith(".pdf")
    ]
    try:
        pdf_file = pdf_files[0]
    except IndexError:
        raise FileNotFoundError("No PDF files found in this directory")
    print(f"Loading {pdf_file}")
    loader = UnstructuredFileLoader(pdf_file)
    docs = loader.load()
    print("All done")
