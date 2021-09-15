#include <bits/stdc++.h>

using namespace std;

#define endl '\n'
typedef long double ld;
typedef long long int ll;
typedef unsigned long long ull;

const ll inf = 1e18 + 5;

template<typename T> void chmax ( T& a, T b ) { if ( a < b ) a = b; }
template<typename T> void chmin ( T& a, T b ) { if ( a > b ) a = b; }

void prepare_lookup_table ()
{
}

//...................................................................dd
//
// int up[N][LOG]
// up[v][j] --- 2^j - th ancestor of v
// { ok when ( parent is < child ) in term of number or sorted }
// for v = 0 ... N-1:
//    up[v][0] = parent[v]
//    for j = 1 ... LOG - 1:
//       up[v][j] = up[ up[v][j-1] ][j-1]
//
// { ok when numbers are random }
//  for v = 0 ... N - 1 :
//      up[v][0] = parent[v]
//  for j = 1 ... LOG - 1 :
//      for v = 0 ... N - 1 :
//          up[v][j] = up[ up[v][j-1] ][j-1]
//
//...................................................................dd

class TreeAncestor {
	vector<vector<int>> up;
	vector<int> depth;
	int log;
public:
	// preprocessing in  N*Log(N) time and space
	TreeAncestor ( int n, vector<int>& parent ) {
		log = 0;
		while ( ( 1<<log ) <= n ) {
			++log;
		}
		up = vector<vector<int>> ( n, vector<int>( log ) );
		depth = vector<int>( n );
		// up[v][j] is 2^j - th ancestor of node v
		parent[0] = 0; // this is magic :)
		for ( int v = 0 ; v < n ; ++v ) {
			up[v][0] = parent[v];
			if ( v != 0 ) {
				depth[v] = depth[ parent[v] ] + 1;
			}
			for ( int j = 1 ; j < log ; ++j ) {
				up[v][j] = up[ up[v][j-1] ][j-1];
			}
		}
	}
	int getKthAncestor ( int node, int k ) {
		if ( depth[node] < k ) {
			return -1;
		}
		for ( int j = 0 ; j < log ; ++j ) {
			if ( k & ( 1 << j ) ) {
				node = up[node][j];
			}
		}
		return node;
	}
};

void do_task ()
{
}

int main ()
{
	ios_base::sync_with_stdio(false);
	cin.tie(0);

	prepare_lookup_table();

	int t = 1;
	cin >> t;
	for ( int i = 1 ; i <= t ; ++i ) {
//		cout << "Case " << i << ": " ;
		do_task();
	}


	return 0;
}
