{ 
   Matriz de adjacencia

        É uma estrutura de dados do tipo matriz de ordem N aonde as arestas
        adjacentes aos vértices “colunas e linhas” são representadas pelo
        número UM, caso contrário os zeros. Havendo laços a representação
        ocorre na diagonal principal, havendo arestas paralelas a representação
        ocorre indicando o numero de arestas nos vértices adjacentes.

        Caso o grafo seja dirigido, a representação ocorre do vértice sainte
        para o vértice entrante.



   Matriz de adjacência e Grafos em Pascal

        Em Pascal, uma matriz de adjacência pode ser representada como um array
        bidimensional. A matriz de adjacência é útil para representar grafos,
        onde cada célula (i, j) na matriz indica a presença de uma aresta entre
        o vértice i e o vértice j. Se houver uma aresta, a célula contém 1;
        caso contrário, contém 0. Para grafos dirigidos, a matriz é preenchida
        de acordo com a direção das arestas, e laços (arestas que conectam um
        vértice a si mesmo) são representados na diagonal principal.

        Exemplo de representação de uma matriz de adjacência em Pascal:
        
        const
          N = 4;  // Número de vértices
        type
          TAdjMatrix = array[1..N, 1..N] of Integer;
        
        var
          AdjMatrix: TAdjMatrix;
        
        begin
          // Inicializa a matriz com zeros
          for i := 1 to N do
            for j := 1 to N do
              AdjMatrix[i, j] := 0;
        
          // Adiciona arestas (por exemplo, entre o vértice 1 e 2)
          AdjMatrix[1, 2] := 1;
          AdjMatrix[2, 3] := 1;
          AdjMatrix[3, 4] := 1;
          AdjMatrix[4, 1] := 1;
        
          // Para um laço no vértice 2
          AdjMatrix[2, 2] := 1;
        
          // Exemplo de visualização da matriz
          for i := 1 to N do
          begin
            for j := 1 to N do
              Write(AdjMatrix[i, j]:4);
            Writeln;
          end;
        end.

        Este código exemplifica a criação e a visualização de uma matriz de
        adjacência para um grafo com 4 vértices.

    Grafo Dirigido (ou Digrafo)
  
        Direção das Arestas: As arestas têm uma direção específica. Isto significa que se
        existe uma aresta do vértice A para o vértice B, essa conexão é unidirecional e
        não implica uma conexão de B para A, a menos que explicitamente especificado.
        Representação: Em uma matriz de adjacência, se houver uma aresta do vértice i para
        o vértice j, a célula (i, j) conterá 1. A célula (j, i) conterá 0, a menos que haja
        também uma aresta de j para i.
        Exemplo: Redes sociais, onde uma pessoa pode seguir outra, mas isso não implica necessariamente reciprocidade.

    Grafo Não Dirigido
        Direção das Arestas: As arestas não têm direção. Isto significa que se existe
        uma aresta entre o vértice A e o vértice B, essa conexão é bidirecional.
        A conexão de A para B implica uma conexão de B para A.
        Representação: Em uma matriz de adjacência, se houver uma aresta entre
        os vértices i e j, ambas as células (i, j) e (j, i) conterão 1.
        Exemplo: Redes de amizade, onde uma relação de amizade é mutuamente reconhecida.


  MATRIZ DE CUSTO

    segue as mesmas regras da matris de adjascencia, porem ao inves de se
    informar 1 ou 0, coloca-se o custo para representar a aresta


}
