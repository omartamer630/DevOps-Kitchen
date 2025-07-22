from translatepy import Translator

translator = Translator()

file_name = 'Lab/translatethis.txt'

with open(file_name, 'r', encoding='utf-8') as file:
    contents = file.read()
    print("Original:\n", contents)

translation = translator.translate(contents, "Japanese")

with open('translated.txt', 'a') as file_writer:
    file_writer.write(translation.result + '\n')

print("Translated:\n", translation.result)
