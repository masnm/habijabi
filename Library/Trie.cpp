#include <bits/stdc++.h>

using namespace std;

#define endl '\n'
typedef long double ld;
typedef long long int ll;
typedef unsigned long long ull;

const ll inf = 1e18 + 5;
const ll mod = 1e9 + 7;

template<typename T> void chmax ( T& a, T b ) { if ( a < b ) a = b; }
template<typename T> void chmin ( T& a, T b ) { if ( a > b ) a = b; }

void prepare_lookup_table ()
{
}

void do_task ()
{
	int n; cin >> n;
	vector<int> v ( n );
	for ( int& i : v ) cin >> i;
	
	// build trie
	int N = 0;
	vector<vector<int>> trie ( 1, vector<int>(2, -1) );
	for ( const int& x : v ) {
		int node = 0;
		for ( int i = 30 ; i > -1 ; --i ) {
			int bit = ( x & (1<<i) ? 1 : 0 );
			if ( trie[node][bit] == -1 ) {
				trie.emplace_back( vector<int>(2, -1) );
				trie[node][bit] = ++N;
				node = N;
			} else {
				node = trie[node][bit];
			}
		}
	}
	
	// do calculation
	int ans = 0;
	for ( const int& x : v ) {
		int y = 0;
		int node = 0;
		for ( int i = 30 ; i > -1 ; --i ) {
			if ( x & (1<<i) ) {               // x[y] = 1;
				if ( trie[node][0] != -1 ) {  // have a 0 hare
					node = trie[node][0];
				} else {
					node = trie[node][1];
					y |= (1<<i);
				}
			} else {
				if ( trie[node][1] != -1 ) {  // have a 0 hare
					node = trie[node][1];
					y |= (1<<i);
				} else {
					node = trie[node][0];
				}
			}
		}
		chmax ( ans, x ^ y );
	}
	cout << ans << endl;
}

int main ()
{
	ios_base::sync_with_stdio(false);
	cin.tie(0);

	prepare_lookup_table();

	int t = 1;
	//cin >> t;
	for ( int i = 1 ; i <= t ; ++i ) {
//		cout << "Case " << i << ": " ;
		do_task();
	}


	return 0;
}
