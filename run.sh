mkdir -p data/
python preprocess_data.py \
--input ../falcon_korean_stack_hq_w_trans.jsonl \
--tokenizer-type AutoTokenizer \
--vocab-file beomi/llama-2-ko-7b \
--output-prefix data/ \
--dataset-impl mmap \
--workers 100 \
