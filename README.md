# unstructured_pdf
Docker image for unstructured+langchain PDF document loading with OCR

```bash
docker build --target ready -t unstructured_pdf .
docker run --rm -it unstructured_pdf python
```

```python
from langchain_community.document_loaders import UnstructuredFileLoader
loader = UnstructuredFileLoader("/home/appuser/.dockerinit/test.pdf")
docs = loader.load()
```

# Links
* https://unstructured-io.github.io/unstructured/
* https://python.langchain.com/docs/integrations/providers/unstructured

# TODO
* [x] Add OCR
* [ ] More robust layout support
* [ ] Table support
* [ ] Markdown conversion with LLM support
* [ ] Reduce image size
