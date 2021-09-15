struct BIT {
	vector<ll> bit;
	int n;
	BIT ( int _n ) : n(_n + 1)
	{
		bit.resize(n);
	}
	BIT ( const vector<int>& _v ) : BIT( _v.size() )
	{
		for ( int i = 0 ; i < n ; ++i ) add ( i, _v[i] );
	}
	ll sum ( int r )
	{
		ll ans = 0;
		for ( ++r ; r > 0 ; r -= ( r & ( -r ) ) ) ans += bit[r];
		return ans;
	}
	ll sum ( int l, int r )
	{
		return sum ( r ) - sum ( l - 1 );
	}
	void add ( int i, ll val )
	{
		for ( ++i ; i < n ; i += ( i & (-i) ) ) bit[i] += val;
	}
};
