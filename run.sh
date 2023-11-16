# Create output directory
mkdir -p data-sample/
# Encode the dataset
python preprocess_data.py \
--input examples/sample_dataset.jsonl \
--tokenizer-type AutoTokenizer \
--vocab-file beomi/llama-2-ko-7b \
--output-prefix data-sample/out \
--dataset-impl mmap \
--workers 10
