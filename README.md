# MegatronLM Dataset with AutoTokenizer

## What's the difference between `GPT-NeoX` or `Megaton-LM`?

- `GPT-NeoX` is a fork of `Megatron-LM` with some additional features.
- `GPT-NeoX` supports various tokenizers than `Megatron-LM`, such as `LlamaTokenizer`, `HFGPT2Tokenizer`, or `TiktokenTokenizer`.

However, both repository does not support Transformers `AutoTokenizer` out of the box.

That's why I made this repository.

In this repository:

- You can encode your dataset with any `AutoTokenizer`-compatible tokenizer.

## Prepare the dataset

- Checkout `examples/sample_dataset.jsonl` for the format of the dataset.

```js
// examples/sample_dataset.jsonl
{"text": "This is the first sentence."}
{"text": "This is the second sentence."}
// ...
```

## Prepare the Environment

- Install the dependencies

```bash
pip install -r requirements.txt
```

for more details, please checkout [requirements.frozen.txt](requirements.frozen.txt).

## Encode the dataset

- Encode the dataset with the following command
- Check sample shell file:[run.sh](run.sh)

```bash
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
```

## Notes

Your JSONL file must NOT contain any empty lines.

Example(This makes error):

```json
{"text": "This is the first sentence."}
{"text": "This is the second sentence."}
// YOU SHOULD NOT HAVE EMPTY LINE HERE
{"text": "This is the third sentence."}
```

JSON above will cause this error:

```
jsonlines.jsonlines.InvalidLineError: line contains invalid json: Expected object or value (line 3)
```

This is OK:

```json
{"text": "This is the first sentence."}
{"text": "This is the second sentence."}
```

## Acknowledgement

This repo codes are partially copied/edited from [EleutherAI/gpt-neox @ 10bf78](https://github.com/EleutherAI/gpt-neox/commit/10bf78871e214f8d0e3bc8662f968e367587a516).
