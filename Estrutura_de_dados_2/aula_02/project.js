function dijkstra(graph, startNode) {
  let distances = {};
  let previousNodes = {};
  let paths = {};

  for (let node in graph) {
    distances[node] = Infinity;
    previousNodes[node] = null;
  }
  distances[startNode] = 0;

  let visited = {};

  while (true) {
    let closestNode = null;
    for (let node in distances) {
      if (!visited[node]) {
        if (closestNode === null || distances[node] < distances[closestNode]) {
          closestNode = node;
        }
      }
    }

    if (closestNode === null || distances[closestNode] === Infinity) {
      break;
    }

    for (let neighbor in graph[closestNode]) {
      let distance = distances[closestNode] + graph[closestNode][neighbor];
      if (distance < distances[neighbor]) {
        distances[neighbor] = distance;
        previousNodes[neighbor] = closestNode;
      }
    }

    visited[closestNode] = true;
  }

  for (let node in distances) {
    paths[node] = buildPath(previousNodes, node);
  }

  return { distances, paths };
}
function findAllPaths(
  graph,
  startNode,
  endNode,
  visited = {},
  path = [],
  allPaths = [],
  visitLimit = 2
) {
  path.push(startNode);
  visited[startNode] = (visited[startNode] || 0) + 1;

  if (startNode === endNode) {
    allPaths.push([...path]);
  } else {
    for (let neighbor in graph[startNode]) {
      if (!visited[neighbor] || visited[neighbor] < visitLimit) {
        findAllPaths(
          graph,
          neighbor,
          endNode,
          visited,
          path,
          allPaths,
          visitLimit
        );
      }
    }
  }

  path.pop();
  visited[startNode] -= 1;
}

function calculatePathCost(graph, path) {
  let cost = 0;
  for (let i = 0; i < path.length - 1; i++) {
    cost += graph[path[i]][path[i + 1]];
  }
  return cost;
}
function getAllPathsAndCosts(graph, startNode, endNode) {
  let allPaths = [];
  findAllPaths(graph, startNode, endNode, {}, [], allPaths);

  return allPaths.map((path) => ({
    path,
    cost: calculatePathCost(graph, path),
  }));
}

function findShortestPath(pathsWithCosts) {
  return pathsWithCosts.reduce(
    (min, current) => (current.cost < min.cost ? current : min),
    pathsWithCosts[0]
  );
}

const graph = {
  POUSO: { PTR: 35.2 },
  PTR: { POUSO: 35.2, PRG: 28.0, IBI: 12.0 },
  PRG: { PTR: 28.0, PDN: 85.8, IBI: 66.0, RDS: 20.0 },
  PDN: { PRG: 85.8, AGRO: 18.0, RDS: 92.4, LON: 3.0 },
  AGRO: { PDN: 18.0 },
  IBI: { PTR: 12.0, ITU: 13.2, RDS: 9.0, AUR: 15.0, PRG: 66.0 },
  ITU: { IBI: 13.2 },
  RDS: { IBI: 9.0, PRG: 20.0, LON: 4.5, LAU: 46.2, AUR: 9.0, PDN: 92.4 },
  LON: { RDS: 4.5, SAL: 8.8, TAIO: 7.5, LAU: 19.8, PDN: 3.0 },
  SAL: { LON: 8.8 },
  TAIO: { LON: 7.5 },
  AUR: { IBI: 15.0, IMBUIA: 26.4, RDS: 9.0 },
  IMBUIA: { AUR: 26.4 },
  LAU: { RDS: 46.2, LON: 19.8, WIT: 12.0 },
  WIT: { LAU: 12.0 },
};

const startNode = "POUSO";
const endNode = "RDS";

const allPathsAndCosts = getAllPathsAndCosts(graph, startNode, endNode);

console.log(
  `\n\n\n\nPossibilidades de caminhos de ${startNode} para ${endNode}:`
);
allPathsAndCosts.forEach((p, index) => {
  console.log(
    `Possibilidade ${index + 1} (Custo: ${p.cost.toFixed(2)}): ${p.path.join(
      " > "
    )}`
  );
});

const shortestPath = findShortestPath(allPathsAndCosts);
console.log(
  `\n\nCaminho com menor custo: ${shortestPath.path.join(
    " > "
  )} (Custo: ${shortestPath.cost.toFixed(2)})\n\n\n\n`
);
