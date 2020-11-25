# Pesquisa-Mercado-TI
Pesquisa do Mercado de TI na cidade de São Paulo nos meses de Janeiro a Setembro de 2020

Este repositório contém as bases de dados utilizadas para a realização da pesquisa de mercado de TI na cidade de São Paulo nos meses de Janeiro a Setembro de 2020, que serviu de base para o artigo final da disciplina de Métodos Inferenciais Avançados em Pesquisa Legislativa do Mestrado Profissional em Poder Legislativo da Câmara dos Deputados.

Contém os seguintes arquivos:

1) LeCAGED.R - Script R que gera o arquivo cagedmov2020.csv que contém todos os dados das movimentações do Novo CAGED de Janeiro a Setembro, com os dados disponibilizados no diretório de setembro do endereço ftp://ftp.mtps.gov.br/pdet/microdados/NOVO%20CAGED/Movimenta%E7%F5es/2020/Setembro/ . Descartando as movimentações de contratações que tiverem o salário ou as horas contratuais iguais a zero. O arquivo csv mesmo compactado excede o tamanho máximo de arquivo no github;

2) LeCAGEDSP.R - Script R que gera o arquivo cagedmovsp.csv que contém todas as movimentações referentes ao município de São Paulo a partir do arquivo cagedmov2020.csv gerado pelo script anterior;

3) LeCAGEDSPTI.R - Script que gera os arquivos csv listados abaixo no item 4 e 5 a partir do arquivo cagedmovsp.csv gerado pelo script anterior;

4) contratacaospti.csv - Contém as admissões de “Analista de Desenvolvimento de Sistemas” e “Programador de Sistemas de Informação” no município de São Paulo entre janeiro e setembro de 2020

5) demissaospti.csv - Contém os desligamentos de “Analista de Desenvolvimento de Sistemas” e “Programador de Sistemas de Informação” no município de São Paulo entre janeiro e setembro de 2020

6) retirados.csv- Contém as observações de "Analista de Desenvolvimento de Sistemas" que foram retiradas, por serem outliers, para alcançar a normalidade

