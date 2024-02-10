import spacy
import os
import shutil
from dicttoxml import dicttoxml
# Silence Pandas deprecation warning (#54466)
import pyarrow
import pandas as pd
import json

nlp = spacy.load('en_core_web_md')


def read_text_files(filepath, word: str):
    with open(filepath, 'r', encoding='utf8') as f:
        read_file = f.read()
        string_file = str(read_file)

        tokens = nlp(string_file)

        word_of_interest = nlp(word)

        high_similarity_dict = {}
        for token in tokens:
            if token and token.vector_norm:
                if word_of_interest.similarity(token) > .3:
                    high_similarity_dict[token] = word_of_interest.similarity(token)

        high_similarity_reduced = {}
        for key, value in high_similarity_dict.items():
            if value not in high_similarity_reduced.values():
                high_similarity_reduced[key] = value

        sorted_sim_values = sorted(high_similarity_reduced.items(), key=lambda x: x[1], reverse=True)
        return dict(sorted_sim_values)


def output_file_json(dir_name: str, file_name: str, similarity_data: dict):
    string_keys = {str(key): val for key, val in similarity_data.items()}
    with open(f'{dir_name}/{file_name}.json', 'w') as file_handle:
        json.dump(string_keys, file_handle)


def output_file_csv(dir_name: str, file_name: str, similarity_data: dict):
    df = pd.DataFrame.from_dict(similarity_data.items(), orient="columns")
    df.columns = ['token', 'similarity']
    df.to_csv(f'{dir_name}/{file_name}.tsv', sep='\t', index=False, encoding='utf-8')


def output_file_xml(dir_name: str, file_name: str, similarity_data: dict):
    # The XML parser sometimes complains about non-string values. Reformatting
    similarity_data_str = dict()
    for key, value in similarity_data.items():
        similarity_data_str[f'{key}'] = f'{value}'

    xml = dicttoxml(similarity_data_str)
    with open(f'{dir_name}/{file_name}.xml', 'w') as xml_file:
        xml_decode = xml.decode()
        xml_file.write(xml_decode)
        xml_file.close()


output_formatters = {
    "JSON": output_file_json,
    "csv": output_file_csv,
    "xml": output_file_xml
}
#this right here organizes all the file formats into a list

if __name__ == '__main__':
    working_dir = os.getcwd()
    inside_dir = os.listdir(working_dir)
    coll_path = os.path.join(working_dir, 'textCollection')

    word = input("Enter the word of interest: ")

    with open('similarityReadings.txt', 'a', encoding='utf8') as f:
        for file in sorted(os.listdir(coll_path)):
            if file.endswith(".txt"):
                filepath = f"{coll_path}/{file}"
                similarity_data = read_text_files(filepath, word)
                f.write(filepath + '\n')
                f.write(str(similarity_data) + '\n\n')

    for identifier, _ in output_formatters.items():
        if os.path.exists(f"{identifier}-output"):
            shutil.rmtree(f"{identifier}-output")
        os.mkdir(f"{identifier}-output")

    for file in sorted(os.listdir(coll_path)):
        if file.endswith(".txt"):
            filepath = f"{coll_path}/{file}"
            filename_txt = os.path.basename(filepath).split('/')[-1]
            filename = filename_txt[:-4]
            similarity_data = read_text_files(filepath, word)

            for identifier, fn in output_formatters.items():
                print(f"Outputting similarity data as {identifier}")
                fn(f'{identifier}-output', filename, similarity_data)