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



        


}
