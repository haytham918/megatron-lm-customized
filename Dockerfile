FROM nvcr.io/nvidia/pytorch:23.10-py3
WORKDIR /run
COPY . .

RUN pip install datasets nltk

RUN python get_data.py

RUN python tools/preprocess_data.py \
       --input wikitext.json \
       --output-prefix wikitext \
       --vocab-file gpt2-vocab.json \
       --tokenizer-type GPT2BPETokenizer \
       --merge-file gpt2-merges.txt \
       --workers 32 \
       --append-eod

CMD [ "bash" ]