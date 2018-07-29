def gerar_json(lista, arquivo):
    print( ' ** Gerando '+arquivo )
    try:
        to_unicode = unicode
    except NameError:
        to_unicode = str

    data = {'lista': lista}

    with io.open(arquivo, 'w', encoding='utf8') as outfile:
        str_ = json.dumps(data,
                          indent=4, sort_keys=True,
                          separators=(',', ': '), ensure_ascii=False)
        outfile.write(to_unicode(str_))


def format_coluna_csv(valor):
    return str(valor).replace('\r', ' ').replace('\n', ' ').replace(';', '\\;')


def gerar_csv(lista, arquivo):
    print( ' ** Gerando '+arquivo )

    f = open(arquivo, 'w')
    f.write( 'Data;Valor;Tipo;Responsavel;Usuario;Localidade;Justificativa;Pagina\n' )

    for despesa in lista:
        linha = format_coluna_csv(despesa['Data'])
        linha = linha + ';' + format_coluna_csv(despesa['Valor'])
        linha = linha + ';' + format_coluna_csv(despesa['Tipo'])
        linha = linha + ';' + format_coluna_csv(despesa['Responsavel'])
        linha = linha + ';' + format_coluna_csv(despesa['Usuario'])
        linha = linha + ';' + format_coluna_csv(despesa['Localidade'])
        linha = linha + ';' + format_coluna_csv(despesa['Justificativa'])
        linha = linha + ';' + format_coluna_csv(despesa['Pagina'])
        f.write(linha+'\n')
